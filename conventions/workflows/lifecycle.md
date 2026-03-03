# Project Lifecycle

Two distinct workflow tracks share a common set of stages.
The stages are reusable — the workflows define the sequence,
depth, and emphasis for each project type.

────────────────────────────────────────────────────────
## SHARED STAGES
────────────────────────────────────────────────────────

```
DISCOVER → RESEARCH → ANALYZE → STRATEGIZE → PLAN → EXECUTE → REVIEW
```

Each stage is defined in `conventions/stages/`.
Each stage has a fixed protocol but dynamic content.

Looping and branching can occur from any stage to any earlier
stage when new information invalidates assumptions or reveals gaps.

────────────────────────────────────────────────────────
## WORKFLOW TRACKS
────────────────────────────────────────────────────────

| Track | When | Convention File |
|-------|------|-----------------|
| Greenfield | New project, no existing code | `conventions/workflows/greenfield.md` |
| Onboarding | Existing codebase | `conventions/workflows/onboarding.md` |

The tracks define HOW stages are sequenced and WHAT emphasis
each stage gets. They are not interchangeable.

────────────────────────────────────────────────────────
## STAGE DEPTH SCALING
────────────────────────────────────────────────────────
Stage depth scales with project complexity and intent.
A learning project's discovery may be 10 minutes.
A SaaS product's may span multiple sessions.

This is not prescribed — Claude and user determine appropriate
depth together during the process.

────────────────────────────────────────────────────────
## STAGE OUTPUTS LOCATION
────────────────────────────────────────────────────────
All stage outputs live in the project's `docs/` directory:

```
docs/
├── discovery/
│   └── findings.md
├── research/
│   └── [topic]_report.md
├── analysis/
│   └── analysis.md
├── strategy/
│   ├── strategy.md
│   └── [topic]_strategy.md
├── dev/
│   ├── ARCHITECTURE.md
│   ├── SPEC.md
│   ├── STATE_MACHINES.md
│   ├── CONTRIBUTING.md
│   ├── tasks/
│   ├── adr/
│   └── session_context/
└── user/
```

────────────────────────────────────────────────────────
## TRANSITION RULES
────────────────────────────────────────────────────────
- Stages are never skipped on first pass (except RESEARCH if
  discovery provides full clarity)
- Looping back is always allowed and encouraged
- Every stage produces a documented output

### Stage Gate Protocol
When transition criteria for a stage are not fully met:
1. **STOP.** Do not proceed silently.
2. **Flag exactly what's unmet** — be specific, not vague.
3. **Wait for user decision.** User may:
   - Complete the missing criteria
   - Override and proceed anyway
   - Loop back to address it
4. **Log the decision** in the stage's output doc (e.g.,
   `docs/discovery/findings.md`, `docs/strategy/strategy.md`):
   ```
   ## Transition Override — [date]
   **Unmet**: [what was flagged]
   **Decision**: [proceed / loop back / defer]
   **Rationale**: [user's reasoning]
   ```
   This stays visible for future sessions — it's not buried
   in episodic memory or CONTEXT.md.

The user always has final say. But the decision is recorded,
not silent.
