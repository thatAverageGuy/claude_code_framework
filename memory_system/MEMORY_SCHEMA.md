# Memory System Schema

Version: 1.0.0
Last updated: 2026-03-02

## Overview

This is a structured, portable memory system for Claude. It stores
persistent knowledge across sessions using human-readable markdown
files organized by cognitive memory type.

**Design principles:**
- Human-readable and editable (plain markdown, no binary formats)
- Git-versionable (track changes over time)
- Portable across Claude Code, claude.ai, and API
- Extensible (add new memory types without changing existing ones)
- Minimal (store what matters, prune what doesn't)

## Architecture

```
~/.claude/memory/
├── MEMORY_SCHEMA.md          ← This file (self-documenting)
├── episodic/                 ← What happened (daily session logs)
├── semantic/                 ← What is true (facts, knowledge)
├── procedural/               ← How to do things (patterns, workflows)
├── working/                  ← Active state (goals, pending decisions)
└── [custom]/                 ← Extensible (add new types as needed)
    └── TYPE_SCHEMA.md        ← Required for custom types
```

## Memory Types

### Episodic Memory — "What happened"

**Location:** `~/.claude/memory/episodic/`
**Format:** One file per day, named `YYYY-MM-DD.md`
**Purpose:** Session logs, decisions made, outcomes observed, context
for future sessions.

**When to write:** End of each significant session.
**When to read:** Start of session (recent entries), when historical
context would inform current decisions.
**Retention:** Keep last 30 days active. Archive older entries to
`episodic/archive/YYYY-MM/` monthly. Delete archives older than
6 months unless they contain landmark decisions.

**File format:**
```markdown
# [YYYY-MM-DD]

## Sessions

### Session 1: [Brief description]
- **Project**: [project name or "general"]
- **Duration**: [approximate]
- **What happened**: [2-5 bullet points of key activities]
- **Decisions made**: [list decisions with brief rationale]
- **Outcomes**: [what was achieved, what failed]
- **Surprises**: [anything unexpected — these are high-signal]
- **Open threads**: [things left unfinished, to pick up later]

### Session 2: [if multiple sessions that day]
[same format]

## Daily Reflection
[Optional: 1-2 sentences synthesizing the day. What pattern
is emerging? What should change tomorrow?]
```

**Example:**
```markdown
# 2026-03-02

## Sessions

### Session 1: MiniForge KV-cache implementation
- **Project**: MiniForge
- **Duration**: ~3 hours
- **What happened**:
  - Implemented basic KV-cache for transformer inference
  - Hit memory allocation issue with large sequence lengths
  - Switched from Vec<f32> to memory-mapped approach
- **Decisions made**:
  - Use mmap instead of heap allocation for KV-cache (ADR-007)
  - Defer multi-head attention optimization to T-015
- **Outcomes**: KV-cache working for sequences up to 2048 tokens
- **Surprises**: mmap was 3x faster than expected for sequential access
- **Open threads**: Need to benchmark against llama.cpp KV-cache

## Daily Reflection
Memory management in Rust is the recurring challenge. Worth doing
a focused study on arena allocators — might simplify several
upcoming tasks.
```

---

### Semantic Memory — "What is true"

**Location:** `~/.claude/memory/semantic/`
**Format:** Topic-based files, updated as facts change.
**Purpose:** Stable facts about the user, projects, domain knowledge,
contacts. This is the "knowledge base" layer.

**When to write:** When new facts are established or existing facts change.
**When to read:** Session start (self.md always), others as relevant.
**Retention:** Permanent, but review quarterly for stale entries.

**Files:**

#### `self.md` — Facts about the user
```markdown
# Self

## Identity
- Name: [name]
- Location: [location]
- Professional role: [role]
- GitHub: [username]
- Email: [email]

## Technical Profile
- Primary languages: [languages, ordered by proficiency]
- Domains: [ML, systems, web, etc.]
- Current focus: [what you're learning/building]
- Experience level: [years, self-assessed level]

## Work Context
- Day job: [company, role, focus areas]
- Side business: [business, what it does]
- Career goals: [short and medium term]

## Preferences
- Learning style: [how you learn best]
- Communication style: [how you prefer to interact]
- Work patterns: [when you're productive, how you structure work]
- Tool preferences: [editor, OS, etc.]

## Constraints
- Time: [how many hours/week for side projects]
- Budget: [spending limits for tools/infra]
- Non-negotiables: [things you won't compromise on]

Last updated: [date]
```

#### `projects.md` — Project index and status
```markdown
# Projects

## Active
| Project     | Type       | Intent         | Phase | Status      | Repo            |
|-------------|------------|----------------|-------|-------------|-----------------|
| [name]      | [type]     | [intent]       | [N]   | [status]    | [link]          |

## Paused
| Project     | Last Active | Reason Paused  | Resume Condition          |
|-------------|-------------|----------------|---------------------------|

## Completed
| Project     | Completed   | Outcome        | Learnings (brief)         |
|-------------|-------------|----------------|---------------------------|

## Ideas (not started)
| Idea        | Problem     | Priority       | Blocking On               |
|-------------|-------------|----------------|---------------------------|

Last updated: [date]
```

#### `people.md` — Key contacts and relationships
```markdown
# People

## Clients
| Name/Company | Contact      | Relationship   | Last Interaction | Notes |
|--------------|--------------|----------------|------------------|-------|

## Collaborators
| Name         | Expertise    | How We Connect | Notes                     |
|--------------|--------------|----------------|---------------------------|

## Network
| Name         | Context      | Useful For     | Notes                     |
|--------------|--------------|----------------|---------------------------|

Last updated: [date]
```

#### `domains.md` — Accumulated domain knowledge
```markdown
# Domain Knowledge

## [Domain 1, e.g., ML Engineering]

### Key Concepts
- [concept]: [your understanding, refined over time]

### Tools & Libraries
| Tool        | Verdict     | Notes                                    |
|-------------|-------------|------------------------------------------|
| [tool]      | [use/avoid] | [why, based on experience]               |

### Industry Patterns
- [pattern observed across projects or research]

## [Domain 2]
[same format]

Last updated: [date]
```

---

### Procedural Memory — "How to do things"

**Location:** `~/.claude/memory/procedural/`
**Format:** Topic-based files capturing learned processes.
**Purpose:** Validated approaches, anti-patterns, workflow optimizations.
Things learned from doing, not from reading.

**When to write:** After completing something non-trivial, when a
pattern is validated or invalidated.
**When to read:** When starting similar work to what's been done before.
**Retention:** Permanent, but review quarterly. Remove patterns that
haven't been referenced in 6 months.

**Files:**

#### `patterns.md` — Validated approaches
```markdown
# Patterns — Things That Work

## [Category, e.g., Project Setup]

### [Pattern Name]
- **Context**: [when this applies]
- **Pattern**: [what to do]
- **Why it works**: [reasoning or evidence]
- **Learned from**: [project/date]
- **Last validated**: [date]

## [Category, e.g., Debugging]

### [Pattern Name]
[same format]
```

**Example:**
```markdown
### Start with state machines before coding
- **Context**: Any feature involving stateful logic or multi-step flows
- **Pattern**: Draw the state machine first, get it reviewed, THEN code
- **Why it works**: Catches impossible state transitions before they
  become bugs. Saved ~4 hours on T-012 auth middleware.
- **Learned from**: MiniForge token lifecycle, 2026-02
- **Last validated**: 2026-03-01
```

#### `anti-patterns.md` — Things that failed
```markdown
# Anti-Patterns — Things That Don't Work

## [Category]

### [Anti-Pattern Name]
- **What happened**: [what you did]
- **Why it failed**: [root cause]
- **What to do instead**: [the alternative]
- **Learned from**: [project/date]
- **Cost**: [time wasted, bugs introduced, etc.]
```

**Example:**
```markdown
### Choosing framework before understanding requirements
- **What happened**: Picked FastAPI for Qatalum project because
  it's familiar. Later realized the project needed WebSocket
  streaming which FastAPI handles awkwardly.
- **Why it failed**: Requirements weren't clear, defaulted to comfort
- **What to do instead**: Complete Phase 1 (requirements) before
  Phase 2 (tech design). Use /tech-eval for non-trivial choices.
- **Learned from**: Qatalum PoC, 2026-01
- **Cost**: ~6 hours refactoring to add WebSocket support
```

#### `workflows.md` — Personal workflow optimizations
```markdown
# Workflows — Personal Optimizations

## [Workflow Name]

### When
[Trigger condition — when to use this workflow]

### Steps
1. [step]
2. [step]
3. [step]

### Why This Order
[Why this sequence works better than alternatives]

### Time Saved
[Estimated vs doing it the "default" way]

Last validated: [date]
```

---

### Working Memory — "Active state"

**Location:** `~/.claude/memory/working/`
**Format:** Small, frequently-updated files.
**Purpose:** Current goals, pending decisions, active context that
spans multiple sessions. This is the "what am I doing right now" layer.

**When to write:** When goals change, decisions are opened/closed,
or reflections are due.
**When to read:** Every session start.
**Retention:** Active until resolved. Move completed goals and
resolved decisions to appropriate long-term memory (episodic or semantic).

**Files:**

#### `goals.md` — Current active goals
```markdown
# Active Goals

## Short-term (this week / next 2 weeks)
- [ ] [goal] — [target date] — [project/context]
- [ ] [goal] — [target date]

## Medium-term (this month / this quarter)
- [ ] [goal] — [target date]
- [ ] [goal] — [target date]

## Long-term (this year)
- [ ] [goal]
- [ ] [goal]

## Recently Completed
- [x] [goal] — completed [date] — [outcome]
  → Moved to: episodic/[date].md

Last updated: [date]
```

#### `decisions-pending.md` — Open decisions awaiting resolution
```markdown
# Pending Decisions

## [Decision Title]
- **Context**: [why this decision needs to be made]
- **Options**: [list options considered]
- **Blocking**: [what's waiting on this decision]
- **Deadline**: [when this must be decided]
- **Information needed**: [what would help decide]
- **Opened**: [date]

## [Another Decision]
[same format]

## Recently Resolved
- [Decision]: chose [option] because [reason] — [date]
  → Recorded in: [ADR, episodic, or procedural reference]

Last updated: [date]
```

#### `reflections.md` — Periodic synthesis
```markdown
# Reflections

Periodic synthesis of episodic memory into higher-level insights.
Write weekly or biweekly.

## [YYYY-MM-DD] Weekly Reflection

### What went well
- [thing]

### What didn't go well
- [thing]

### Patterns emerging
- [pattern noticed across recent sessions]

### Adjustments
- [what to change based on this reflection]

### Key insight
[One sentence — the most important takeaway this period]

→ If a reflection reveals a reusable pattern, add it to
  procedural/patterns.md
→ If it reveals a persistent fact, add it to the appropriate
  semantic/ file
```

---

## Extensibility

To add a new memory type:

1. Create a new directory: `~/.claude/memory/[type-name]/`
2. Create `~/.claude/memory/[type-name]/TYPE_SCHEMA.md` with:
   - Purpose: what this memory type captures
   - File format: how files are structured
   - When to write: triggers for creating/updating entries
   - When to read: when to load this memory
   - Retention: how long to keep entries
   - Example: at least one concrete example
3. The memory system will discover it automatically.

**Example future types:**
- `relational/` — relationship dynamics, communication preferences
  per person, interaction history
- `temporal/` — time-series observations, trend tracking, seasonal
  patterns (could evolve into a temporal graph)
- `spatial/` — location-based memories, environment-specific context
- `meta-cognitive/` — observations about your own thinking patterns,
  biases, decision quality over time

---

## Portability Guide

### Claude Code
The primary environment. Memory files are read/written directly.

**Loading:** At session start, read:
1. `working/goals.md` (always)
2. `working/decisions-pending.md` (always)
3. `semantic/self.md` (always)
4. `semantic/projects.md` (always)
5. `episodic/[today].md` and `episodic/[yesterday].md` (recent context)
6. Other files as relevant to the current task

**Saving:** At session end:
1. Update or create `episodic/[today].md`
2. Update `working/goals.md` if goals changed
3. Update `working/decisions-pending.md` if decisions opened/closed
4. Update `semantic/` files if facts changed
5. Update `procedural/` files if patterns were learned

A future `/memory-sync` skill can automate this load/save cycle.

### claude.ai (Projects)
Copy relevant memory files into a Claude Project's knowledge base:
- `semantic/self.md` — always include
- `semantic/projects.md` — if discussing projects
- `working/goals.md` — if planning
- `procedural/patterns.md` — if doing technical work

Update the source files manually after significant sessions.

### Claude API
Inject relevant memory sections into the system prompt:

```python
def build_system_prompt(task_context):
    prompt = BASE_SYSTEM_PROMPT

    # Always include
    prompt += read_file("~/.claude/memory/semantic/self.md")

    # Include based on task
    if task_context.involves_project:
        prompt += read_file("~/.claude/memory/semantic/projects.md")
    if task_context.involves_coding:
        prompt += read_file("~/.claude/memory/procedural/patterns.md")
    if task_context.involves_planning:
        prompt += read_file("~/.claude/memory/working/goals.md")

    # Always include recent context
    prompt += read_file(f"~/.claude/memory/episodic/{today()}.md")

    return prompt
```

### Syncing Across Machines
The entire `~/.claude/memory/` directory can be synced via:
- Git (recommended — gives you version history)
- Syncthing, Dropbox, or similar
- Manual copy

```bash
# Initialize as git repo
cd ~/.claude/memory
git init
git add -A
git commit -m "Initial memory state"
git remote add origin [your-private-repo]
git push
```

**Important:** This repo should be PRIVATE. It contains personal
information about you, your clients, and your projects.

---

## Maintenance

### Weekly (5 minutes)
- Review `working/goals.md` — update progress, add/remove goals
- Write a reflection in `working/reflections.md`
- Scan episodic entries from the week for patterns worth adding
  to `procedural/`

### Monthly (15 minutes)
- Review `semantic/` files for stale information
- Archive episodic entries older than 30 days
- Review `procedural/patterns.md` — remove patterns not used
  in 3+ months
- Update `semantic/projects.md` project statuses
- Review `people.md` — update relationships, remove stale contacts

### Quarterly (30 minutes)
- Full review of all semantic files
- Synthesize quarterly themes from reflections
- Update long-term goals
- Prune procedural anti-patterns that are now obvious
- Consider whether new memory types are needed

---

## Bootstrapping

When setting up this memory system for the first time:

1. Create the directory structure:
   ```bash
   mkdir -p ~/.claude/memory/{episodic,semantic,procedural,working}
   ```

2. Copy this MEMORY_SCHEMA.md to `~/.claude/memory/`

3. Start with these files (fill in what you know):
   - `semantic/self.md` — your identity and preferences
   - `semantic/projects.md` — current project statuses
   - `working/goals.md` — what you're trying to accomplish
   - `procedural/patterns.md` — start empty, build over time
   - `procedural/anti-patterns.md` — start empty, build over time

4. Don't try to fill everything at once. The memory system grows
   organically as you use it. Start with self.md and goals.md,
   add the rest as needed.

5. Set a weekly reminder to spend 5 minutes on maintenance.
