# Commit Convention

## Format
<TASK-ID>: <Brief summary> - <What was done>

## Task ID Prefixes
T-XXX    Regular task
BF-XXX   Bug fix (found during another task)
AX-XXX   Infrastructure / bootstrap (no feature task)

## Rules
- One commit per task. No squashing multiple tasks.
- Commit only after full W2 completion and user approval.
- Summary: imperative tense, max 72 chars.
- Never commit directly to main. Always dev branch.
- No WIP commits. Code must be tested before commit.

## Examples
T-003: Add JWT auth middleware - implemented token validation and refresh logic
BF-007: Fix null pointer in user session - added guard clause on session init
AX-000: Project bootstrap - scaffold, docs, initial task backlog