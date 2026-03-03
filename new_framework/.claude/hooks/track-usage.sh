#!/usr/bin/env bash
# track-usage.sh — SessionEnd hook
# Parses session transcript and writes a detailed usage report.
# Requires: jq
#
# Output structure:
#   memory/usage/YYYY-MM-DD.md        — daily summary table (one row per session)
#   memory/usage/sessions/<id>.md     — per-session detail (every API call)

set -euo pipefail

INPUT=$(cat)

TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // empty')
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')

if [ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ]; then
  exit 0
fi

if [ -z "$CWD" ]; then
  CWD="$(pwd)"
fi

# Check jq is available
if ! command -v jq &>/dev/null; then
  exit 0
fi

SHORT_SESSION="${SESSION_ID:0:8}"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

USAGE_DIR="${CWD}/memory/usage"
SESSIONS_DIR="${USAGE_DIR}/sessions"
DAILY_FILE="${USAGE_DIR}/${DATE}.md"
SESSION_FILE="${SESSIONS_DIR}/${SHORT_SESSION}.md"

mkdir -p "$SESSIONS_DIR"

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

# ─── Per-session detail file ───

CALL_COUNT=0
PREV_INPUT=0
PREV_OUTPUT=0

{
  echo "# Session: ${SHORT_SESSION}"
  echo "**Date**: ${DATE} ${TIME}"
  echo "**Full ID**: ${SESSION_ID}"
  echo ""
  echo "## API Calls"
  echo ""
  echo "| # | Model | Input | Output | Cache Read | Cache Write | Delta In | Delta Out |"
  echo "|---|-------|-------|--------|------------|-------------|----------|-----------|"
} > "$SESSION_FILE"

echo "$ALL_USAGE" | while IFS= read -r line; do
  CALL_COUNT=$((CALL_COUNT + 1))

  MODEL=$(echo "$line" | jq -r '.message.model // "unknown"')
  IN=$(echo "$line" | jq '.message.usage.input_tokens // 0')
  OUT=$(echo "$line" | jq '.message.usage.output_tokens // 0')
  CR=$(echo "$line" | jq '.message.usage.cache_read_input_tokens // 0')
  CW=$(echo "$line" | jq '.message.usage.cache_creation_input_tokens // 0')

  # Delta from previous call shows what each turn added
  DELTA_IN=$((IN - PREV_INPUT))
  DELTA_OUT=$((OUT - PREV_OUTPUT))

  # Truncate model name for readability
  SHORT_MODEL=$(echo "$MODEL" | sed 's/claude-//' | sed 's/-[0-9]*$//')

  echo "| ${CALL_COUNT} | ${SHORT_MODEL} | ${IN} | ${OUT} | ${CR} | ${CW} | +${DELTA_IN} | +${DELTA_OUT} |" >> "$SESSION_FILE"

  PREV_INPUT=$IN
  PREV_OUTPUT=$OUT
done

# ─── Final totals from last entry ───

LAST=$(echo "$ALL_USAGE" | tail -1)
FINAL_IN=$(echo "$LAST" | jq '.message.usage.input_tokens // 0')
FINAL_OUT=$(echo "$LAST" | jq '.message.usage.output_tokens // 0')
FINAL_CR=$(echo "$LAST" | jq '.message.usage.cache_read_input_tokens // 0')
FINAL_CW=$(echo "$LAST" | jq '.message.usage.cache_creation_input_tokens // 0')
FINAL_TOTAL=$((FINAL_IN + FINAL_OUT))

# Count total API calls
TOTAL_CALLS=$(echo "$ALL_USAGE" | wc -l | tr -d ' ')

{
  echo ""
  echo "## Totals"
  echo "- **API calls**: ${TOTAL_CALLS}"
  echo "- **Input tokens**: ${FINAL_IN}"
  echo "- **Output tokens**: ${FINAL_OUT}"
  echo "- **Cache read**: ${FINAL_CR}"
  echo "- **Cache write**: ${FINAL_CW}"
  echo "- **Total tokens**: ${FINAL_TOTAL}"
} >> "$SESSION_FILE"

# ─── Daily summary table ───

if [ ! -f "$DAILY_FILE" ]; then
  cat > "$DAILY_FILE" << HEADER
# Token Usage: ${DATE}

| Time | Session | Calls | Input | Output | Cache Read | Cache Write | Total |
|------|---------|-------|-------|--------|------------|-------------|-------|
HEADER
fi

echo "| ${TIME} | [${SHORT_SESSION}](sessions/${SHORT_SESSION}.md) | ${TOTAL_CALLS} | ${FINAL_IN} | ${FINAL_OUT} | ${FINAL_CR} | ${FINAL_CW} | ${FINAL_TOTAL} |" >> "$DAILY_FILE"
