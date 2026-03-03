# CONTEXT.md Protocol

CONTEXT.md is the session resumption file.
Lives at project root for fast access.
A new session reads this FIRST, then follows the pointers.

────────────────────────────────────────────────────────
## UPDATE RULES
────────────────────────────────────────────────────────
- Updated at every commit (part of commit procedure)
- Previous session context archived to `docs/dev/session_context/`
  (format: `session_YYYY-MM-DD.md`) before overwriting
- Must reflect TRUE current state — not aspirational state

────────────────────────────────────────────────────────
## FORMAT
────────────────────────────────────────────────────────

```markdown
# CONTEXT

## Current State
**Task**: T-012 | **Phase**: Implementation | **Status**: IN_PROGRESS
**Branch**: dev | **Last Commit**: a3f8c2d | **Date**: 2026-02-22

## Previous Session Summary
[What was accomplished — enough to understand trajectory]
- Completed JWT validation middleware (T-012 partial)
- Decided on RS256 over HS256 (see ADR-005)

## Current Task State
- Core middleware logic: DONE
- Unit tests: DONE (12/12 passing)
- Integration tests: NOT STARTED

## Next Steps
1. [ ] Write integration tests for T-012
2. [ ] Run commit procedure
3. [ ] Begin planning T-013

## Open Questions / Decisions Pending
- Refresh tokens: DB or Redis? (awaiting user response)

## Blockers
None | [or describe]

## Quick Links
- Active task: docs/dev/tasks/T-012/DETAIL.md
- Architecture: docs/dev/ARCHITECTURE.md
- Tasks index: docs/dev/tasks/TASKS.md
```
