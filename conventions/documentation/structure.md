# Documentation Structure

────────────────────────────────────────────────────────
## DIRECTORY LAYOUT
────────────────────────────────────────────────────────

```
project-root/
├── CLAUDE.md                    # Agent instructions
├── CONTEXT.md                   # Session resumption
├── CHANGELOG.md                 # Keep a Changelog format
├── README.md                    # User-facing overview
│
├── docs/
│   ├── README.md                # Documentation index
│   ├── discovery/
│   │   └── findings.md
│   ├── research/
│   │   └── [topic]_report.md
│   ├── analysis/
│   │   └── analysis.md
│   ├── strategy/
│   │   ├── strategy.md
│   │   └── [topic]_strategy.md
│   ├── user/                    # User-facing docs
│   │   ├── QUICKSTART.md
│   │   ├── CONFIG_REFERENCE.md
│   │   └── TROUBLESHOOTING.md
│   ├── dev/                     # Internal dev docs
│   │   ├── ARCHITECTURE.md
│   │   ├── SPEC.md
│   │   ├── STATE_MACHINES.md
│   │   ├── CONTRIBUTING.md
│   │   ├── tasks/
│   │   │   ├── TASKS.md
│   │   │   └── <TASK-ID>/
│   │   │       ├── DETAIL.md
│   │   │       └── IMPL_LOG.md
│   │   ├── adr/
│   │   └── session_context/
│   └── api/                     # API reference (if applicable)
│
└── tests/
    ├── unit/
    └── integration/
```

────────────────────────────────────────────────────────
## CHANGELOG FORMAT
────────────────────────────────────────────────────────
Follows [Keep a Changelog](https://keepachangelog.com/).

```markdown
# CHANGELOG

## [Unreleased]

### Added
- JWT auth middleware with refresh token support (T-012)

### Fixed
- Race condition in message queue consumer (BF-003)

## [0.3.0] - 2026-02-20

### Added
- Database connection pooling (T-011)
```

Categories: Added, Changed, Deprecated, Removed, Fixed, Security

────────────────────────────────────────────────────────
## README GUIDELINES
────────────────────────────────────────────────────────
README is user-facing. Shows what the project is and how to use it.

Update when: L2+ changes affect user-facing features, new setup
steps, changed interfaces or configuration. Never for internal changes.

Structure:
```markdown
# Project Name
[One-line description]
## Features
## Quick Start
## Installation
## Usage
## Configuration
## Documentation
## Contributing
## License
```
