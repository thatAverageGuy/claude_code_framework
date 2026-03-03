# Hooks Configuration

Hooks provide deterministic automation at key lifecycle points.
They fire without token cost for deciding whether to act.

────────────────────────────────────────────────────────
## ACTIVE HOOKS
────────────────────────────────────────────────────────

### SessionStart — Memory Loader
**Event**: `SessionStart`
**What**: Reads `memory/goals.md` and most recent episodic entry,
echoes content to Claude's context.
**Why**: Every session starts informed without Claude spending
tokens deciding what to load.

### PreCompact — Working Snapshot
**Event**: `PreCompact`
**What**: Prompts Claude to write `memory/working_snapshot.md`
with current task state, in-flight work, and key decisions
before compaction wipes the context.
**Why**: CONTEXT.md is written at session end — stale mid-session.
This captures live state right before compaction happens.

### SessionStart (compact) — Post-Compact Re-inject
**Event**: `SessionStart` (matcher: `compact`)
**What**: Re-injects working snapshot (if exists), CONTEXT.md,
and goals after compaction.
**Why**: Compaction loses detailed instructions. Working snapshot
provides fresh mid-session state. CONTEXT.md and goals provide
broader project context.

### PostToolUse — Raw Logger
**Event**: `PostToolUse`
**What**: Captures full hook input (tool name, tool input, tool
response) via stdin and appends to `memory/raw/YYYY-MM-DD.md`.
**Why**: Zero-token audit trail with full detail. Hook reads
stdin (JSON with tool_input + tool_response). Async so it
doesn't block.

### Stop — Session End Reminder
**Event**: `Stop`
**What**: Prompts Claude to consider updating episodic memory
and CONTEXT.md if significant work was done.
**Why**: Safety net for session handoff. Reminds even if Claude
forgets.

### SessionEnd — Token Usage Tracker
**Event**: `SessionEnd`
**What**: Parses session transcript JSONL, extracts cumulative
token counts, appends structured row to `memory/usage/YYYY-MM-DD.md`.
**Why**: Hard data on token consumption per session. Correlate
with raw logs to see which work patterns cost the most.
**Requires**: `jq` installed and on PATH.
**Script**: `.claude/hooks/track-usage.sh`

────────────────────────────────────────────────────────
## CONFIGURATION
────────────────────────────────────────────────────────
All hooks configured in `.claude/settings.json`.
See the settings file for exact configuration.

Hook scripts live in `.claude/hooks/` when they need
more than a one-liner.

────────────────────────────────────────────────────────
## ADDING PROJECT-SPECIFIC HOOKS
────────────────────────────────────────────────────────
Projects may need additional hooks. Common additions:

- **PreToolUse** on `Edit|Write` — protect sensitive files
- **PostToolUse** on `Edit|Write` — auto-format with project linter
- **SubagentStop** — cleanup after specific agents

Add to `.claude/settings.json` or `.claude/settings.local.json`
for personal hooks.
