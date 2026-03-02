---
name: commercialize
description: >
  Create a commercialization strategy for a project. Analyzes the
  project for monetization potential, pricing models, market positioning,
  and go-to-market plan. Spawns gtm-strategist and researcher agents
  for market analysis. Use when you want to turn a project into a
  paid product or evaluate commercial viability.
disable-model-invocation: true
context: fork
agent: general-purpose
---

# Commercialize — Go-to-Market Strategy Creation

Create a comprehensive commercialization strategy grounded in the
actual project capabilities and market reality.

## Input

$ARGUMENTS may specify:
- Specific focus (pricing only, positioning only, full strategy)
- Target market or customer segment to explore
- Existing revenue signals or customer conversations
- Constraints (no VC, bootstrap only, side project, etc.)

If no arguments, run the full commercial strategy workflow.

## Process

### Step 1: Understand the Project

Read all project documentation:
- docs/dev/VISION.md → problem, users, anti-goals
- docs/dev/SPEC.md → features, capabilities
- docs/dev/ARCHITECTURE.md → scalability, multi-tenancy readiness
- CLAUDE.md → project type, current intent
- README.md → current positioning
- Any existing docs/gtm/ files

Extract:
- What the project ACTUALLY does (not aspirational)
- Who it's for (from VISION.md target users)
- What's unique about it vs doing nothing / using alternatives
- Technical maturity (is it v0.1 or production-ready?)

### Step 2: Market Research

Spawn `researcher` sub-agents in parallel:

**Agent 1: Competitive Landscape**
```
Research competitors and alternatives for: [problem from VISION.md]
Target users: [from VISION.md]
Use Competitive Analysis mode.
Focus on: pricing models, positioning, market gaps.
```

**Agent 2: Market Signals**
```
Research market demand signals for: [problem domain]
Look for:
- Forum posts asking for solutions (Reddit, HN, StackOverflow)
- Job postings mentioning this problem
- Industry reports or trend pieces
- Related tools that have gained traction recently
Use Domain Research mode.
```

**Agent 3 (if applicable): Pricing Intelligence**
```
Research pricing models in [market segment].
Analyze: per-seat, usage-based, freemium, flat-rate models.
Find specific examples of what similar tools charge.
Use Competitive Analysis mode, focus on pricing.
```

### Step 3: Synthesize Strategy

Using research results + project context, create:

**docs/gtm/COMMERCIAL_STRATEGY.md:**

```markdown
# Commercial Strategy: [Project Name]
Date: [date]
Status: Draft — pending user review

## Executive Summary
[3-4 sentences: what, for whom, why now, how we win]

## Market Analysis

### Problem Validation
- Evidence the problem exists: [from research]
- Who feels it most: [specific segment]
- What they currently do: [alternatives/workarounds]
- Willingness to pay signals: [from research]

### Competitive Landscape
| Competitor     | Positioning    | Pricing        | Our Advantage    |
|----------------|----------------|----------------|------------------|
[from researcher reports]

### Market Gaps
[Specific unmet needs identified from research]

## Target Customer

### Primary Segment
- Who: [specific role/company profile]
- Pain: [specific pain point]
- Budget: [estimated spend range]
- Decision process: [how they buy]

### Secondary Segment (if applicable)
[same format]

## Positioning

### One-liner
[Value prop in < 10 words]

### Positioning Statement
For [target user] who [pain point], [product] is a [category]
that [key benefit]. Unlike [primary alternative], we [differentiator].

### Messaging Pillars
1. [Pillar]: [supporting evidence from features]
2. [Pillar]: [supporting evidence]
3. [Pillar]: [supporting evidence]

## Pricing Model

### Recommended: [Model Type]

| Tier       | Price      | Includes              | Target           |
|------------|------------|-----------------------|------------------|
| Free       | $0         | [limits]              | [who/why]        |
| Pro        | $X/mo      | [features]            | [who/why]        |
| Team       | $Y/seat/mo | [features]            | [who/why]        |
| Enterprise | Custom     | [features]            | [who/why]        |

### Rationale
[Why this model — backed by market research, not guessing]

### Pricing Risks
- [Risk: what could go wrong with this pricing]
- [Mitigation: how to address it]

## Go-to-Market Plan

### Phase 1: Validate (Weeks 1-4)
- [ ] Launch free tier / beta
- [ ] Reach [N] active users
- [ ] Conduct [N] user interviews
- [ ] Validate pricing hypothesis with [method]

### Phase 2: Launch (Weeks 5-8)
- [ ] Enable paid tiers
- [ ] Landing page with clear value prop
- [ ] [N] paying customers target
- [ ] Content marketing: [specific channels and cadence]

### Phase 3: Grow (Weeks 9-16)
- [ ] [Growth channel 1]: [specific tactic]
- [ ] [Growth channel 2]: [specific tactic]
- [ ] MRR target: $[amount]

### Channels (prioritized)
| Channel        | Effort   | Expected Impact | Start When      |
|----------------|----------|-----------------|-----------------|
| [channel]      | [h/week] | [estimated]     | [trigger]       |

## Metrics Dashboard

| Metric              | Current | 30-Day Target | 90-Day Target |
|---------------------|---------|---------------|---------------|
| Active users        |         |               |               |
| Paid conversions    |         |               |               |
| MRR                 |         |               |               |
| Churn rate          |         |               |               |
| CAC                 |         |               |               |

## Effort Estimate
- Strategy execution: [hours/week]
- Content creation: [hours/week]
- Customer conversations: [hours/week]
- Total: [hours/week] — [realistic for one person? If not, what to cut]

## Open Questions
[Things that need user input or further research]

## Next Steps
1. [Most important next action]
2. [Second action]
3. [Third action]
```

### Step 4: Present and Iterate

Present the strategy to the user. Explicitly ask:
1. "Does the market analysis match your intuition?"
2. "Is the pricing in the right ballpark?"
3. "Is the effort estimate realistic for your situation?"
4. "Any segments or competitors I missed?"

Iterate based on feedback.

### Step 5: Update Project Configuration

After user approves:
1. Set PROJECT_INTENT to `commercial-saas` in CLAUDE.md (if not already)
2. If TASKS.md exists, suggest adding commercial tasks:
   - Landing page
   - Billing/subscription integration
   - Onboarding flow
   - Analytics/metrics setup
3. If /promote hasn't been run, suggest it for content strategy

## Rules

- Ground EVERYTHING in research. No "you could charge $50/mo" without
  evidence of what the market bears.
- Be brutally honest about competitive position. If there's a
  well-funded competitor doing the same thing, say so and identify
  the viable niche.
- Effort estimates must be realistic for a solo developer or small
  team. A strategy that requires 40 hours/week of marketing alongside
  full-time development is not viable.
- Pricing recommendations should include a "start here" number and
  a "test this" plan. Never present pricing as final.
- If the project isn't mature enough to commercialize (missing core
  features, no users), say so honestly and recommend what to build
  first.
- The strategy is a LIVING DOCUMENT. Remind the user to revisit
  monthly and update based on actual data.
