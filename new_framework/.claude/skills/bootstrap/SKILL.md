---
name: bootstrap
description: Scaffold project structure, generate initial documentation, setup environment, and make first commit (AX-001).
disable-model-invocation: true
---

Project setup — always the first task (AX-001).
Run after discovery, research, analysis, and strategy are complete.

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

2. **Generate documentation**
   - README.md (user-facing overview)
   - ARCHITECTURE.md (from design decisions)
   - STATE_MACHINES.md (system + component level)
   - SPEC.md (from requirements)
   - CONTRIBUTING.md (project conventions)
   - CHANGELOG.md (initial entry)
   - docs/README.md (documentation index)
   - Populate project context from template

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
   - Write initial `memory/semantic/self.md`

7. **Create CONTEXT.md**
   - Current state after setup
   - Next steps (first development task)

8. **Present everything for approval**
   - Show full file tree
   - Summarize what was created
   - Get explicit user approval

9. **First commit**
   - Stage all files
   - Commit: `AX-001: Project setup - Initial scaffold and documentation`
   - Push to dev branch
