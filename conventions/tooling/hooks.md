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

### PreCompact — Usage Snapshot + Working Snapshot + Memory Flush
**Event**: `PreCompact`
**What**: Three actions before compaction:
1. Snapshots token usage (same script as SessionEnd)
2. Prompts Claude to write structured `memory/working_snapshot.md`
3. Prompts Claude to flush any unwritten semantic/procedural memory
**Why**: Compaction is a boundary. Capture everything before it's lost:
token state, task state, and any facts/patterns that haven't been
persisted yet.

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
**What**: Parses session transcript JSONL, extracts token counts,
writes per-session detail to `memory/usage/sessions/<id>.md`
and summary row to `memory/usage/YYYY-MM-DD.md`.
Also runs at PreCompact for mid-session snapshots (daily table
shows both "pre-compact snapshot" and "final" entries).
**Why**: Hard data on token consumption. Correlate with raw logs
to see which work patterns cost the most.
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
