---
name: commit
description: Execute the full commit procedure. Use after implementation is complete and tests pass.
disable-model-invocation: true
---

Execute the commit procedure from `conventions/development/git_workflow.md`.

## Steps

1. **Verify completeness**
   - Implementation matches DETAIL.md requirements
   - All success criteria met

2. **Run tests**
   - Execute full test suite: `!`relevant test command`
   - ALL tests must pass. Zero skips. Stop if failures.

3. **Update task docs**
   - Update IMPL_LOG.md with audit-grade detail
   - Update TASKS.md status

4. **Update project docs**
   - Read `conventions/development/change_levels.md` for doc update matrix
   - Update CHANGELOG.md
   - Update CONTEXT.md (set up next session state)
   - Update README.md (only if L2+ with user-facing impact)
   - Update ARCHITECTURE.md / STATE_MACHINES.md (only if L3)

5. **Stage all changes**
   - Code + docs + tests in single staging

6. **Present diff summary**
   - Show user a concise summary of ALL staged changes
   - Group by: code changes, test changes, doc changes

7. **Get explicit user approval**
   - Do NOT commit without user saying yes

8. **Commit**
   - Single commit with task-prefixed message
   - Format: `<TASK-ID>: <Brief summary> - <What was done>`
   - Imperative mood, under 72 characters

9. **Push to dev**

10. **Update memory**
    - Append to episodic memory if significant session work

## On Failure

- **Step 2 (tests fail)**: STOP. Do not proceed. Show failures
  to user. Fix the code, not the tests (unless tests are wrong).
- **Step 7 (user rejects)**: STOP. Ask what needs to change.
  Do not re-attempt without addressing feedback.
- **Step 9 (push fails)**: Do not force-push. Show the error.
  Common causes: remote ahead (pull first), auth issues, branch
  protection. Surface to user for resolution.
- **Any other step**: Stop and tell the user what failed and why.
  Never skip a step to continue the sequence.
