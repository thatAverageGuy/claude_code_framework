# Tooling Overview

When to use skills, agents, hooks, or convention files.

────────────────────────────────────────────────────────
## DECISION GUIDE
────────────────────────────────────────────────────────

| Need | Use | Why |
|------|-----|-----|
| Repeatable multi-step procedure | **Skill** | Consistent execution every time |
| Isolated/parallel work | **Subagent** | Separate context, doesn't bloat main conversation |
| Deterministic automation (always fires) | **Hook** | No token cost to decide, guaranteed execution |
| Reference material, templates, guidelines | **Convention file** | Load-on-demand via reference index |
| Collaborative, conversational work | **Main conversation** | Needs full context and user interaction |

────────────────────────────────────────────────────────
## WHAT NOT TO DO
────────────────────────────────────────────────────────
- Don't make a skill for something that's just "read a convention file"
- Don't create an agent for conversational work (discovery, analysis)
- Don't hook everything — each hook is a system call
- Don't auto-trigger memory writes mid-session — save for natural boundaries
- Don't bloat skills — under 70 lines, let convention files carry detail

────────────────────────────────────────────────────────
## SKILL FAILURE HANDLING
────────────────────────────────────────────────────────
Skills are linear step sequences. If a step fails:
- **Stop immediately.** Do not skip the step to continue.
- **Surface the failure to the user** with what failed and why.
- **Never proceed past a destructive step** (push, delete, deploy)
  without explicit user confirmation that the prior steps succeeded.
Skills with specific failure paths document them in `## On Failure`.

────────────────────────────────────────────────────────
## SKILL vs CONVENTION FILE
────────────────────────────────────────────────────────
**Skill**: Orchestrates a process. Steps to execute in order.
Loaded only when invoked. Has YAML frontmatter for model, tools.

**Convention file**: Reference material. How things should be done.
Loaded when Claude judges the topic is relevant. No execution logic.

Example: `conventions/development/git_workflow.md` describes the
commit procedure. `/commit` skill executes it step by step.

────────────────────────────────────────────────────────
## CORE vs INTENT-SPECIFIC
────────────────────────────────────────────────────────

**Core** — always available, any project:
`/commit`, `/bootstrap`, `/tech-eval`, `/status`, `/context-save`

**Intent-specific** — loaded when intent establishes relevance:
`/commercialize`, `/promote`, `/prospect`

Intent-specific skills have `disable-model-invocation: true`.
This means Claude won't auto-trigger them — the user must invoke
them explicitly (e.g., `/commercialize`, `/promote`, `/prospect`).
This is intentional: their descriptions don't consume context
unless needed, and the user decides when commercial/outreach
work is relevant.
