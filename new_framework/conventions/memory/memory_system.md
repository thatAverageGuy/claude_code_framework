# Memory System

Project-scoped persistent memory across sessions. Human-readable
markdown files organized by type.

────────────────────────────────────────────────────────
## DESIGN PRINCIPLES
────────────────────────────────────────────────────────
- Human-readable and editable (plain markdown)
- Git-versionable (track changes over time)
- Per-project (not global — each project has its own memory)
- Organic growth (no empty placeholder files — create when needed)
- Minimal writes (a few focused lines, not verbose paragraphs)

────────────────────────────────────────────────────────
## DIRECTORY STRUCTURE
────────────────────────────────────────────────────────

```
project-root/
├── memory/
│   ├── raw/                     # Audit trail (append-only, hook-written)
│   │   └── YYYY-MM-DD.md
│   ├── episodic/                # Session logs (distilled)
│   │   └── YYYY-MM-DD.md
│   ├── usage/                   # Token usage (hook-written)
│   │   ├── YYYY-MM-DD.md        # Daily summary table
│   │   └── sessions/            # Per-session detail (every API call)
│   │       └── <session-id>.md
│   ├── semantic/                # Stable facts (starts empty, grows organically)
│   │   └── [created as needed]
│   ├── procedural/              # Learned patterns (starts empty, grows organically)
│   │   └── [created as needed]
│   ├── goals.md                 # Project goals by timeframe
│   └── working_snapshot.md      # Ephemeral — pre-compact state (auto-deleted)
```

No empty template files. Directories are created when
there's something to write.

────────────────────────────────────────────────────────
## MEMORY TYPES
────────────────────────────────────────────────────────

| Type | Purpose | Write when | Read when |
|------|---------|-----------|-----------|
| Raw | Audit trail | Automatic (hook) | Rarely — debugging, lookback |
| Episodic | What happened | Session end (`/context-save`) | Session start (most recent) |
| Semantic | What is true | In-place, when facts emerge | When relevant to current work |
| Procedural | What works/doesn't | In-place, when patterns validated | Before implementation work |
| Goals | Where we're headed | When goals change | Every session start |

────────────────────────────────────────────────────────
## READ RULES
────────────────────────────────────────────────────────
At session start (automated by hooks):
- `goals.md` — always
- `episodic/` — most recent entry

During session (on demand):
- `semantic/` — when current work touches a known domain
- `procedural/` — before starting implementation work

Do NOT read all memory files at session start.

────────────────────────────────────────────────────────
## WRITE RULES
────────────────────────────────────────────────────────
- **Raw**: Hook handles it. Zero token cost. Never touch manually.
- **Episodic**: Written by `/context-save` at session end.
- **Semantic**: Write immediately when a fact is established.
  Don't batch for later. Create the file if it doesn't exist.
- **Procedural**: Write immediately when a pattern is validated
  or a failure is worth remembering. Don't batch for later.
- **Goals**: Update when goals change, milestones hit, priorities shift.
- **Working snapshot**: Written by PreCompact hook. Deleted by
  `/context-save`. Ephemeral — exists only to survive compaction.

────────────────────────────────────────────────────────
## RETENTION
────────────────────────────────────────────────────────
- **Raw**: Accumulates indefinitely. One file per day.
- **Episodic**: Accumulates. Clean up manually when it bothers you.
- **Semantic**: Update in-place. Remove facts that aren't true anymore.
- **Procedural**: Update in-place. Remove patterns that no longer apply.
- **Goals**: Move completed goals to "Recently Completed", remove
  after ~30 days (they live on in episodic memory).
