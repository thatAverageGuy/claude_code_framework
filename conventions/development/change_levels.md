# Change Level System

All actions must declare a change level.

────────────────────────────────────────────────────────
## LEVELS
────────────────────────────────────────────────────────

**LEVEL 0 — READ ONLY** (default)
- No file modifications
- Questions, analysis, summaries, proposals only

**LEVEL 1 — SURGICAL**
- Edit existing lines only
- No new files, no renaming symbols
- No formatting-only changes
- Max ~20 lines modified per file

**LEVEL 2 — LOCAL**
- Create or modify files within a single logical area
- No cross-cutting refactors
- Public interfaces must remain stable

**LEVEL 3 — STRUCTURAL**
- Multi-file and architectural changes allowed
- New abstractions allowed
- Requires updating ARCHITECTURE.md or creating a new ADR

**DEFAULT**: If no level stated, assume LEVEL 0.
If a requested action violates the declared level, STOP and explain the conflict.

────────────────────────────────────────────────────────
## DOC UPDATE MATRIX
────────────────────────────────────────────────────────

| Document          | L1         | L2              | L3              |
|-------------------|------------|-----------------|-----------------|
| IMPL_LOG.md       | Always     | Always          | Always          |
| TASKS.md          | Always     | Always          | Always          |
| CHANGELOG.md      | Always     | Always          | Always          |
| CONTEXT.md        | Always     | Always          | Always          |
| README.md         | No         | If user-facing  | Always          |
| ARCHITECTURE.md   | No         | No              | Always          |
| STATE_MACHINES.md | No         | If flow changed | Always          |
| ADR               | No         | No              | If decision made|
