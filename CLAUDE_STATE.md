# CLAUDE_STATE.md
# Claude-owned operational state. Updated on every state-altering event.
# Last updated: [timestamp] | Event: [what triggered this update]

────────────────────────────────────────────────────────
## Current State
────────────────────────────────────────────────────────
Phase:          [0-vision | 1-requirements | 2-tech-design | 
                 3a-scaffold | 3b-env-setup | 4-implementation |
                 5-validation | 6-deployment | onboarding]
Task:           [T-XXX | BF-XXX | none]
Workflow:       [W1 | W2 | W3 | W4 | W5 | onboarding-discovery]
Workflow Step:  [1-N]
Blocked On:     [description or none]

PROJECT_TYPE:   [personal | client | open-source]
PROJECT_INTENT: [learning | build-in-public | commercial-saas | 
                 consulting-showcase | community-tool | client-delivery | not-set]

────────────────────────────────────────────────────────
## Phase Manifest
────────────────────────────────────────────────────────
# Files required per phase. Claude loads only current phase files.
# Update if architecture or intent changes.

0-vision:         [.claude/skills/new-project/SKILL.md, .claude/memory/self.md, .claude/memory/goals.md]
1-requirements:   [.claude/skills/phase-gate/SKILL.md, .claude/agents/researcher.md, .claude/memory/self.md]
2-tech-design:    [.claude/skills/tech-eval/SKILL.md, .claude/agents/researcher.md, .claude/lifecycle/GREENFIELD.md]
3a-scaffold:      [.claude/skills/bootstrap/SKILL.md, .claude/agents/doc-generator.md]
3b-env-setup:     [.claude/skills/env-setup/SKILL.md]
4-implementation: [.claude/conventions/COMMIT.md, .claude/conventions/TESTING.md, .claude/conventions/TASKS.md, .claude/conventions/GIT.md, .claude/conventions/CHANGELOG.md, .claude/conventions/DOCS.md]
5-validation:     [.claude/agents/quality-gate.md, .claude/skills/phase-gate/SKILL.md]
6-deployment:     [.claude/skills/deploy-readiness/SKILL.md, .claude/agents/deploy-validator.md]
onboarding:       [.claude/lifecycle/ONBOARDING.md, .claude/memory/self.md, .claude/memory/projects.md]

────────────────────────────────────────────────────────
## Session
────────────────────────────────────────────────────────
Loaded:
  # List files loaded this session with ✓
  # Example:
  # - .claude/lifecycle/GREENFIELD.md ✓

Offload Candidates:
  # Files loaded in previous phase now inert
  # Example:
  # - .claude/skills/new-project/SKILL.md (phase 0, complete)

Queue:
  # Files to load when next phase starts
  # Example:
  # - .claude/skills/phase-gate/SKILL.md (load at phase 1 start)

────────────────────────────────────────────────────────
## Intent Modifiers Active
────────────────────────────────────────────────────────
# Populated after Phase 0. Drives additional tasks and skills.
# Example:
# - commercial-saas → /commercialize queued after Phase 2
# - build-in-public → /promote queued after Phase 3A

────────────────────────────────────────────────────────
## Event Log
────────────────────────────────────────────────────────
# Append-only. One line per state-altering event.
# Format: [timestamp] | [event type] | [detail]
# Event types: phase-transition | task-start | task-complete | 
#              skill-loaded | agent-spawned | offload-prompted |
#              session-start | session-end | workflow-step

# Example:
# 2026-03-03 | session-start    | W1 initiated, phase 0-vision
# 2026-03-03 | skill-loaded     | .claude/skills/new-project/SKILL.md
# 2026-03-03 | phase-transition | 0-vision → 1-requirements
# 2026-03-03 | offload-prompted | user accepted, session ended