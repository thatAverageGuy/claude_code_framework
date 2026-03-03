# State Machine Conventions

State machine diagrams are a primary thinking and documentation tool.

────────────────────────────────────────────────────────
## REQUIRED DIAGRAMS
────────────────────────────────────────────────────────
Maintained in `docs/dev/STATE_MACHINES.md`:

**1. Project-Level** — Major states and transitions for the entire system.
High-level data/control flow. Tells the full story at a glance.

**2. Component-Level** — One per major component/module.
Internal states, transitions, error paths. Detailed enough to guide
implementation.

────────────────────────────────────────────────────────
## FORMAT
────────────────────────────────────────────────────────
- ASCII art in docs and terminal output
- Keep under 60 chars wide where possible
- Label all transitions with trigger/condition
- Show error states and recovery paths

Example:
```
                ┌─────────┐
    ┌───────────│  IDLE   │
    │           └────┬────┘
    │                │ request received
    │           ┌────▼────┐
    │           │VALIDATE │
    │           └────┬────┘
    │           ok/  │  \fail
    │         ┌──▼──┐ ┌──▼───┐
    │         │PROC │ │REJECT│
    │         └──┬──┘ └──┬───┘
    │            │       │
    │       ┌────▼────┐  │
    └───────│RESPONSE │◄─┘
            └─────────┘
```

────────────────────────────────────────────────────────
## WHEN TO CREATE/UPDATE
────────────────────────────────────────────────────────
- During project onboarding (full project + all components)
- During task planning (if task involves flow/state)
- After any L3 change
- After any change that modifies control flow
