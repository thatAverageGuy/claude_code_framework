# Environment Setup — Phase 3B

Read Phase 0-2 outputs and execute the approved ENV_SETUP.md plan.
This skill operates at L3 — all actions require user approval per step.

## Prerequisites
- docs/dev/ENV_SETUP.md exists and is user-approved (Phase 2 output)
- AX-000 initial commit exists on dev (Phase 3A complete)
- /phase-gate confirms 3A exit criteria met

If any prerequisite missing → stop, report what's missing.

## Process

### Step 1: Read Context
Read in order:
- docs/dev/ENV_SETUP.md → the execution plan
- docs/dev/ARCHITECTURE.md → component and deployment topology
- docs/dev/adr/ → confirm tool choices (CI provider, cloud, IaC)
- CLAUDE_STATE.md → PROJECT_TYPE, PROJECT_INTENT

### Step 2: GitHub Repository Setup
Actions (each requires user confirmation before executing):
- Create repo (public if open-source/build-in-public, private otherwise)
- Set repo description from VISION.md one-liner
- Add topics/tags from project domain
- Push dev branch, set as default
- Configure main as protected:
  - Require PR before merging
  - Require status checks to pass (CI)
  - No direct push
- Update ENV_SETUP.md → Repo section: mark configured ✓

### Step 3: CI/CD Pipeline
Generate .github/workflows/ci.yml from ARCHITECTURE.md tech stack:
- Trigger: push to dev, PR to main
- Stages: lint → test → build
  (deploy stage added in Phase 6 only)
- Use exact language/runtime versions from ENV_SETUP.md
- Cache dependencies per language convention
- On failure: notify, block merge

Present generated workflow to user for approval before writing file.
Commit as AX-001: CI/CD pipeline setup.
Update ENV_SETUP.md → CI/CD section: mark configured ✓

### Step 4: Secrets Configuration
For each secret listed in ENV_SETUP.md:
- Instruct user where to add it (GitHub repo secrets, .env.local, etc.)
- Never ask for or store actual values
- After user confirms each is set, mark as present ✓ in ENV_SETUP.md
- Generate .env.example with all required keys, empty values, descriptions

### Step 5: Environment Verification
Run end-to-end verification:
1. Trigger CI run on dev branch
2. Confirm pipeline passes all stages
3. Confirm user can run project locally per README steps
4. If any failure → diagnose, fix, re-run before proceeding

### Step 6: Finalize
- Update ENV_SETUP.md → mark overall status as VERIFIED
- Update CLAUDE_STATE.md → phase complete, offload env-setup skill
- Commit: AX-002: Environment setup verified - all systems go
- Report to user: what was set up, what was skipped, any caveats

## Onboarding Mode
If PROJECT is existing (from ONBOARDING.md flow):
- Read existing ENV_SETUP.md if present, otherwise generate from codebase observation
- Present audit checklist to user:
  [ ] GitHub repo configuration
  [ ] CI/CD pipeline
  [ ] Branch protection
  [ ] Secrets audit (names only)
  [ ] Environment parity (dev/staging/prod)
- Execute only checked items
- Document gaps between current state and ideal state in ENV_SETUP.md

## Rules
- Never store, log, or echo actual secret values under any circumstance.
- Never execute infrastructure changes without explicit per-step user approval.
- IaC config (Terraform, Pulumi, etc.) is generated and presented — never applied automatically.
- If CI fails after 2 attempts → stop, report findings, ask user how to proceed.
- ENV_SETUP.md must reflect actual state after this skill completes, not intended state.