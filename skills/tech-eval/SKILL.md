---
name: tech-eval
description: >
  Parallel technology comparison. Takes a list of technology options,
  spawns researcher sub-agents to evaluate each in parallel, then
  synthesizes results into a comparison table with a recommendation.
  Use during Phase 2 (tech design) when choosing between frameworks,
  libraries, databases, or other technical options.
disable-model-invocation: true
context: fork
agent: general-purpose
---

# Technology Evaluation — Phase 2 Support

Orchestrate a parallel technology comparison using researcher sub-agents.

## Input

The user provides: $ARGUMENTS

This should include:
1. **Decision category**: what kind of choice (framework, database, etc.)
2. **Options to evaluate**: list of specific technologies to compare
3. **Context**: link to or summary of relevant SPEC.md requirements

If any of these are missing, ask the user before proceeding.

## Process

### Step 1: Gather Requirements Context

Read these files if they exist:
- docs/dev/SPEC.md — extract relevant requirements
- docs/dev/VISION.md — extract constraints and goals
- CLAUDE.md — extract PROJECT_TYPE and PROJECT_INTENT

Summarize the key requirements this technology must satisfy.
These become the evaluation criteria.

### Step 2: Spawn Parallel Researchers

For EACH technology option, spawn a `researcher` sub-agent in
Technology Evaluation mode with this task prompt:

```
Evaluate [TECHNOLOGY_NAME] for the following use case:

Project: [from VISION.md]
Key requirements:
- [requirement 1 from SPEC.md]
- [requirement 2]
- [requirement 3]
- [non-functional: performance/scale/security targets]

PROJECT_INTENT: [intent — affects evaluation criteria]
- If commercial-saas: evaluate multi-tenancy support, scaling cost
- If build-in-public: evaluate learning curve, community activity
- If client-delivery: evaluate enterprise readiness, support SLAs

Use the Technology Evaluation output format.
```

Spawn ALL researchers in a single message for parallel execution.

### Step 3: Collect and Synthesize

After all researchers return, synthesize into a comparison:

```markdown
# Technology Evaluation: [Decision Category]
Date: [date]
Options evaluated: [list]

## Requirements Criteria
[List the specific requirements each option was evaluated against]

## Comparison Matrix

| Criterion              | [Option A]  | [Option B]  | [Option C]  |
|------------------------|-------------|-------------|-------------|
| [Requirement 1]        | [fit rating]| [fit rating]| [fit rating]|
| [Requirement 2]        | [fit rating]| [fit rating]| [fit rating]|
| Maturity / Stability   | [rating]    | [rating]    | [rating]    |
| Community / Ecosystem  | [rating]    | [rating]    | [rating]    |
| Learning Curve         | [rating]    | [rating]    | [rating]    |
| Lock-in Risk           | [rating]    | [rating]    | [rating]    |
| Cost (if applicable)   | [rating]    | [rating]    | [rating]    |

Ratings: ✅ Strong | ⚠️ Adequate | ❌ Weak | — Not applicable

## Option Summaries

### [Option A]
**Strengths**: [from researcher report]
**Weaknesses**: [from researcher report]
**Best for**: [specific scenario where this option wins]

### [Option B]
[same format]

### [Option C]
[same format]

## Recommendation

**Primary recommendation**: [Option] — [one sentence why]

**Rationale**: [paragraph grounding the choice in specific requirements]

**Dissenting case**: [when would a different option be better?
Include this to prevent premature lock-in]

## Confidence Assessment
- High confidence: [aspects we're sure about]
- Needs further investigation: [aspects that remain uncertain]
- Assumptions made: [any assumptions in the evaluation]
```

### Step 4: Present for Decision

Present the comparison to the user. Explicitly ask:
1. "Does this match your intuition? Any surprises?"
2. "Any additional criteria I should have considered?"
3. "Ready to decide, or want deeper investigation on any option?"

### Step 5: Record Decision

After user decides:
1. Create ADR in docs/dev/adr/ with the standard format:
   ```markdown
   # ADR-[N]: [Decision Title]
   Date: [date]
   Status: Accepted

   ## Context
   [Why this decision was needed]

   ## Decision
   [What was chosen]

   ## Alternatives Considered
   | Alternative | Pros | Cons | Why Not |
   |-------------|------|------|---------|

   ## Consequences
   [What this decision implies for the project]
   ```
2. Confirm ADR created and advise user of implications

## Rules

- Never recommend without showing the comparison first. The user
  decides, not the agent.
- If only one option is provided, still evaluate it against
  requirements — "should we use X?" deserves a rigorous answer,
  not just "sure."
- If the user's options list is missing an obvious candidate,
  mention it: "You might also want to consider [Y] because [reason].
  Want me to include it in the evaluation?"
- Researchers may return conflicting data. When this happens, flag
  the conflict explicitly rather than silently picking one version.
- For deep technical evaluations where Sonnet may not have sufficient
  reasoning depth, advise the user: "This evaluation involves complex
  tradeoffs. Consider running with --model opus for higher quality."
