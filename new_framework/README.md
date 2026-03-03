# Claude Code Framework

A load-on-demand CLAUDE.md framework for structured project work with Claude Code.

## What This Is

A slim CLAUDE.md (~105 lines) backed by convention files, skills, agents, and hooks. Claude loads only what's relevant to the current task instead of dumping everything into context at once.

## Quick Start

1. Copy the framework into your project root:
   ```bash
   cp -r new_framework/* your-project/
   cp -r new_framework/.claude your-project/
   ```

2. Start a Claude Code session in your project directory. The startup protocol in CLAUDE.md takes over from there.

## Structure

```
your-project/
├── CLAUDE.md                    # Slim core — identity, principles, startup, reference index
├── conventions/                 # Loaded on demand by topic
│   ├── workflows/               # Lifecycle, greenfield, onboarding
│   ├── stages/                  # Discovery, research, analysis, strategy
│   ├── development/             # Git, testing, tasks, change levels
│   ├── documentation/           # Context protocol, structure, state machines
│   ├── memory/                  # Memory system conventions
│   └── tooling/                 # Hooks, skills vs agents overview
├── .claude/
│   ├── settings.json            # Hook configurations
│   ├── hooks/                   # Hook scripts
│   │   └── track-usage.sh       # Token usage tracker (requires jq)
│   ├── skills/                  # On-demand skills (/commit, /status, etc.)
│   └── agents/                  # Subagent definitions (researcher, quality-gate, etc.)
└── memory/                      # Created at runtime, grows organically
    ├── raw/                     # Audit trail (hook-written, zero token cost)
    ├── episodic/                # Session logs
    ├── semantic/                # Project facts (created when needed)
    ├── procedural/              # Patterns & anti-patterns (created when needed)
    ├── usage/                   # Token usage per session (hook-written)
    └── goals.md                 # Project goals
```

## Prerequisites

### jq (required for token usage tracking)

The `SessionEnd` hook uses `jq` to parse session transcripts and track token usage. Without it, the usage tracker silently does nothing — everything else still works.

#### Windows

**Option A — winget (Windows 10+):**
```powershell
winget install jqlang.jq
```

**Option B — scoop:**
```powershell
scoop install jq
```

**Option C — chocolatey:**
```powershell
choco install jq
```

**Option D — manual:**
Download from https://jqlang.github.io/jq/download/, place the binary somewhere on your PATH.

After installing, restart your terminal and verify:
```bash
jq --version
```

#### macOS

```bash
brew install jq
```

#### Linux

```bash
# Debian/Ubuntu
sudo apt install jq

# Fedora
sudo dnf install jq

# Arch
sudo pacman -S jq
```

## Skills

| Skill | Description |
|-------|-------------|
| `/commit` | Guided commit with tests, docs, and approval |
| `/bootstrap` | Project setup (AX-001) — structure, docs, backlog |
| `/tech-eval` | Parallel tech evaluation with comparison matrix |
| `/status` | Project checkpoint — where am I, what's next |
| `/context-save` | Session handoff — CONTEXT.md + episodic memory |
| `/commercialize` | Market research, pricing, GTM strategy |
| `/promote` | Content plan, platform strategy, draft posts |
| `/prospect` | Outreach campaigns, prospect research, email sequences |

## Hooks

| Hook | Event | What it does |
|------|-------|-------------|
| Memory Loader | SessionStart | Loads goals + recent episodic |
| Post-Compact Re-inject | SessionStart (compact) | Re-injects working snapshot + CONTEXT.md + goals |
| Working Snapshot | PreCompact | Captures live state before compaction |
| Raw Logger | PostToolUse | Full audit trail (async, zero token cost) |
| Session End Reminder | Stop | Nudges to run /context-save |
| Token Usage Tracker | SessionEnd | Logs token counts to memory/usage/ |

## Author

GitHub: thatAverageGuy
