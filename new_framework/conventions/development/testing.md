# Testing Conventions

────────────────────────────────────────────────────────
## PHILOSOPHY
────────────────────────────────────────────────────────
Tests prove functionality works in reality, not just in theory.

- Every implemented feature must have tests that verify real behavior
- Mocks allowed ONLY for external dependencies (APIs, databases)
  — never mock the thing you're testing
- Integration tests are first-class citizens
- If automated testing isn't possible, document manual test procedure
  in the task's IMPL_LOG.md

────────────────────────────────────────────────────────
## STRUCTURE
────────────────────────────────────────────────────────

```
tests/
├── unit/           # Fast, isolated, mock external deps only
├── integration/    # Real dependencies, real behavior
└── conftest or     # Shared fixtures (framework-dependent)
    test_helpers/
```

────────────────────────────────────────────────────────
## COVERAGE
────────────────────────────────────────────────────────
- Track and report coverage in IMPL_LOG.md per task
- Target: meaningful coverage of implemented logic (no gaming)
- Critical paths and edge cases must always be covered
- Coverage gaps must be documented and justified

────────────────────────────────────────────────────────
## NAMING
────────────────────────────────────────────────────────

```
test_<unit>_<scenario>_<expected_outcome>

Examples:
  test_token_validator_expired_token_returns_401
  test_queue_consumer_concurrent_access_no_race_condition
```
