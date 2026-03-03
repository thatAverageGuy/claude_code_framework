---
name: create-tool
description: Create or modify skills, agents, and hooks for the current project. Use when the project needs a custom skill, a new agent, a new hook, or an update to an existing one.
argument-hint: "[skill|agent|hook] [name] [purpose]"
---

**CONFIRMATION REQUIRED**: This skill modifies the project's
tooling configuration. Always confirm with the user before
writing or changing any skill/agent/hook.

Create, modify, or update skills, agents, and hooks to fit
project needs.

## Process

1. **Understand the need**
   - What problem does this tool solve?
   - Is it a repeatable procedure (skill), isolated work (agent),
     or deterministic automation (hook)?
   - Does an existing tool already cover this? Check:
     - `.claude/skills/` for existing skills
     - `.claude/agents/` for existing agents
     - `.claude/settings.json` for existing hooks
     - `conventions/tooling/overview.md` for the decision guide

2. **Design the tool**
   For a **skill**:
   - Define the step sequence (keep under 70 lines)
   - Determine if it's destructive (needs CONFIRMATION REQUIRED)
   - Identify which convention files it references
   - Draft the YAML frontmatter (name, description, argument-hint)

   For an **agent**:
   - Define its role and capabilities
   - Choose model (sonnet for most, opus for complex reasoning)
   - Choose tools — prefer read-only unless write is essential
   - Define output format and rules
   - Agents return results to caller, not write to disk directly

   For a **hook**:
   - Choose the event (SessionStart, PreToolUse, PostToolUse,
     PreCompact, Stop, SessionEnd, etc.)
   - Choose type: `command` (shell, zero token cost) or
     `prompt` (Claude responds, costs tokens)
   - Define matcher if event-specific (e.g., `Bash|Edit|Write`)
   - Decide sync vs async (async for logging, sync for blocking)
   - If the script is more than a one-liner, create a file in
     `.claude/hooks/<name>.sh`

3. **Present to user**
   - Show the full draft
   - Explain what it does, when it triggers, what it changes
   - Get explicit approval before writing

4. **Write the tool**
   - Skill: `.claude/skills/<name>/SKILL.md`
   - Agent: `.claude/agents/<name>.md`
   - Hook script: `.claude/hooks/<name>.sh`
   - Hook config: add entry to `.claude/settings.json`

5. **Update references**
   - If it's a new core skill, add to the core list in
     `conventions/tooling/overview.md`
   - If it's a new agent, note it in the overview
   - If it's a new hook, document it in
     `conventions/tooling/hooks.md`

6. **Confirm to user**
   - Summarize what was created/modified
   - Show how to invoke it (skill/agent) or when it fires (hook)

## For Modifications

When modifying an existing tool:
- Read the current file first
- Show a diff of what changes
- Preserve existing behavior unless explicitly asked to change it
- Update any convention files that reference the old behavior

## Rules
- Never create a skill that duplicates a convention file
- Never create an agent with Write access unless justified
- Keep skills focused — one procedure per skill
- Keep agents focused — one role per agent
- Follow patterns from existing tools in the project
