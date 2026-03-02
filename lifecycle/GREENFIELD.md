# Greenfield Lifecycle — Phase Definitions

## CLAUDE_STATE.md Bootstrap Template

---
Phase: 0-vision
Task: none
Workflow: W1-session-start
Workflow Step: 1

Phase Manifest:
  0-vision:       [skills/new-project, memory/self, memory/goals]
  1-requirements: [skills/phase-gate, agents/researcher, memory/self]
  2-tech-design:  [skills/tech-eval, agents/researcher, lifecycle/GREENFIELD]
  3a-scaffold:    [skills/bootstrap, agents/doc-generator]
  3b-env-setup:   [skills/env-setup]
  4-implementation: [conventions/COMMIT, conventions/TESTING, conventions/TASKS,
                    conventions/GIT, conventions/CHANGELOG, conventions/DOCS]
  5-validation:   [agents/quality-gate, skills/phase-gate]
  6-deployment:   [skills/deploy-readiness, agents/deploy-validator]

Loaded:
  - lifecycle/GREENFIELD ✓

Offload Candidates: none
Queue: []
---

## Phase Definitions

### Phase 0 — Vision & Scope
Goal: Define what and why before any how.
Skill: /new-project
Produces: docs/dev/VISION.md
Exit criteria:
- Problem statement is specific and falsifiable
- Target users identified (not "everyone")
- 3+ anti-goals documented
- Success criteria are measurable
- PROJECT_TYPE and PROJECT_INTENT set in CLAUDE_STATE.md
- User approved

### Phase 1 — Requirements
Goal: Define exactly what to build, fully specified.
Skill: /phase-gate (to validate exit)
Agent: researcher (if domain/competitive research needed)
Produces: docs/dev/SPEC.md
Exit criteria:
- All must-haves have acceptance criteria
- NFRs have measurable targets
- Data model entities identified
- Integration points listed with auth requirements
- Open questions section is empty
- User approved

### Phase 2 — Technical Design
Goal: Decide how to build it. All tech choices documented.
Skill: /tech-eval, /phase-gate
Agent: researcher
Produces:
- docs/dev/ARCHITECTURE.md
- docs/dev/adr/ (one ADR per significant tech choice)
- docs/dev/STATE_MACHINES.md
- docs/dev/ENV_SETUP.md (populated template, ready for 3B execution)
Exit criteria:
- All tech choices have ADRs with alternatives considered
- Architecture diagram covers all components
- Data flow documented
- State machines cover all stateful components
- ENV_SETUP.md generated, reviewed, and approved by user
- No unresolved TBDs in any doc
- User approved

### Phase 3A — Project Scaffold
Goal: Scaffold directory structure. Zero ambiguity before environment setup.
Skill: /bootstrap
Agent: doc-generator
Produces:
- Full directory structure per ARCHITECTURE.md
- All convention and reference docs generated
- docs/dev/tasks/TASKS.md with prioritized backlog
- First task DETAIL.md
- Git initialized, dev branch, initial commit
Exit criteria:
- Project builds/runs (even if empty entry points)
- TASKS.md populated with must-have features from SPEC.md
- First task has DETAIL.md
- Git initialized with dev branch
- Initial commit exists (AX-000)
- CONTEXT.md initialized
- User approved

### Phase 3B — Environment Setup
Goal: Verified, running environment before any implementation begins.
Skill: /env-setup
Prerequisite: ENV_SETUP.md approved in Phase 2, AX-000 commit exists from 3A
Produces:
- GitHub repo created and configured
- Branch protection rules active (main requires PR + passing CI)
- CI/CD pipeline running (lint → test → build)
- Secrets configured (names verified present, values never stored)
- Dev environment verified end-to-end
- ENV_SETUP.md updated with actual state post-setup
Exit criteria:
- At least one successful CI run on dev branch
- All secrets documented in ENV_SETUP.md as present/configured
- Branch protection verified active on main
- User can run project locally with documented steps
- ENV_SETUP.md reflects actual environment state
- User approved

### Phase 4 — Implementation
Goal: Build must-have features per SPEC.md.
Conventions loaded: COMMIT, TESTING, TASKS, GIT, CHANGELOG, DOCS
Exit criteria:
- All must-have tasks DONE
- All tests pass
- No BLOCKED tasks remain
- IMPL_LOGs complete for all done tasks
- CHANGELOG up to date

### Phase 5 — Validation & Hardening
Goal: Verify correctness, quality, and completeness.
Skill: /phase-gate
Agent: quality-gate
Exit criteria:
- quality-gate reports no critical issues
- All acceptance criteria from SPEC.md satisfied
- Test coverage meets targets from SPEC.md NFRs
- No unresolved security findings
- User acceptance confirmed

### Phase 6 — Deployment & Handoff
Goal: Ship it. Clean handoff.
Skill: /deploy-readiness
Agent: deploy-validator
Exit criteria:
- All deploy checklist items green or explicitly waived
- DEPLOY.md finalized
- Successful deployment to target environment
- Smoke tests passing
- User approved

## Phase Revisit Rules
Any phase can be revisited as the project matures:
- Minor changes (config tweak, new secret) → update ENV_SETUP.md, no phase reset
- Significant architecture change → revisit Phase 2, regenerate affected ENV_SETUP.md sections
- New must-have feature → revisit Phase 1, add to SPEC.md, add task to TASKS.md
- Phase revisit always produces a doc update + commit before resuming current phase

## Intent Modifiers
build-in-public:    Add /promote after Phase 3A. Generate docs/gtm/CONTENT_PLAN.md.
commercial-saas:    Add /commercialize after Phase 2. Add billing/auth tasks in 3A.
client-delivery:    Add SOW tracking in Phase 1. Add HANDOFF.md to Phase 6.
consulting-showcase: Add /promote after Phase 3A.