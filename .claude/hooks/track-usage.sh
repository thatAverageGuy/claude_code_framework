#!/usr/bin/env bash
# track-usage.sh — Token usage tracker
# Called at PreCompact and SessionEnd.
# Appends segments to per-session file. Each event = one segment.
# Handles compaction correctly: pre-compact peak + post-compact growth = true total.
# Requires: jq

INPUT=$(cat)

# Check jq is available
if ! command -v jq &>/dev/null; then
  exit 0
fi

TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // empty')
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')
EVENT=$(echo "$INPUT" | jq -r '.hook_event_name // "unknown"')

if [ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ]; then
  exit 0
fi

if [ -z "$CWD" ]; then
  CWD="$(pwd)"
fi

SHORT_SESSION="${SESSION_ID:0:8}"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

USAGE_DIR="${CWD}/memory/usage"
SESSIONS_DIR="${USAGE_DIR}/sessions"
DAILY_FILE="${USAGE_DIR}/${DATE}.md"
SESSION_FILE="${SESSIONS_DIR}/${SHORT_SESSION}.md"
MARKER_FILE="${SESSIONS_DIR}/.${SHORT_SESSION}.lastcount"

mkdir -p "$SESSIONS_DIR"

EVENT_LABEL="final"
if [ "$EVENT" = "PreCompact" ]; then
  EVENT_LABEL="pre-compact"
fi

# ─── Extract all assistant messages with usage ───

ALL_USAGE=$(jq -c 'select(
  .type == "assistant" and
  (.isSidechain | not) and
  (.isApiErrorMessage | not) and
  .message.usage != null
)' "$TRANSCRIPT" 2>/dev/null)

if [ -z "$ALL_USAGE" ]; then
  exit 0
fi

TOTAL_CALL_COUNT=$(echo "$ALL_USAGE" | wc -l | tr -d ' ')

# How many calls were already processed in a previous segment?
PREV_COUNT=0
PREV_PEAK_IN=0
PREV_PEAK_OUT=0
if [ -f "$MARKER_FILE" ]; then
  PREV_COUNT=$(sed -n '1p' "$MARKER_FILE")
  PREV_PEAK_IN=$(sed -n '2p' "$MARKER_FILE")
  PREV_PEAK_OUT=$(sed -n '3p' "$MARKER_FILE")
fi

# Only process new calls since last segment
NEW_CALLS=$(echo "$ALL_USAGE" | tail -n +"$((PREV_COUNT + 1))")
NEW_COUNT=$(echo "$NEW_CALLS" | grep -c . || true)

if [ "$NEW_COUNT" -eq 0 ] && [ "$EVENT" = "SessionEnd" ] && [ "$PREV_COUNT" -gt 0 ]; then
  # No new calls since pre-compact — just write grand total
  {
    echo ""
    echo "---"
    echo "## Grand Total (all segments)"
    echo "- **Total API calls**: ${TOTAL_CALL_COUNT}"
    echo "- **Peak input tokens (last segment)**: ${PREV_PEAK_IN}"
    echo "- **Total output tokens**: ${PREV_PEAK_OUT}"
  } >> "$SESSION_FILE"

  # Daily summary
  if [ ! -f "$DAILY_FILE" ]; then
    cat > "$DAILY_FILE" << HEADER
# Token Usage: ${DATE}

| Time | Session | Event | Calls | Input (peak) | Output | Note |
|------|---------|-------|-------|--------------|--------|------|
HEADER
  fi
  echo "| ${TIME} | [${SHORT_SESSION}](sessions/${SHORT_SESSION}.md) | ${EVENT_LABEL} | ${TOTAL_CALL_COUNT} | ${PREV_PEAK_IN} | ${PREV_PEAK_OUT} | no new calls post-compact |" >> "$DAILY_FILE"
  rm -f "$MARKER_FILE"
  exit 0
fi

# ─── Determine segment number ───

SEGMENT=1
if [ "$PREV_COUNT" -gt 0 ]; then
  SEGMENT=2
fi

# ─── Write session file header (only on first segment) ───

if [ "$SEGMENT" -eq 1 ]; then
  {
    echo "# Session: ${SHORT_SESSION}"
    echo "**Date**: ${DATE}"
    echo "**Full ID**: ${SESSION_ID}"
    echo ""
  } > "$SESSION_FILE"
fi

# ─── Write segment ───

CALL_NUM=$PREV_COUNT
PREV_INPUT=0
PREV_OUTPUT=0

