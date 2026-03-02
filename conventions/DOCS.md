# Documentation Update Rules

## By Change Level
L1 — SURGICAL
- Update inline comments if logic changed.
- No doc file updates required unless directly affected.

L2 — LOCAL
- Update README.md if user-facing behavior changed.
- Update relevant docs/dev/ file if interface changed.
- Update CONTEXT.md always.

L3 — STRUCTURAL
- Update ARCHITECTURE.md — component diagram, data flow, stack table.
- Update STATE_MACHINES.md if state logic changed.
- Update ADR if a prior decision was revised.
- Update README.md, CONTEXT.md always.

## Rules
- Docs update happens in W2 before commit, never after.
- Never let code and docs diverge. If they conflict, docs are wrong — fix docs first.
- CONTEXT.md is updated every W2 regardless of change level.