---
name: context-save
description: Save session state for handoff. Updates CONTEXT.md and writes episodic memory entry.
---

Standardized session handoff. Run before ending a session or
when switching focus.

## Steps

1. **Archive previous CONTEXT.md** (if exists)
   - Copy to `docs/dev/session_context/session_YYYY-MM-DD.md`

2. **Write new CONTEXT.md**
   - Follow format from `conventions/documentation/context_protocol.md`
   - Must reflect TRUE current state, not aspirational
   - Include:
     - Current task and phase
     - What was accomplished this session
     - Current task state (what's done, what's not)
     - Next steps (specific, actionable)
     - Open questions / decisions pending
     - Blockers
     - Quick links to active task docs

3. **Write episodic memory entry**
   - Create/append to `memory/episodic/YYYY-MM-DD.md`
   - Follow format from `conventions/memory/episodic.md`
   - Include:
     - What happened (2-5 bullets)
     - Decisions made (with brief rationale)
     - Outcomes (achieved, failed)
     - Surprises (high signal)
     - Open threads

4. **Update goals if changed**
   - If goals were completed or new ones emerged
   - Update `memory/goals.md`

5. **Delete working snapshot** (if exists)
   - Remove `memory/working_snapshot.md` — it's ephemeral,
     only needed between pre-compact and post-compact

6. **Confirm to user**
   - Summarize what was saved
   - Note anything the user should review

## Note
Semantic and procedural memory are NOT updated here.
They are updated in-place during the session when relevant
(new fact established → write to semantic, pattern validated
→ write to procedural). Forcing them at session end produces
low-quality entries.
