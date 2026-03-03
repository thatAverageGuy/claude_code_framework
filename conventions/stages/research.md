# Research Stage

Research fills knowledge gaps with real, validated, factual data.
No assumptions. No theoretical flowers. Every finding must be
grounded in reality.

────────────────────────────────────────────────────────
## PRINCIPLES
────────────────────────────────────────────────────────
- Research is driven by specific questions, not vague exploration
- Every finding must be sourced and verifiable
- If Claude can't get the data, design a handoff for the user
- Assumptions labeled as assumptions, never presented as facts
- Research scope agreed with user before starting

────────────────────────────────────────────────────────
## RESEARCH TYPES (non-exhaustive)
────────────────────────────────────────────────────────
Whatever the project needs. These are examples, not a fixed list.

**Technical**
- Tech stack evaluation (does X actually support Y?)
- Framework/library comparison with real benchmarks
- Infrastructure options and cost analysis
- Integration feasibility
- Latest developments in relevant technologies

**Market & Commercial**
- Market size and trends (with data sources)
- Competitor landscape (real products, features, pricing)
- Target audience identification and validation
- Pricing benchmarks against real alternatives
- Gap analysis — what's missing in the market

**Audience & Positioning**
- Target segment identification
- Prospect and customer research
- Positioning relative to existing solutions
- Channel identification

**Operational**
- Deployment options and cost modeling
- Compliance/regulatory requirements
- Service/tool availability and pricing
- Scaling characteristics and limits

────────────────────────────────────────────────────────
## WORKFLOW
────────────────────────────────────────────────────────

### Step 1: Scope
Agree with user on:
- What specific questions need answers
- What sources are acceptable
- What level of depth is needed
- Budget/time constraints on research itself

### Step 2: Conduct
Claude executes using available tools:
- Web search for current data
- Documentation review
- API exploration
- Tool/service evaluation
- Competitor product inspection

For each finding:
- Record the source
- Record the date (data freshness matters)
- Note confidence level (verified / likely / uncertain)
- Flag anything contradicting prior assumptions

### Step 3: Validate
- Cross-reference across multiple sources
- Flag single-source claims
- Test technical claims where possible (actually try it)
- Present raw findings to user for review

### Step 4: Report
Write research report. One per topic.

────────────────────────────────────────────────────────
## USER HANDOFF PROTOCOL
────────────────────────────────────────────────────────
When Claude can't get the data (paywalled, requires accounts,
needs real-world experiments, customer interviews, etc.):

1. Explain what's needed and why
2. Provide complete handoff document:

```markdown
# Research Handoff: [Topic]

## What We Need
[Specific data/information required]

## Why It Matters
[How this affects project decisions]

## Suggested Approach
1. [Exact step]
2. [Exact step]
3. [What to record/capture]

## What To Bring Back
[Exact format/data points Claude needs]

## Alternative If Not Feasible
[What we'd do instead]

## Tools/Resources That May Help
- [Tool]: [what it does, cost, how to use]
```

3. Wait for user to complete and return results
4. Incorporate into research report

────────────────────────────────────────────────────────
## RESEARCH REPORT TEMPLATE
────────────────────────────────────────────────────────
Lives at: `docs/research/[topic]_report.md`

```markdown
# Research Report: [Topic]

## Date
[date]

## Research Question
[Specific question this answers]

## Summary
[2-3 lines of key findings]

## Findings

### [Finding 1]
- **Detail**: [what was found]
- **Source**: [where from]
- **Date**: [data freshness]
- **Confidence**: Verified / Likely / Uncertain

### [Finding 2]
...

## Comparative Analysis (if applicable)
| Criterion | Option A | Option B | Option C |
|-----------|----------|----------|----------|
| [metric]  | [data]   | [data]   | [data]   |

## Implications
[What findings mean for the project]

## Recommendations
[Claude's recommendation with rationale]

## Open Gaps
[What we still don't know]

## Raw Sources
- [URL/reference] — [what it provided]
```

────────────────────────────────────────────────────────
## TRANSITION CRITERIA
────────────────────────────────────────────────────────
Research is complete when:
- All scoped questions have answers (or documented as unanswerable)
- Findings are validated and sourced
- User has reviewed reports
- Remaining gaps are acknowledged and non-blocking
