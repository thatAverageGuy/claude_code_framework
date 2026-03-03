---
name: commercialize
description: Create commercialization strategy — market analysis, pricing, positioning, go-to-market plan. For SaaS, product, or commercial projects.
disable-model-invocation: true
argument-hint: "[focus-area]"
---

Commercialization strategy grounded in research, not assumptions.

## Process

1. **Understand the project**
   - Read discovery findings, analysis, and strategy docs
   - Read project context and architecture
   - Identify what's actually built vs what's planned

2. **Spawn parallel research**
   Use researcher agent for parallel investigation:
   - **Competitive landscape**: Real competitors, features, pricing
   - **Market signals**: Trends, demand indicators, timing
   - **Pricing intelligence**: How competitors and alternatives price

3. **Synthesize strategy**
   Write to `docs/strategy/commercial_strategy.md`:

   ```markdown
   # Commercial Strategy

   ## Market Analysis
   - Market size and trends (sourced)
   - Key competitors (real, with pricing)
   - Gap/opportunity identified

   ## Target Customer
   - Primary segment: [who, why]
   - Pain point: [specific, validated]
   - Alternative they use today: [what, why it's insufficient]

   ## Positioning
   - Value proposition: [one sentence]
   - Differentiation: [what we do that others don't]
   - Honest limitations: [what we don't do well]

   ## Pricing Model
   - Model: [freemium/subscription/usage/one-time]
   - Tiers: [benchmarked against competitors]
   - Rationale: [why this model, grounded in research]

   ## Go-to-Market Plan
   - Phase 1: [initial traction strategy]
   - Phase 2: [growth strategy]
   - Channels: [specific, prioritized]
   - Budget estimate: [realistic]

   ## Metrics & Success Criteria
   - [metric]: [target] — [how to measure]

   ## Risks
   - [risk]: [mitigation]
   ```

4. **User review**
   - Present strategy for feedback
   - Iterate based on user input
   - Create tasks for execution items

## Rules
- Every claim must be sourced from research
- Pricing must be benchmarked, not invented
- Be honest about limitations and risks
- Position based on substance, not marketing fluff
