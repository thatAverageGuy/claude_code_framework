---
name: phase-gate
description: >
  Validate exit criteria for the current project phase. Checks
  deliverables exist and are complete, flags gaps, and reports
  readiness status. Advisory only — user decides whether to proceed.
  Use at any point to check if the current phase is complete.
disable-model-invocation: true
---

# Phase Gate Validation

Check whether the current phase's exit criteria are satisfied.
This is ADVISORY — report status, user decides.

## Process

### Step 1: Determine Current Phase

Read CLAUDE.md and check the CURRENT_PHASE field in PROJECT-SPECIFIC
CONTEXT. If not set, ask the user which phase to validate.

### Step 2: Run Phase-Specific Checks

Based on the current phase, verify each exit criterion below.
For each criterion, report: ✅ PASS | ❌ FAIL | ⚠️ PARTIAL

---

### Phase 0: Vision & Scope

| # | Criterion                                    | Check Method                          |
|---|----------------------------------------------|---------------------------------------|
| 1 | Problem statement is specific and falsifiable | Read docs/dev/VISION.md, assess       |
| 2 | Target users identified (not "everyone")      | Read VISION.md, verify specificity    |
| 3 | At least 3 anti-goals documented              | Count anti-goals in VISION.md         |
| 4 | Success criteria are measurable               | Read VISION.md, assess measurability  |
| 5 | User has approved VISION.md                   | Ask user to confirm                   |
| 6 | PROJECT_TYPE set in CLAUDE.md                 | Read CLAUDE.md                        |

**For client projects, additionally:**
| 7 | Client context documented                     | Check VISION.md constraints section   |
| 8 | Proposal draft exists (if applicable)         | Check docs/client/PROPOSAL_DRAFT.md   |

---

### Phase 1: Requirements

| # | Criterion                                    | Check Method                          |
|---|----------------------------------------------|---------------------------------------|
| 1 | All must-have features have acceptance criteria| Read docs/dev/SPEC.md, verify F-IDs  |
| 2 | Non-functional requirements have targets      | Read SPEC.md NFR section              |
| 3 | Data model entities identified                | Read SPEC.md data model section       |
| 4 | Integration points listed with auth reqs      | Read SPEC.md integration section      |
| 5 | MoSCoW prioritization complete                | Verify all features are categorized   |
| 6 | Open Questions section is empty               | Read SPEC.md open questions           |
| 7 | User has approved SPEC.md                     | Ask user to confirm                   |

**For client projects, additionally:**
| 8 | SOW draft exists                              | Check docs/client/SOW_DRAFT.md        |

**For commercial-saas intent, additionally:**
| 9 | Pricing model documented                      | Check SPEC.md pricing section         |

---

### Phase 2: Technical Design

| # | Criterion                                    | Check Method                          |
|---|----------------------------------------------|---------------------------------------|
| 1 | All tech choices have ADRs                    | List docs/dev/adr/, cross-ref stack   |
| 2 | ADRs include alternatives considered          | Read each ADR                         |
| 3 | Architecture diagram shows all components     | Read docs/dev/ARCHITECTURE.md         |
| 4 | Data flow documented                          | Read ARCHITECTURE.md data flow section|
| 5 | State machines cover all stateful components  | Read docs/dev/STATE_MACHINES.md       |
| 6 | No unresolved TBDs in architecture            | Grep for "TBD", "TODO", "???"        |
| 7 | User has approved ADRs and architecture       | Ask user to confirm                   |

---

### Phase 3: Project Bootstrap

| # | Criterion                                    | Check Method                          |
|---|----------------------------------------------|---------------------------------------|
| 1 | Project builds/runs (even if empty)           | Run build command                     |
| 2 | All docs generated and approved               | Check docs/ structure                 |
| 3 | TASKS.md has prioritized backlog              | Read docs/dev/tasks/TASKS.md          |
| 4 | First task has DETAIL.md                      | Check first task directory            |
| 5 | Git initialized with dev branch               | Run: git branch                       |
| 6 | Initial commit exists on dev                   | Run: git log --oneline -1             |
| 7 | CLAUDE.md project section populated            | Read CLAUDE.md project context        |
| 8 | CONTEXT.md initialized                         | Check CONTEXT.md exists and populated |

