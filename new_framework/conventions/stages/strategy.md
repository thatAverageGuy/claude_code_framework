# Strategy Stage

Strategy is where decisions get made. Every decision grounded
in analysis, not assumptions. Collaborative — Claude proposes,
challenges, advises. User decides.

Strategy is a living doc. It evolves as the project progresses.

────────────────────────────────────────────────────────
## PRINCIPLES
────────────────────────────────────────────────────────
- Every decision has documented rationale
- Every decision references supporting analysis
- Alternatives considered are always recorded
- What we're NOT doing is as important as what we are
- Strategy approved by user before planning begins

────────────────────────────────────────────────────────
## WORKFLOW
────────────────────────────────────────────────────────

### Step 1: Frame Decisions
From analysis, list every decision needed. Group them:
- Technical (stack, architecture, infrastructure)
- Product/scope (features, MVP, phasing)
- Intent-specific (audience, positioning, channels)
- Operational (deployment, monitoring, support)

### Step 2: Decide (with user)
For each decision:
1. Present options with tradeoffs (from analysis)
2. State Claude's recommendation with rationale
3. Discuss with user
4. Record decision, rationale, alternatives

### Step 3: Define Boundaries
Document explicitly:
- In scope (MVP / current phase)
- Out of scope (and why)
- Deferred (and conditions for revisiting)

### Step 4: Define Success
- What does "done" look like for first milestone?
- What metrics/criteria determine success?
- How will we verify against reality?

### Step 5: Document
Write strategy doc + ADRs for significant decisions.

────────────────────────────────────────────────────────
## INTENT-SPECIFIC STRATEGY
────────────────────────────────────────────────────────
Dynamic — only what's relevant gets addressed. These are
examples of what might emerge, not a fixed menu.

Strategy areas produce their own living docs within
`docs/strategy/` as needed.

────────────────────────────────────────────────────────
## STRATEGY DOC
────────────────────────────────────────────────────────
Lives at: `docs/strategy/strategy.md` (living document)

```markdown
# Strategy

## Last Updated
[date]

## Project Intent
[Current understanding — may have evolved]

## Core Decisions

### [Decision Area]
- **Decision**: [what]
- **Rationale**: [why, grounded in analysis]
- **Alternatives**: [what else considered]
- **Revisit if**: [conditions that would change this]

## Scope

### In Scope (Current Phase)
- [item]

### Out of Scope
- [item] — [why]

### Deferred
- [item] — [revisit when/if]

## Success Criteria
- [ ] [Specific, measurable criterion]

## Intent-Specific Strategy
[Only sections that apply]

## ADR References
- ADR-001: [title] — [link]

## Evolution Log
- [date]: [what changed and why]
```

────────────────────────────────────────────────────────
## ADR FORMAT
────────────────────────────────────────────────────────
Lives at: `docs/dev/adr/ADR-XXX.md`

```markdown
# ADR-XXX: [Title]

## Status
Proposed | Accepted | Superseded by ADR-YYY

## Context
[What prompted this decision]

## Decision
[What we decided]

## Rationale
[Why — grounded in analysis/research]

## Alternatives Considered
- [Alternative]: [why rejected]

## Consequences
- Positive: [gains]
- Negative: [losses/risks]
- Neutral: [side effects]

## References
- Analysis: [link]
- Research: [link]
```

────────────────────────────────────────────────────────
## TRANSITION CRITERIA
────────────────────────────────────────────────────────
Strategy is ready for PLAN when:
- All blocking decisions made and documented
- Scope defined and agreed
- Success criteria set
- User explicitly approved
- ADRs written for significant decisions
