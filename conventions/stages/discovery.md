# Discovery Stage

Discovery removes vagueness so that no ambiguity derails
downstream work. It's conversation-heavy and interactive.

Claude pushes back, cross-questions, surfaces contradictions,
and plays devil's advocate. Nothing is accepted at face value.

For track-specific entry paths, see:
- `conventions/workflows/greenfield.md` (steps 1-2)
- `conventions/workflows/onboarding.md` (steps 1-5)

This file covers the shared discovery protocols used by both tracks.

────────────────────────────────────────────────────────
## INTERVIEW PROTOCOL
────────────────────────────────────────────────────────
Not a checklist. A guided exploration. Go where the
conversation leads. But cover these dimensions:

### Core
- What is this? What isn't it?
- Why does this need to exist? What problem does it solve?
- Who is it for? (users, customers, internal, self)
- What does success look like?

### Intent (explore, don't prescribe)
- Is this for learning, building a product, client work,
  portfolio, open source, exploration, or something else?
- Is there a commercial angle? Revenue model?
- Is there a public/community angle?
- Will this need marketing, content, outreach?
- Could the intent evolve?
- Is this undecided? That's fine — capture what IS known.

Intent is a living understanding, not a fixed label.

### Technical
- Language, framework, infrastructure preferences/constraints
- Performance, scale, availability requirements
- Security, compliance, regulatory requirements
- Deployment target and operations model
- Existing tools, services, accounts available

### Constraints
- Budget (infrastructure, services, tools)
- Timeline (hard deadlines, soft targets)
- Skills (what user knows, what they want to learn)
- Dependencies (external services, APIs, people)

### Follow-Up Rules
- Every answer gets at least one follow-up question
- "Why?" is always valid
- Surface tradeoffs: "You said X, but that conflicts with Y"
- Challenge assumptions: "Are you sure? Because..."
- Verify against reality: "Does [thing] actually support that?"

────────────────────────────────────────────────────────
## EXISTING INFORMATION INGESTION
────────────────────────────────────────────────────────
If user provides existing docs, content, requirements, prior
conversations, references, or any other material:

1. Read and understand everything provided
2. Note what's clear vs what's ambiguous
3. Cross-reference against interview answers
4. Flag contradictions
5. Incorporate into findings doc

────────────────────────────────────────────────────────
## FINDINGS DOC
────────────────────────────────────────────────────────
Output of discovery. Lives at `docs/discovery/findings.md`.

Template (starting point — extend as needed):

```markdown
# Discovery Findings

## Date
[date]

## Project Overview
[What this is, in our own words after discovery]

## Intent
[Current understanding — may be vague, that's fine]
- Primary goal: [what]
- Secondary goals: [if any]
- Undecided aspects: [what's still unclear]

## Key Decisions Made
- [Decision]: [rationale] | Alternatives: [what]

## Technical Landscape
- Language/Framework: [what and why]
- Infrastructure: [what's available/planned]
- Constraints: [budget, timeline, skills]

## Research Needed
- [ ] [Topic] — [why we need this, what gap it fills]

## Open Questions
- [Question] — [context, why it matters]

## Risks & Concerns
- [Risk] — [severity, mitigation ideas]

## Raw Interview Notes
[Condensed facts from the conversation]
```

────────────────────────────────────────────────────────
## TRANSITION CRITERIA
────────────────────────────────────────────────────────
Discovery is "done enough" when:

- No blocking unknowns remain (those that would cause wrong
  decisions downstream)
- Research gaps are identified and scoped
- User has confirmed findings are accurate
- Findings doc is written and reviewed

Non-blocking unknowns can be deferred.