**For build-in-public intent, additionally:**
| 9 | Content plan exists                            | Check docs/gtm/CONTENT_PLAN.md       |

---

### Phase 4: Implementation

| # | Criterion                                    | Check Method                          |
|---|----------------------------------------------|---------------------------------------|
| 1 | All must-have tasks are DONE                  | Read TASKS.md, filter must-have       |
| 2 | All tests pass                                | Run test suite                        |
| 3 | No BLOCKED tasks remain                       | Read TASKS.md blocked section         |
| 4 | IMPL_LOGs complete for all done tasks         | Check each task directory             |
| 5 | CHANGELOG up to date                          | Read CHANGELOG.md                     |

---

### Phase 5: Validation & Hardening

| # | Criterion                                    | Check Method                          |
|---|----------------------------------------------|---------------------------------------|
| 1 | quality-gate reports no critical issues       | Check for quality gate report         |
| 2 | Test suite passes with documented coverage    | Run tests with coverage               |
| 3 | All acceptance criteria from SPEC.md satisfied| Cross-reference SPEC.md vs tests     |
| 4 | No unresolved security findings               | Check quality gate security section   |
| 5 | User acceptance confirmed                     | Ask user                              |

**For client projects, additionally:**
| 6 | Client UAT completed                          | Ask user                              |
| 7 | HANDOFF.md draft exists                       | Check docs/client/HANDOFF.md          |

---

### Phase 6: Deployment & Handoff

| # | Criterion                                    | Check Method                          |
|---|----------------------------------------------|---------------------------------------|
| 1 | All deploy checklist items green or waived    | Check deploy-validator report         |
| 2 | DEPLOY.md approved                            | Ask user                              |
| 3 | Successful deployment to target               | Ask user / check deploy logs          |
| 4 | Smoke test passing                            | Ask user / run smoke test             |

**For client projects, additionally:**
| 5 | HANDOFF.md finalized                          | Check docs/client/HANDOFF.md          |
| 6 | Handoff session completed                     | Ask user                              |

---

## Step 3: Produce Report

```
## Phase Gate Report: Phase [N] — [Name]
Date: [date]
Project: [from CLAUDE.md]

### Status: [READY | NOT READY | READY WITH GAPS]

### Results
| #  | Criterion                    | Status | Notes              |
|----|------------------------------|--------|--------------------|
| 1  | [criterion]                  | ✅     |                    |
| 2  | [criterion]                  | ❌     | [what's missing]   |
| 3  | [criterion]                  | ⚠️     | [what's partial]   |

### Blocking Issues
[List any ❌ items that prevent proceeding]

### Advisory Gaps
[List any ⚠️ items — not blocking but worth addressing]

### Recommendation
[ADVISORY: "Phase [N] exit criteria are [met/not met].
[Specific gaps]. You can proceed at your discretion."]
```

## Step 4: Advise

- If all criteria met: "Phase [N] is complete. Next up: Phase [N+1].
  Shall I update CURRENT_PHASE in CLAUDE.md?"
- If gaps exist: list them clearly, note which are blocking vs advisory,
  and let the user decide.
- NEVER refuse to let the user proceed. Gates are advisory.

## Rules

- Be factual. A criterion is met or it isn't. Don't soften failures.
- If a file doesn't exist that should, that's a ❌ not a ⚠️.
- For criteria requiring user confirmation ("user has approved X"),
  ask the user directly rather than assuming.
- If CURRENT_PHASE is not set (existing project, skipped greenfield),
  still allow the user to validate any specific phase.
- Run actual commands where specified (git branch, test suite).
  Don't just check if files exist.
