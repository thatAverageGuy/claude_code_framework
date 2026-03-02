---
name: bootstrap
description: >
  Scaffold a new project's directory structure, initialize git,
  generate documentation from Phase 0-2 decisions, create initial
  task backlog, and set up CI/CD placeholders. Use during Phase 3
  (project bootstrap) after vision, requirements, and tech design
  are complete.
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---

# Project Bootstrap — Phase 3

Scaffold the project structure and generate initial documentation
from Phase 0-2 decisions. This skill creates files — LEVEL 2.

## Prerequisites

Before running, verify these exist (fail if missing):
- docs/dev/VISION.md (Phase 0 output)
- docs/dev/SPEC.md (Phase 1 output)
- docs/dev/ARCHITECTURE.md (Phase 2 output)
- docs/dev/adr/ with at least one ADR (Phase 2 output)

If any are missing, stop and tell the user which phases need
completing first. Suggest /phase-gate to check.

## Process

### Step 1: Read All Context

Read these files and extract:
- VISION.md → project name, type, intent, constraints
- SPEC.md → features list (for task backlog), data model, integrations
- ARCHITECTURE.md → components, tech stack, directory structure
- ADRs → technology choices (language, framework, package manager)
- CLAUDE.md → any existing project-specific context

### Step 2: Scaffold Directory Structure

Create the project structure based on ARCHITECTURE.md and the tech
stack from ADRs. Adapt to the specific language/framework.

**Always create:**
```
project-root/
├── CLAUDE.md                    # (already exists — update it)
├── CONTEXT.md                   # Initialize
├── CHANGELOG.md                 # Initialize with [Unreleased]
├── README.md                    # Generate from VISION.md
├── .gitignore                   # Language-appropriate
│
├── .claude/
│   ├── agents/                  # Copy project-relevant agents
│   └── skills/                  # Copy project-relevant skills
│
├── docs/
│   ├── README.md                # Documentation index
│   ├── user/
│   │   ├── QUICKSTART.md        # Placeholder or initial
│   │   └── CONFIG_REFERENCE.md  # From ARCHITECTURE.md config section
│   └── dev/
│       ├── VISION.md            # (already exists)
│       ├── SPEC.md              # (already exists)
│       ├── ARCHITECTURE.md      # (already exists)
│       ├── STATE_MACHINES.md    # (already exists or generate)
│       ├── CONTRIBUTING.md      # Generate from conventions
│       ├── DEPLOY.md            # Placeholder with target info
│       ├── adr/                 # (already exists)
│       ├── tasks/
│       │   └── TASKS.md         # Generate from SPEC.md features
│       └── session_context/
│
├── src/ (or language equivalent)
│   └── [structure from ARCHITECTURE.md]
│
└── tests/
    ├── unit/
    └── integration/
```

**Language-specific additions:**

Python:
```
├── pyproject.toml / setup.cfg
├── requirements.txt or uv.lock
├── src/[package_name]/__init__.py
└── src/[package_name]/main.py
```

Rust:
```
├── Cargo.toml
├── src/main.rs or src/lib.rs
```

Node.js/TypeScript:
```
├── package.json
├── tsconfig.json (if TypeScript)
├── src/index.ts
```

Go:
```
├── go.mod
├── cmd/[name]/main.go
├── internal/
```

**Containerization (always, unless constraint says otherwise):**
```
├── Dockerfile            # Multi-stage, language-appropriate
├── .dockerignore         # Exclude dev files, tests, docs
└── docker-compose.yml    # Dev environment (optional)
```

**CI/CD placeholder:**
```
├── .github/workflows/
│   └── ci.yml            # Lint → Test → Build stages
```

### Step 3: Generate Documentation

Spawn `doc-generator` sub-agent with the full context from Phase 0-2
to generate remaining docs:

- CONTRIBUTING.md (from conventions in ADRs and ARCHITECTURE.md)
- CONFIG_REFERENCE.md (from architecture config section)
- docs/README.md (documentation index linking all docs)
- DEPLOY.md (placeholder with deployment target from CLAUDE.md)

