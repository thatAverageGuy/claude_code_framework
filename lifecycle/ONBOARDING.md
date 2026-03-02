# Onboarding Lifecycle — Existing Project

## Goal
Bring Claude up to speed on an existing codebase without a greenfield
phase history. Establish CLAUDE_STATE.md and CONTEXT.md from scratch.

## CLAUDE_STATE.md Bootstrap Template (Onboarding)
---
Phase: onboarding
Task: none
Workflow: onboarding-discovery
Workflow Step: 1

Phase Manifest:
  onboarding: [lifecycle/ONBOARDING, memory/self, memory/projects]

Loaded:
  - lifecycle/ONBOARDING ✓

Offload Candidates: none
Queue: [determine after discovery]
---

## Discovery Protocol

### Step 1 — Codebase Orientation
Read in order:
1. README.md — understand what it does
2. docs/ — read any existing VISION, SPEC, ARCHITECTURE
3. Source directory structure — understand component layout
4. Test directory — understand coverage and test patterns
5. CHANGELOG.md or git log — understand recent history

### Step 2 — Gap Assessment
After reading, report:
- What documentation exists vs what's missing
- Current inferred phase (where is the project in its lifecycle?)
- Immediate risks or issues visible from code/docs
- What CLAUDE_STATE.md phase to set

### Step 3 — Establish Ground Truth
Create missing critical docs if absent:
- No VISION.md → run abbreviated Phase 0 interview
- No SPEC.md → document observed features as requirements (user confirms)
- No ARCHITECTURE.md → generate from codebase observation (user confirms)

### Step 4 — Populate CLAUDE_STATE.md
Set:
- Phase to the inferred current phase
- Phase manifest for that phase
- Queue for immediately needed files

### Step 5 — Establish CONTEXT.md
Create CONTEXT.md documenting:
- Current state of the project
- Active or implied next task
- Known issues or blockers
- Quick links to key docs

## Rules
- Never assume requirements. Observe and confirm.
- If existing code contradicts docs, flag the conflict. Don't silently pick one.
- Onboarding is complete when CLAUDE_STATE.md and CONTEXT.md exist
  and user has confirmed the phase assessment.