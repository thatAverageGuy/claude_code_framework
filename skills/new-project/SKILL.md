---
name: new-project
description: >
  Greenfield project kickoff. Runs the Phase 0 Vision & Scope interview
  to establish project purpose, type, intent, target users, anti-goals,
  and constraints. Produces VISION.md and sets PROJECT_TYPE/PROJECT_INTENT
  in CLAUDE.md. Use when starting a brand new project from scratch.
disable-model-invocation: true
---

# New Project Kickoff — Phase 0: Vision & Scope

You are initiating a brand new project. Follow this procedure exactly.
Do NOT skip to code, architecture, or technology choices. This phase
is pure discovery — LEVEL 0 (read only, no file changes yet).

## Step 1: Project Classification

Ask the user explicitly (do not infer):

**PROJECT_TYPE** — choose one:
- `personal` — your own project, no external stakeholders
- `client` — someone is paying for this (consulting, contract)
- `open-source` — intended for public use and contribution

**PROJECT_INTENT** — choose one (or "not decided yet"):
- `learning` — building to learn, no audience goals
- `build-in-public` — sharing the journey for visibility/community
- `commercial-saas` — monetized product, paying users
- `consulting-showcase` — demonstrates capabilities for consulting leads
- `community-tool` — free tool for a specific community
- `client-delivery` — contracted deliverable for a client
- `not-set` — decide later (all GTM/sales skills remain available
  but won't auto-suggest deliverables)

Wait for answers before proceeding.

## Step 2: Structured Interview

Adapt depth to the user's starting clarity. If they have a clear idea,
move through quickly. If vague, dig deeper. Use follow-up questions.

### Core Questions (always ask)

1. **Problem Statement**
   "What specific problem does this solve? Who has this problem today,
   and what do they currently do about it?"
   - Push for specificity. "Makes X easier" → "For whom? How? Easier
     than what alternative?"
   - The problem statement must be FALSIFIABLE — you could test whether
     the problem actually exists.

2. **Target Users**
   "Who exactly will use this? Describe a specific person or role."
   - Reject "everyone" or "developers" — too broad.
   - Aim for: "ML engineers at mid-size companies who need to deploy
     models but don't have dedicated MLOps teams"

3. **Success Criteria**
   "How will you know this project succeeded? What's measurable?"
   - For client: contract deliverables, acceptance criteria
   - For commercial: revenue, user count, retention
   - For open-source: stars, contributors, adoption
   - For learning: specific skills acquired, project completed
   - For build-in-public: followers, engagement, opportunities generated

4. **Anti-Goals** (minimum 3)
   "What is this project explicitly NOT trying to do?"
   - These prevent scope creep. Push for at least 3.
   - Example: "This is NOT a general-purpose framework. It solves
     one specific problem for one specific audience."

5. **Constraints**
   "What constraints are non-negotiable?"
   - Timeline: when does this need to be usable?
   - Budget: any spending limits? (hosting, APIs, tools)
   - Platform: must it run somewhere specific?
   - Compliance: any regulatory requirements?
   - Technical: must use specific language/framework? Why?

### Client-Specific Questions (PROJECT_TYPE: client)

6. "Who is the client? What's their business context?"
7. "Who are the stakeholders? Who approves deliverables?"
8. "What's the contractual structure? Fixed scope, T&M, retainer?"
9. "What's their existing technical environment?"
10. "What does handoff look like? Do they maintain it after?"

### Intent-Specific Questions

**build-in-public:**
11. "Who's your target audience for content? Where do they hang out?"
12. "What's your posting cadence comfort level? Daily/weekly?"
13. "What angle makes YOUR take on this interesting? Why would
    someone follow your journey vs just using the final product?"

**commercial-saas:**
14. "Do you have any signal that people will pay for this?"
15. "Who's the buyer vs the user? (Sometimes different)"
16. "What's your pricing intuition? Free tier? Per-seat? Usage-based?"

**consulting-showcase:**
17. "What kind of clients do you want this to attract?"
18. "What capability does this demonstrate?"
19. "Should the project itself be the demo, or do you need separate
    demo materials?"

## Step 3: Identify Gaps

After the interview, explicitly list:
- What you know (confirmed by user)
- What you're assuming (state assumptions, ask for confirmation)
- What's still unknown (flag for Phase 1)

Present this to the user and resolve assumptions before proceeding.

## Step 4: Synthesize VISION.md

Draft VISION.md using the doc-generator template format:

```markdown
# Vision: [Project Name]
Last updated: [date]

## Problem Statement
[Specific, falsifiable]

## Target Users
[Specific persona or role with context]

## Success Criteria
[Measurable outcomes]

## Anti-Goals (Explicitly Out of Scope)
1. [Anti-goal with reasoning]
2. [Anti-goal]
3. [Anti-goal]

## Constraints
[Non-negotiable constraints]

## Project Classification
- Type: [PROJECT_TYPE]
- Intent: [PROJECT_INTENT]
```

Present the draft to the user. Iterate until approved.

## Step 5: Update CLAUDE.md

After user approves VISION.md:
1. Set PROJECT_TYPE in the PROJECT-SPECIFIC CONTEXT section
2. Set PROJECT_INTENT (or "not-set" if user deferred)
3. Set CURRENT_PHASE to "1-requirements"

## Step 6: Advise Next Steps

Tell the user:
- "Phase 0 complete. VISION.md is your north star document."
- "Next: Phase 1 (Requirements). We'll define what exactly to build."
- "You can start Phase 1 now or come back to it later."
- "To validate phase readiness at any point, use /phase-gate"

If PROJECT_TYPE is client and a proposal is needed:
- Draft docs/client/PROPOSAL_DRAFT.md based on VISION.md
- Present for user review

## Rules

- Do NOT discuss technology, architecture, or implementation in this phase.
  If the user jumps ahead, acknowledge their ideas but redirect:
  "Good thought — let's capture that as a constraint. We'll make
  technology decisions in Phase 2 once requirements are clear."
- Do NOT create any project files yet (except VISION.md after approval).
  Phase 3 handles scaffolding.
- If the user already has a clear vision and answers questions quickly,
  don't pad the conversation. Move through efficiently.
- If the user is vague, be patient but persistent. A vague VISION.md
  leads to a vague SPEC.md leads to building the wrong thing.