### Step 4: Generate Task Backlog

Convert SPEC.md must-have features into tasks in TASKS.md:

```markdown
## Active
| ID    | Summary                      | Status | Depends On | Detail                    |
|-------|------------------------------|--------|------------|---------------------------|
| T-001 | [First feature from SPEC.md] | TODO   | —          | docs/dev/tasks/T-001/     |
| T-002 | [Second feature]             | TODO   | T-001      | docs/dev/tasks/T-002/     |
```

Rules for task creation:
- One task per feature from SPEC.md Must Have list
- Order by dependency (what must be built first)
- Create DETAIL.md for the FIRST task only (to start work)
- Other tasks get directories but empty DETAIL.md (plan when ready)
- If SPEC.md has > 20 must-have features, group into logical sprints
  and only create tasks for Sprint 1

### Step 5: Initialize Git

```bash
git init
git checkout -b dev
# Stage everything
git add -A
```

Do NOT commit yet — present everything to user first.

### Step 6: Initialize CONTEXT.md

```markdown
# CONTEXT

## Current State
**Task**: T-001 | **Phase**: Bootstrap complete → Implementation
**Branch**: dev | **Last Commit**: (pending initial commit)

## Previous Session Summary
- Project bootstrapped from Phase 0-2 decisions
- Full docs structure generated
- Task backlog created from SPEC.md

## Current Task State
- Scaffold: DONE
- Documentation: DONE (pending approval)
- Task backlog: DONE
- Git: initialized, pending initial commit

## Next Steps
1. [ ] Review and approve all generated files
2. [ ] Initial commit on dev
3. [ ] Begin T-001 planning and implementation

## Quick Links
- Vision: docs/dev/VISION.md
- Spec: docs/dev/SPEC.md
- Architecture: docs/dev/ARCHITECTURE.md
- Tasks: docs/dev/tasks/TASKS.md
- First task: docs/dev/tasks/T-001/DETAIL.md
```

### Step 7: Update CLAUDE.md

Populate the PROJECT-SPECIFIC CONTEXT section with actual values:
- Language, framework, package manager (from ADRs)
- Test framework (from ADR or convention)
- CI/CD (GitHub Actions or whatever was chosen)
- Deployment target (from ARCHITECTURE.md)
- Key conventions (from CONTRIBUTING.md)
- Entry point (from scaffold)
- CURRENT_PHASE: "4-implementation"

### Step 8: Intent-Specific Setup

**If build-in-public or community-tool:**
- Create docs/gtm/CONTENT_PLAN.md with milestone-to-content mapping
- Create docs/gtm/CONTENT_CALENDAR.md skeleton

**If commercial-saas:**
- Add auth scaffolding task to backlog
- Add billing/subscription scaffolding task
- Add multi-tenancy task (if in SPEC.md)

**If client-delivery:**
- Cross-reference TASKS.md against SOW deliverables
- Add a SOW_TRACKING.md section or tag tasks with SOW references

### Step 9: Present for Approval

Show the user:
1. Complete file tree of everything created
2. Summary of each generated document (2-3 lines each)
3. Task backlog with priorities
4. Any gaps or assumptions made
5. Proposed initial commit message

Wait for EXPLICIT approval before committing.

### Step 10: Initial Commit

After user approval:
```bash
git add -A
git commit -m "AX-000: Project bootstrap - scaffold, docs, and initial task backlog"
```

## Rules

- NEVER generate source code beyond minimal entry points and
  package structure. Phase 4 (implementation) handles real code.
- Adapt everything to the ACTUAL tech stack from ADRs. Don't generate
  a package.json for a Rust project.
- If ARCHITECTURE.md specifies a directory structure, use THAT
  structure, not a generic one.
- Generated docs must be consistent with each other and with Phase
  0-2 docs. Cross-reference during generation.
- Don't overwrite any existing files. If docs exist from Phases 0-2,
  read them and build around them.
- The initial commit is the ONLY exception to the "one commit per task"
  rule. It uses the AX-000 prefix to indicate it's infrastructure.
