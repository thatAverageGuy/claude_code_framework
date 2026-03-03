# Greenfield Workflow

End-to-end sequence for building a new project from scratch.
Everything starts from zero — no code, no docs, possibly just
an idea (or not even that).

────────────────────────────────────────────────────────
## SEQUENCE
────────────────────────────────────────────────────────

```
1. CLASSIFY & DISCOVER
       │
2. DEBATE & SCOPE
       │
3. RESEARCH (if gaps exist)
       │
4. ANALYZE
       │
5. STRATEGIZE
       │
6. SYSTEM DESIGN
       │
7. PROJECT SETUP (AX-001 — always first task)
       │
8. FIRST COMMIT
       │
9. PLAN → EXECUTE → REVIEW (cycles)
       │
   (intent-specific tasks run alongside development)
```

────────────────────────────────────────────────────────
## 1. CLASSIFY & DISCOVER
────────────────────────────────────────────────────────
**Protocol**: `conventions/stages/discovery.md`

Start with classification — what's the intent behind this project?
Intent can be vague or undecided. That's fine. Capture what IS known.

- Learning only (private)
- Learning + portfolio (public)
- Open source (community, stars, adoption)
- Open source → SaaS evolution
- SaaS / micro-SaaS (commercial product)
- Client project / PoC
- Demos targeting specific markets/segments
- Consulting firm client acquisition
- Undecided — will clarify as it progresses

Intent is optional early on. It gets refined throughout the
project. But whatever IS known shapes everything downstream.

Then run full discovery interview. Gather all existing information —
docs, content, requirements, references, prior conversations.
Everything provided is understood, referenced, and noted.

────────────────────────────────────────────────────────
## 2. DEBATE & SCOPE
────────────────────────────────────────────────────────
This is not a rubber-stamp phase. Claude and user actively
debate and discuss to form a proper first draft.

- Project scope, vision, and boundaries
- Intent-specific decisions (intertwined with scope)
- What this IS and what this IS NOT
- MVP boundaries vs future vision
- Challenge every assumption
- Surface every tradeoff
- No premature convergence

This shapes the foundation. Take the time it needs.

Output: Clear scope document within findings doc. No vagueness
that could derail downstream work.

────────────────────────────────────────────────────────
## 3. RESEARCH
────────────────────────────────────────────────────────
**Protocol**: `conventions/stages/research.md`

Triggered by gaps identified in discovery and scoping.
Research is grounded in reality — factual, validated, sourced.

Examples (dynamic, not fixed):
- Market research, competitor analysis, pricing benchmarks
- Tech stack evaluation against actual requirements
- Infrastructure cost modeling
- Target audience validation
- Prospect/segment research
- Gap analysis for project ideas
- Latest tech developments to study

If Claude can't get the data, design handoff docs for user
with exact steps, tools, and what to bring back.

────────────────────────────────────────────────────────
## 4. ANALYZE
────────────────────────────────────────────────────────
**Protocol**: `conventions/stages/analysis.md`

Synthesize discovery + research into actionable insights.
Surface opportunities, risks, tradeoffs, constraints.
Prepare the decision landscape for strategy.

────────────────────────────────────────────────────────
## 5. STRATEGIZE
────────────────────────────────────────────────────────
**Protocol**: `conventions/stages/strategy.md`

Make grounded decisions. Document everything.
Includes intent-specific strategy if applicable:
- Commercial: pricing, GTM, revenue, budget
- Public-facing: positioning, community, content
- Outreach: prospects, channels, collateral
- Content: topics, platforms, cadence, branding, SEO

Strategy is a living doc. It evolves.

────────────────────────────────────────────────────────
## 6. SYSTEM DESIGN
────────────────────────────────────────────────────────
Technical and intent-specific design informed by strategy.

- Architecture design (considering constraints like budget,
  scale requirements, deployment targets)
- Every aspect thoroughly logged:
  - ADRs for every significant decision
  - ARCHITECTURE.md
  - STATE_MACHINES.md (system-level + component-level)
  - SPEC.md (technical specification)
- Every decision — language, framework, infrastructure, tooling,
  and non-technical (intent-specific) — documented with rationale
  and alternatives considered

System design must account for intent. A commercial SaaS with
budget constraints optimizes differently than a learning project.

────────────────────────────────────────────────────────
## 7. PROJECT SETUP (AX-001)
────────────────────────────────────────────────────────
The first task is ALWAYS project setup. Task ID: AX-001.

This covers:
- Git repository initialization
- CI/CD setup (if applicable)
- Cloud/infrastructure setup (if applicable)
- Package manager and dependency initialization
- Project directory structure creation
- Development environment configuration
- Any tooling, linting, formatting setup

### Execution Split
- **Claude does**: Everything accessible via terminal — git init,
  file creation, package init, config files, CI config writing
- **User does**: Everything requiring manual action — cloud console
  setup, account creation, API key generation, DNS configuration

### User Handoff
When manual steps are needed, Claude provides:
- Exact steps to follow
- What credentials/outputs to bring back
- Screenshots or reference links if helpful

### Setup Documentation
All steps (autonomous and manual) are logged in detail:
- AX-001 IMPL_LOG.md captures everything done
- Setup guides created if project has non-trivial setup
- Environment requirements documented

────────────────────────────────────────────────────────
## 8. FIRST COMMIT
────────────────────────────────────────────────────────
**Protocol**: `conventions/development/git_workflow.md`

After project setup, the first commit lands. It includes:
- Project skeleton (directory structure, config files)
- All bootstrapped documentation:
  - README.md
  - CONTEXT.md
  - CHANGELOG.md
  - docs/ structure with all discovery/strategy/design docs
  - TASKS.md with planned work items
- AX-001 IMPL_LOG.md and DETAIL.md

Follow full commit procedure from git_workflow convention.

────────────────────────────────────────────────────────
## 9. PLAN → EXECUTE → REVIEW (Cycles)
────────────────────────────────────────────────────────
After first commit, work proceeds in task cycles.

Each cycle:
1. **Plan** — Create DETAIL.md for next task(s)
2. **Execute** — Implement, test, log, commit
3. **Review** — Verify against strategy, adjust if needed

**Protocol files**:
- Planning: `conventions/development/task_conventions.md`
- Execution: `conventions/development/git_workflow.md`,
  `conventions/development/testing.md`,
  `conventions/development/change_levels.md`

### Intent-Specific Tasks
Alongside development tasks, intent-specific work runs in parallel
where applicable. These are proper tasks with DETAIL.md and
IMPL_LOG.md like everything else:

- Marketing content creation and posting
- Social media strategy execution
- Blog/tutorial writing
- Outreach campaigns
- Sales collateral creation
- SEO optimization
- Community engagement
- Cold email campaigns
- Demo preparation

These are dynamic — not all projects have them. They emerge
from strategy and evolve with the project.

────────────────────────────────────────────────────────
## MARKETING & CONTENT NOTE
────────────────────────────────────────────────────────
Whatever is built should be publicized to strengthen portfolio
and reach. Platforms include LinkedIn, Twitter/X, Reddit, Substack,
blogs, and others as relevant.

Claude actively participates:
- Drafts posts, articles, tutorials
- Creates email templates, outreach messages
- Designs content calendars
- Helps install/configure tools (via web search if needed)
- Executes what it can, hands off what it can't

Positioning is always honest. No marketing shallow things.
Position based on real substance and genuine value.
