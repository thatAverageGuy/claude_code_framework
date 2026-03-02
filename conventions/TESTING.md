# Testing Convention

## Structure
tests/
├── unit/          # Pure logic, no I/O, no external deps
└── integration/   # Cross-component, external deps allowed

## Naming
- File:     <module>.test.<ext>
- Test:     should_<expected>_when_<condition>
- Describe: component or function under test

## Rules
- Every task that touches logic requires tests before commit.
- Unit tests must not make network calls or touch disk.
- Integration tests must be isolated — no shared state between tests.
- Test the behavior, not the implementation.
- Mocks are acceptable for external services, not for internal logic.

## Coverage
- New code: aim for 80% minimum.
- Critical paths (auth, payments, data writes): 100%.
- Don't chase coverage numbers — chase scenario coverage.

## On Failure (during W2)
→ Do not commit. Prompt user: [fix now | BF-XXX | skip with documented reason]
→ Skipping requires explicit user approval and a note in IMPL_LOG.md.