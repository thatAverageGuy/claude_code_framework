---
name: tech-eval
description: Evaluate technology options with parallel research and structured comparison. Use when choosing between frameworks, libraries, services, or approaches.
argument-hint: "[option1] vs [option2] [vs option3]"
---

Parallel technology evaluation for informed decisions.

## Process

1. **Gather requirements context**
   - Read discovery findings and strategy docs
   - Identify the specific requirements this tech must satisfy
   - List evaluation criteria (performance, cost, learning curve,
     community, maintenance, compatibility, etc.)
   - Confirm criteria with user before researching

2. **Spawn parallel researcher agents**
   - One researcher per technology option
   - Each evaluates their option against the agreed criteria
   - Each produces a structured findings report

3. **Synthesize comparison**

   ```markdown
   ## Comparison Matrix
   | Criterion | Option A | Option B | Option C |
   |-----------|----------|----------|----------|
   | [metric]  | [data]   | [data]   | [data]   |

   ## Option Summaries
   ### [Option] — Verdict: Recommended / Viable / Not Recommended
   - Strengths: [specific, evidenced]
   - Weaknesses: [specific, evidenced]
   - Risk: [what could go wrong]

   ## Recommendation
   [Which option and why, grounded in the comparison]

   ## Dissenting Case
   [Why someone might reasonably choose differently]

   ## Confidence
   [How confident we are, what would change the recommendation]
   ```

4. **Present to user**
   - Show comparison first, recommendation second
   - User decides — not Claude
   - Record decision as ADR

## Rules
- Never recommend based on popularity alone
- Test technical claims where possible
- Include cost projections where relevant
- Flag vendor lock-in risks explicitly
