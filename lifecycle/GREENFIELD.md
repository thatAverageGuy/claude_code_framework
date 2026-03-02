# Greenfield Lifecycle — Phase Definitions

## CLAUDE_STATE.md Bootstrap Template
(Copy this structure when creating CLAUDE_STATE.md for a new project)

---
Phase: 0-vision
Task: none
Workflow: W1-session-start
Workflow Step: 1

Phase Manifest:
  0-vision:       [skills/new-project, memory/self, memory/goals]
  1-requirements: [skills/phase-gate, agents/researcher, memory/self]
  2-tech-design:  [skills/tech-eval, agents/researcher, lifecycle/GREENFIELD]
  3-bootstrap:    [skills/bootstrap, agents/doc-generator]
  4-implementation: [conventions/COMMIT, conventions/TESTING, conventions/TASKS, conventions/GIT, conventions/CHANGELOG, conventions/DOCS]
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
Exit criteria: Problem statement falsifiable, target users specific,
3+ anti-goals, success criteria measurable, user approved.

### Phase 1 — Requirements
Goal: Define exactly what to build, fully specified.
Skill: /phase-gate (to validate exit)
Agent: researcher (for domain/competitive research if needed)
Produces: docs/dev/SPEC.md
Exit criteria: All must-haves have acceptance criteria, NFRs have
targets, open questions empty, user approved.

### Phase 2 — Technical Design
Goal: Decide how to build it. All tech choices documented.
Skill: /tech-eval, /phase-gate
Agent: researcher
Produces: docs/dev/ARCHITECTURE.md, docs/dev/adr/, docs/dev/STATE_MACHINES.md
Exit criteria: All tech choices have ADRs, architecture diagram complete,
state machines cover all stateful components, no unresolved TBDs.

### Phase 3 — Bootstrap
Goal: Scaffold project structure. Zero ambiguity before implementation.
Skill: /bootstrap
Agent: doc-generator
Produces: Full directory structure, TASKS.md, CONTEXT.md, initial commit.
Exit criteria: Project builds, TASKS.md populated, first task has
DETAIL.md, git initialized, initial commit on dev.

### Phase 4 — Implementation
Goal: Build must-have features per SPEC.md.
Conventions: COMMIT, TESTING, TASKS, GIT, CHANGELOG, DOCS (all loaded)
Exit criteria: All must-have tasks DONE, all tests pass,
no BLOCKED tasks, CHANGELOG up to date.

### Phase 5 — Validation & Hardening
Goal: Verify correctness, quality, and completeness.
Skill: /phase-gate
Agent: quality-gate
Exit criteria: No critical issues from quality-gate, all acceptance
criteria from SPEC.md satisfied, user acceptance confirmed.

### Phase 6 — Deployment & Handoff
Goal: Ship it. Clean handoff.
Skill: /deploy-readiness
Agent: deploy-validator
Exit criteria: All deploy checklist items green or explicitly waived,
successful deployment, smoke test passing.

## Intent Modifiers
build-in-public:   Add content plan (docs/gtm/) after Phase 3.
commercial-saas:   Add /commercialize after Phase 2. Add billing/auth tasks in Phase 3.
client-delivery:   Add SOW tracking. Add HANDOFF.md to Phase 6.
consulting-showcase: Add /promote after Phase 3.