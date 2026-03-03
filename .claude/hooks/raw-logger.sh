#!/usr/bin/env bash
# raw-logger.sh — PostToolUse hook
# Appends full tool call detail to memory/raw/YYYY-MM-DD.md
# Tagged with session ID for cross-referencing with usage logs.
#
# Input: JSON on stdin from Claude Code PostToolUse hook

set -euo pipefail

INPUT=$(cat)

SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // empty' 2>/dev/null)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // "unknown"' 2>/dev/null)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty' 2>/dev/null)

if [ -z "$CWD" ]; then
  CWD="$(pwd)"
fi

SHORT_SESSION="${SESSION_ID:0:8}"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

RAW_DIR="${CWD}/memory/raw"
RAW_FILE="${RAW_DIR}/${DATE}.md"

mkdir -p "$RAW_DIR"

# Write entry with session tag
{
  echo "## ${TIME} [${SHORT_SESSION}] — ${TOOL_NAME}"
  echo '```json'
  echo "$INPUT" | jq '{tool_name, tool_input, tool_response}' 2>/dev/null || echo "$INPUT"
  echo '```'
  echo ""
} >> "$RAW_FILE"
