# Git Workflow

────────────────────────────────────────────────────────
## BRANCHING
────────────────────────────────────────────────────────
1. All development on `dev` branch
2. Commits go to `dev`
3. When ready, PR from `dev` → `main`
4. After merge, do NOT delete `dev`
5. Return to `dev` to continue work
6. Version tags on `main` only (format: `vMAJOR.MINOR.PATCH`)

────────────────────────────────────────────────────────
## VERSIONING
────────────────────────────────────────────────────────
Default: Semver. Override only if project uses another scheme.

| Trigger                          | Bump  |
|----------------------------------|-------|
| Breaking public interface change | MAJOR |
| New feature, backward compatible | MINOR |
| Bug fix, internal improvement    | PATCH |

────────────────────────────────────────────────────────
## COMMIT PROCEDURE (mandatory, no exceptions)
────────────────────────────────────────────────────────

 1. Verify implementation is complete
 2. Run full test suite — must pass, no skips
 3. Update task's IMPL_LOG.md
 4. Update TASKS.md status
 5. Update CHANGELOG.md
 6. Update CONTEXT.md (set up next session state)
 7. Update README.md (only if L2+ with user-facing impact)
 8. Update ARCHITECTURE.md / STATE_MACHINES.md (only if L3)
 9. Stage all changes (code + docs + tests)
10. Present full diff summary to user
11. Get explicit user approval
12. Single commit with task-prefixed message
13. Push to dev

────────────────────────────────────────────────────────
## COMMIT MESSAGE FORMAT
────────────────────────────────────────────────────────

```
<TASK-ID>: <Brief summary> - <What was done>
```

- Imperative mood, under 72 characters
- Task ID prefix mandatory
- Optional body for complex changes (blank line after subject)

Example:
```
T-012: Auth middleware - JWT validation with refresh token support

- Implemented RS256 JWT validation middleware
- Added refresh token rotation logic
- Integration tested against real token lifecycle
- Docs updated: CHANGELOG, CONTEXT, TASKS, IMPL_LOG
```

────────────────────────────────────────────────────────
## TASK ID PREFIXES
────────────────────────────────────────────────────────

| Prefix | Meaning                       |
|--------|-------------------------------|
| T-XXX  | Main development tasks        |
| BF-XXX | Bug fixes                     |
| CL-XXX | Cleanup / refactoring         |
| AX-XXX | Auxiliary (CI, tooling, infra) |

New prefixes can be added. When adding one, update this table
and docs/dev/CONTRIBUTING.md.

────────────────────────────────────────────────────────
## COMMIT RULES
────────────────────────────────────────────────────────
- One commit per task — no separate "mark as complete" commits
- Commit includes all changes: code, tests, docs, status updates
- Never commit without explicit user approval
- Never commit with failing tests
