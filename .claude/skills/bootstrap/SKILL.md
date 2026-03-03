---
name: bootstrap
description: Scaffold project structure, generate initial documentation, setup environment, and make first commit (AX-001).
---

**CONFIRMATION REQUIRED**: This skill creates files and scaffolds
the project. Always stop and get explicit user confirmation
before executing, even if bypass permissions is enabled.

Project setup — always the first task (AX-001).
Run after discovery, research, analysis, and strategy are complete.

Bootstrap does NOT regenerate docs that already exist from earlier
stages (ARCHITECTURE.md, ADRs, strategy docs, etc.). It scaffolds
the project structure and consolidates existing work into it.

## Prerequisites
- Discovery findings doc exists
- Strategy doc exists (or decisions are documented)
- Architecture decisions made (ADRs written)
- User has approved strategy and design

## Steps

1. **Create project structure**
   - Directory layout per `conventions/documentation/structure.md`
   - Source code skeleton per architecture decisions
   - Test directory structure
   - Move existing docs (findings, strategy, ADRs, etc.) into
     the proper `docs/` structure

2. **Create remaining documentation**
   Only create docs that don't already exist from earlier stages:
   - README.md (user-facing overview)
   - CONTRIBUTING.md (project conventions)
   - CHANGELOG.md (initial entry)
   - docs/README.md (documentation index)
   - Populate project context from template
   - Do NOT regenerate ARCHITECTURE.md, STATE_MACHINES.md, SPEC.md,
     ADRs, or strategy docs — these already exist

3. **Create task backlog**
   - TASKS.md with sequenced work items from strategy
   - DETAIL.md for first 2-3 tasks
   - AX-001 DETAIL.md and IMPL_LOG.md for this setup

4. **Environment setup**
   - Git init (if not already)
   - Package manager init
   - Linting/formatting config
   - CI/CD config (if applicable)
   - Cloud/infra setup docs (if applicable)

5. **User handoff for manual steps**
   - List anything requiring manual action (account creation, API keys, DNS)
   - Provide exact steps, what to bring back

6. **Initialize memory**
   - Create `memory/` directory structure
   - Write initial `memory/goals.md`

7. **Create CONTEXT.md**
   - Current state after setup
   - Next steps (first development task)

8. **Present everything for approval**
   - Show full file tree
   - Summarize what was created vs what was moved/consolidated
   - Get explicit user approval

9. **First commit**
   - Stage all files
   - Commit: `AX-001: Project setup - Initial scaffold and documentation`
   - Push to dev branch

## On Failure
If any step fails, stop and surface to user. Do not skip steps.
If environment setup fails (package install, CI config), document
what failed and what the user needs to do manually.
