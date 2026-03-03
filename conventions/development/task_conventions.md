# Task Conventions

────────────────────────────────────────────────────────
## TASKS.md (Index Only)
────────────────────────────────────────────────────────
TASKS.md is a lean status table. No details.

```markdown
## Active
| ID    | Summary            | Status      | Depends On | Detail                |
|-------|--------------------|-------------|------------|-----------------------|
| T-012 | Auth middleware     | IN_PROGRESS | T-010      | docs/dev/tasks/T-012/ |

## Completed
| ID    | Summary            | Completed  | Detail                |
|-------|--------------------|------------|-----------------------|
| T-011 | DB connection pool | 2026-02-20 | docs/dev/tasks/T-011/ |

## Blocked
| ID    | Summary       | Blocked By       |
|-------|---------------|------------------|
| T-013 | Rate limiter  | Waiting on T-012 |
```

Statuses: `TODO` → `IN_PROGRESS` → `DONE` or `BLOCKED`
Ordering implies priority (highest first).

**Concurrent tasks**: One task is active at a time. If a task
is blocked, move it to the Blocked table and start the next
unblocked task. CONTEXT.md tracks the active task. When a
blocker resolves, decide with the user which task to resume.

────────────────────────────────────────────────────────
## DETAIL.md (Task Planning)
────────────────────────────────────────────────────────
Lives at: `docs/dev/tasks/<TASK-ID>/DETAIL.md`
Written BEFORE implementation. Open Questions must be empty
before coding starts.

```markdown
# <TASK-ID>: <Title>

## Status
TODO | IN_PROGRESS | DONE

## Requirements
[Exact functional requirements]

## Decisions
- Decision: [what] | Reason: [why] | Alternatives: [what else]

## Success Criteria
- [ ] [Specific, testable criterion]

## Dependencies
- [Task IDs or external dependencies]

## State Machine (if applicable)
[ASCII diagram — mandatory for stateful logic]

## Implementation Guidance
[Step-by-step, self-contained — another LLM should be able to
implement from this alone without broader project context]

## Testing Requirements
- Unit: [specific test cases]
- Integration: [specific scenarios]
- Coverage target: [number or "all critical paths"]

## Open Questions
[MUST be empty before implementation begins]
```

────────────────────────────────────────────────────────
## IMPL_LOG.md (Implementation Log)
────────────────────────────────────────────────────────
Lives at: `docs/dev/tasks/<TASK-ID>/IMPL_LOG.md`
Written DURING and AFTER implementation. Audit-grade detail.

Must be detailed enough to:
1. Understand exactly what was done and why
2. Compare against code diff and find gaps
3. Reconstruct full picture without reading code

```markdown
# Implementation Log: <TASK-ID>

## Summary
[2-3 lines: what and why]

## What Was Done
[Detailed description]

## How It Was Done
[Technical approach, algorithms, patterns]

## Files Changed
| File | Change Type | What Changed |
|------|-------------|--------------|

## Detailed Changes Per File
### <filename> (<Created|Modified>)
- [change details]

## Why These Choices Were Made
[Justification for non-obvious decisions]

## Testing Results
- Unit: X/Y passing
- Integration: X/Y passing
- Coverage: X% on module
- Manual testing: [if applicable]

## Issues Encountered
- Issue: [description] → Resolution: [what was done]

## Impact
[What this affects in broader system]

## Final State
**Status**: DONE | **Commit**: <hash> | **Date**: <date>
```

────────────────────────────────────────────────────────
## TASK COMPLETION CRITERIA
────────────────────────────────────────────────────────
A task is ONLY complete when ALL are true:

1. **Coded** — Implementation complete, follows conventions
2. **Tested** — Tests pass, coverage documented, no skips
3. **Logged** — IMPL_LOG.md complete with audit-grade detail
4. **Documented** — All docs updated per change level rules
5. **Approved** — User explicitly approved all changes
6. **Committed** — Single commit pushed to dev
