# Task Convention

## TASKS.md Structure
docs/dev/tasks/TASKS.md — master task list

### Sections
| ID     | Summary          | Status      | Depends On | Detail                  |
|--------|------------------|-------------|------------|-------------------------|
| T-001  | [feature]        | TODO        | —          | docs/dev/tasks/T-001/   |

## Status Values
TODO        Not started
IN_PROGRESS Active, current session
BLOCKED     Waiting on dependency or decision
DONE        Completed, committed, tested
BF-XXX      Bug fix task, same lifecycle

## Task Directory Structure
docs/dev/tasks/<TASK-ID>/
├── DETAIL.md     # Requirements, acceptance criteria, approach
└── IMPL_LOG.md   # Created during W2 — what was done, decisions, deviations

## DETAIL.md Format
# T-XXX: <Title>
## Goal
## Acceptance Criteria
## Approach
## Dependencies
## Notes

## IMPL_LOG.md Format
# T-XXX: Implementation Log
## What Was Done
## Decisions Made
## Deviations from DETAIL.md (if any)
## Bugs Found (BF-XXX refs if any)
## Test Coverage Summary

## Rules
- Only one task IN_PROGRESS at a time.
- DETAIL.md must exist before work begins.
- IMPL_LOG.md is created during W2, not before.
- Never mark DONE without passing tests and user approval.