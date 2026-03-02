# Project Scaffold — Phase 3A

Scaffold project structure and generate initial documentation
from Phase 0-2 decisions. Creates files — L3.

## Prerequisites
Verify these exist (fail if missing):
- docs/dev/VISION.md
- docs/dev/SPEC.md
- docs/dev/ARCHITECTURE.md
- docs/dev/adr/ (at least one ADR)
- docs/dev/ENV_SETUP.md (generated and approved in Phase 2)

If any missing → stop, tell user which phases need completing first.

## Process

### Step 1: Read Context
Read and extract:
- VISION.md → project name, type, intent, constraints
- SPEC.md → must-have features (for task backlog), integrations
- ARCHITECTURE.md → components, tech stack, directory structure
- ADRs → language, framework, package manager choices
- ENV_SETUP.md → runtime versions for entry point stubs

### Step 2: Scaffold Directory Structure
Create structure per ARCHITECTURE.md and ADR tech stack choices.

Always create:
```
project-root/
├── CONTEXT.md                   # Initialize from template
├── CHANGELOG.md                 # Initialize with [Unreleased]
├── README.md                    # Generate from VISION.md
├── .gitignore                   # Language-appropriate
│
├── docs/
│   ├── README.md                # Documentation index
│   ├── user/
│   │   ├── QUICKSTART.md
│   │   └── CONFIG_REFERENCE.md
│   └── dev/
│       ├── VISION.md            # exists
│       ├── SPEC.md              # exists
│       ├── ARCHITECTURE.md      # exists
│       ├── ENV_SETUP.md         # exists
│       ├── STATE_MACHINES.md    # exists or generate placeholder
│       ├── CONTRIBUTING.md      # generate from ADR conventions
│       ├── DEPLOY.md            # placeholder
│       ├── adr/                 # exists
│       └── tasks/
│           ├── TASKS.md         # generate from SPEC.md must-haves
│           └── T-001/
│               └── DETAIL.md   # first task only
│
├── src/                         # per ARCHITECTURE.md structure
└── tests/
    ├── unit/
    └── integration/
```

Language-specific entry points (use exact versions from ENV_SETUP.md):

Python:
```
├── pyproject.toml
├── src/[package]/__init__.py
└── src/[package]/main.py
```

Rust:
```
├── Cargo.toml
└── src/main.rs
```

Node/TypeScript:
```
├── package.json
├── tsconfig.json
└── src/index.ts
```

Go:
```
├── go.mod
└── cmd/[name]/main.go
```

### Step 3: Generate Documentation
Spawn doc-generator agent with full Phase 0-2 context to generate:
- CONTRIBUTING.md
- CONFIG_REFERENCE.md
- docs/README.md
- DEPLOY.md placeholder

### Step 4: Generate Task Backlog
Convert SPEC.md must-haves into TASKS.md:
- One task per must-have feature
- Order by dependency
- Create DETAIL.md for first task only
- If >20 must-haves → group into sprints, create tasks for Sprint 1 only

### Step 5: Initialize Git
```bash
git init
git checkout -b dev
git add -A
```
Do NOT commit yet — present to user first.

### Step 6: Initialize CONTEXT.md
Populate from template:
- Phase: 3a-scaffold
- Task: none yet
- Next steps: review generated files → initial commit → proceed to 3B

### Step 7: Update CLAUDE_STATE.md
- Phase: 3a-scaffold complete, queue 3b-env-setup
- Loaded: doc-generator agent
- Next: /env-setup skill

### Step 8: Present for Approval
Show user:
1. Full file tree of everything created
2. Summary of each generated doc (2-3 lines)
3. Task backlog
4. Gaps or assumptions made
5. Proposed initial commit message

Wait for explicit approval before committing.

### Step 9: Initial Commit
After user approval:
```bash
git add -A
git commit -m "AX-000: Project scaffold - structure, docs, initial task backlog"
```

## Rules
- Never generate source code beyond minimal entry points.
- Use exact tech stack from ADRs — never assume.
- Use exact runtime versions from ENV_SETUP.md.
- Do not touch ENV_SETUP.md — that belongs to Phase 3B.
- Do not overwrite existing files from Phases 0-2.
- Initial commit uses AX-000 prefix — only exception to one-commit-per-task rule.