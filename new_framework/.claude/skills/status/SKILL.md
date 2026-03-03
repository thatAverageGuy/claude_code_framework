---
name: status
description: Show current project status — where am I in the lifecycle, what's done, what's next, am I ready to move forward.
argument-hint: "[detailed]"
---

Project checkpoint. Shows where you are and what's next.

## Process

1. **Gather current state**
   - Read CONTEXT.md (if exists)
   - Read TASKS.md (if exists)
   - Read `memory/goals.md` (if exists)
   - Read active task's DETAIL.md (if exists)
   - Check git status and recent commits

2. **Determine lifecycle position**
   - Which stage are we in? (discover/research/analyze/strategize/plan/execute/review)
   - What triggered the current stage?
   - How long have we been here?

3. **Assess readiness**
   - Read transition criteria from relevant `conventions/stages/` file
   - Check each criterion: met / not met / partial
   - Identify blocking vs non-blocking gaps

4. **Report**

   ```
   ════════════════════════════════════════
   PROJECT STATUS
   ════════════════════════════════════════
   Stage:     [current lifecycle stage]
   Task:      [active task ID and summary]
   Branch:    [current git branch]
   ────────────────────────────────────────
   COMPLETED THIS SESSION
   - [what's been done]
   ────────────────────────────────────────
   IN PROGRESS
   - [what's actively being worked on]
   ────────────────────────────────────────
   NEXT STEPS
   1. [immediate next action]
   2. [after that]
   ────────────────────────────────────────
   TRANSITION READINESS
   [Ready / Not ready / Ready with gaps]
   - [blocking gaps if any]
   - [advisory notes if any]
   ────────────────────────────────────────
   GOALS ALIGNMENT
   - [are current actions aligned with project goals?]
   ════════════════════════════════════════
   ```

5. If `$ARGUMENTS` includes "detailed", also show:
   - Full task completion criteria status
   - Memory update status (last episodic entry date)
   - CONTEXT.md freshness
   - Open questions / pending decisions
