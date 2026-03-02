---
name: deploy-readiness
description: >
  Full deployment readiness check. Spawns deploy-validator sub-agent
  to run the deployment checklist, collects results, and presents
  a go/no-go report. Use during Phase 6 (deployment) or anytime
  before deploying to a new environment.
disable-model-invocation: true
context: fork
agent: general-purpose
---

# Deployment Readiness Check — Phase 6 Support

Orchestrate a comprehensive deployment readiness validation.

## Input

$ARGUMENTS may specify:
- Target environment (production, staging, etc.)
- Specific areas to focus on (e.g., "security only", "CI/CD only")
- Whether this is a first deploy or a re-check after fixes

If no arguments, run the FULL checklist against the primary
deployment target from CLAUDE.md.

## Process

### Step 1: Gather Context

Read these files:
- CLAUDE.md → deployment target, tech stack, conventions
- docs/dev/ARCHITECTURE.md → components, topology
- docs/dev/SPEC.md → non-functional requirements (performance targets,
  security requirements, compliance)
- docs/dev/DEPLOY.md → existing deployment docs (if any)
- docs/user/CONFIG_REFERENCE.md → expected env vars

Summarize the deployment context:
- What's being deployed (components, services)
- Where it's being deployed (target environment)
- What the requirements are (from SPEC.md NFRs)

### Step 2: Spawn deploy-validator

Spawn the `deploy-validator` sub-agent with this task:

```
Run the full deployment readiness checklist for this project.

Project context:
- Tech stack: [from CLAUDE.md / ADRs]
- Deployment target: [from CLAUDE.md]
- Components: [from ARCHITECTURE.md]
- NFR targets: [from SPEC.md]
- Known env vars: [from CONFIG_REFERENCE.md]

Focus areas: [from $ARGUMENTS or "all"]

Adapt checklist commands to the project's language and framework.
Skip sections that don't apply (e.g., skip database checks if
no database, skip container checks if serverless).
```

### Step 3: Process Results

When deploy-validator returns its report:

1. **Parse the summary table** — extract pass/fail/warn/skip counts
2. **Categorize failures by urgency**:
   - Blocking: security vulnerabilities, missing auth, hardcoded secrets,
     broken pipeline — cannot deploy with these
   - Important: missing monitoring, incomplete docs, no rollback tested
     — should fix but can deploy with risk accepted
   - Advisory: image size, minor config improvements — nice to have
3. **Cross-reference against SPEC.md NFRs** — are all non-functional
   requirements verifiably met?

### Step 4: Generate Action Plan

For each failure, create a remediation task:

```markdown
## Remediation Plan

### Blocking (must fix before deploy)

| # | Issue                    | Fix                           | Effort  |
|---|--------------------------|-------------------------------|---------|
| 1 | [from deploy-validator]  | [specific fix action]         | [est.]  |

### Important (fix before or shortly after deploy)

| # | Issue                    | Fix                           | Effort  |
|---|--------------------------|-------------------------------|---------|

### Advisory (improve when convenient)

| # | Issue                    | Fix                           | Effort  |
|---|--------------------------|-------------------------------|---------|
```

### Step 5: Present Go/No-Go Report

```markdown
## Deployment Readiness: Go/No-Go Report
Date: [date]
Target: [environment]
Project: [name]

### Verdict: [GO | NO-GO | CONDITIONAL GO]

### Summary
| Category        | Pass | Fail | Warn | Skip |
|-----------------|------|------|------|------|
| [from validator]|      |      |      |      |
| **TOTAL**       |      |      |      |      |

### Blocking Issues: [count]
[List each with one-line description]

### Risk Assessment
[If CONDITIONAL GO: what risks are you accepting by deploying now?]

### Remediation Plan
[From Step 4]

### Recommended Deploy Procedure
1. [Fix blocking issues]
2. [Run deploy-readiness again to verify fixes]
3. [Execute deployment per DEPLOY.md]
4. [Run smoke tests]
5. [Monitor for 30 minutes post-deploy]
6. [If issues: execute rollback per DEPLOY.md]

### Post-Deploy Tasks
- [ ] Verify health endpoint responding
- [ ] Check error tracking for new errors
- [ ] Verify key user flows work end-to-end
- [ ] Monitor metrics for 24 hours
- [ ] Address "Important" remediation items within [timeframe]
```

### Step 6: Offer Next Steps

Based on verdict:

**GO**: "All checks passed. Ready to deploy. Want me to walk through
the deploy procedure from DEPLOY.md?"

**CONDITIONAL GO**: "There are [N] non-blocking issues. You can deploy
with these risks accepted. Want me to create BF- tasks for the
remediation items?"

**NO-GO**: "[N] blocking issues found. Here's the remediation plan.
Want me to create tasks and start fixing? After fixes, run
/deploy-readiness again to re-validate."

## Intent-Specific Additions

**build-in-public:**
- Check: README is polished for first-time visitors
- Check: GitHub repo has description, topics, badges
- Check: Demo or screenshot available
- Add to post-deploy: "Draft launch announcement post"

**commercial-saas:**
- Check: Landing page accessible
- Check: Signup/onboarding flow works
- Check: Billing integration functional
- Check: Terms of service / privacy policy in place
- Add to post-deploy: "Execute launch sequence from LAUNCH_PLAN.md"

**client-delivery:**
- Check: Client environment access verified
- Check: HANDOFF.md is complete
- Check: Client-specific config documented
- Add to post-deploy: "Schedule handoff session with client"

## Rules

- NEVER say "ready to deploy" if there are blocking issues.
- The user can override NO-GO — that's their prerogative. But make
  the risks explicit.
- If DEPLOY.md doesn't exist yet, flag this as a blocking issue and
  offer to generate it.
- If this is the first run, expect many failures. Frame it
  constructively: "Here's what needs to be set up" not "everything
  is broken."
- Re-runs after fixes should be faster — note what changed since
  last check.