# For segment 2, track cumulative from where we left off
SEG_FIRST_IN=0
SEG_LAST_IN=0
SEG_LAST_OUT=0
SEG_FIRST_SEEN=false

{
  echo "## Segment ${SEGMENT}: ${EVENT_LABEL} (${TIME})"
  echo ""
  echo "| # | Model | Input | Output | Cache Read | Cache Write | Delta In | Delta Out |"
  echo "|---|-------|-------|--------|------------|-------------|----------|-----------|"
} >> "$SESSION_FILE"

echo "$NEW_CALLS" | while IFS= read -r line; do
  [ -z "$line" ] && continue
  CALL_NUM=$((CALL_NUM + 1))

  MODEL=$(echo "$line" | jq -r '.message.model // "unknown"')
  IN=$(echo "$line" | jq '.message.usage.input_tokens // 0')
  OUT=$(echo "$line" | jq '.message.usage.output_tokens // 0')
  CR=$(echo "$line" | jq '.message.usage.cache_read_input_tokens // 0')
  CW=$(echo "$line" | jq '.message.usage.cache_creation_input_tokens // 0')

  DELTA_IN=$((IN - PREV_INPUT))
  DELTA_OUT=$((OUT - PREV_OUTPUT))

  # After compaction, first call will have lower input than pre-compact peak
  # Show actual delta (will be negative — that's informative)
  SHORT_MODEL=$(echo "$MODEL" | sed 's/claude-//' | sed 's/-[0-9]*$//')

  echo "| ${CALL_NUM} | ${SHORT_MODEL} | ${IN} | ${OUT} | ${CR} | ${CW} | ${DELTA_IN} | ${DELTA_OUT} |" >> "$SESSION_FILE"

  PREV_INPUT=$IN
  PREV_OUTPUT=$OUT
done

# ─── Segment totals ───

SEG_LAST=$(echo "$NEW_CALLS" | tail -1)
SEG_LAST_IN=$(echo "$SEG_LAST" | jq '.message.usage.input_tokens // 0')
SEG_LAST_OUT=$(echo "$SEG_LAST" | jq '.message.usage.output_tokens // 0')
SEG_LAST_CR=$(echo "$SEG_LAST" | jq '.message.usage.cache_read_input_tokens // 0')
SEG_LAST_CW=$(echo "$SEG_LAST" | jq '.message.usage.cache_creation_input_tokens // 0')

{
  echo ""
  echo "**Segment ${SEGMENT} totals**: ${NEW_COUNT} calls | input: ${SEG_LAST_IN} | output: ${SEG_LAST_OUT} | cache read: ${SEG_LAST_CR} | cache write: ${SEG_LAST_CW}"
  echo ""
} >> "$SESSION_FILE"

# ─── Save marker for next segment ───

if [ "$EVENT" = "PreCompact" ]; then
  echo "${TOTAL_CALL_COUNT}" > "$MARKER_FILE"
  echo "${SEG_LAST_IN}" >> "$MARKER_FILE"
  echo "${SEG_LAST_OUT}" >> "$MARKER_FILE"
else
  # SessionEnd — write grand total if multi-segment
  if [ "$SEGMENT" -gt 1 ]; then
    {
      echo "---"
      echo "## Grand Total"
      echo "- **Total API calls**: ${TOTAL_CALL_COUNT}"
      echo "- **Pre-compact peak input**: ${PREV_PEAK_IN}"
      echo "- **Post-compact final input**: ${SEG_LAST_IN}"
      echo "- **Total output**: ${SEG_LAST_OUT}"
      echo "- **Note**: True token burn = pre-compact peak + post-compact growth."
      echo "  Post-compact input starts lower because context was compressed."
    } >> "$SESSION_FILE"
  fi
  rm -f "$MARKER_FILE"
fi

# ─── Daily summary table ───

if [ ! -f "$DAILY_FILE" ]; then
  cat > "$DAILY_FILE" << HEADER
# Token Usage: ${DATE}

| Time | Session | Event | Calls | Input (peak) | Output | Cache Read | Cache Write |
|------|---------|-------|-------|--------------|--------|------------|-------------|
HEADER
fi

echo "| ${TIME} | [${SHORT_SESSION}](sessions/${SHORT_SESSION}.md) | ${EVENT_LABEL} | ${NEW_COUNT} | ${SEG_LAST_IN} | ${SEG_LAST_OUT} | ${SEG_LAST_CR} | ${SEG_LAST_CW} |" >> "$DAILY_FILE"
