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
`/commit`, `/discover`, `/bootstrap`, `/tech-eval`,
`/gate-check`, `/context-save`

**Intent-specific** — loaded when intent establishes relevance:
`/commercialize`, `/promote`, `/prospect`

Intent-specific skills should have `disable-model-invocation: true`
so their descriptions don't consume context unless the user
explicitly invokes them.
