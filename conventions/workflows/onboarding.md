# Onboarding Workflow

End-to-end sequence for onboarding an existing codebase.
Code already exists. Docs may or may not exist. Docs may or
may not be accurate. Code is truth.

Onboarding is heavily user-interactive. Do not assume. Always verify.

────────────────────────────────────────────────────────
## SEQUENCE
────────────────────────────────────────────────────────

```
1. INITIAL ASSESSMENT
       │
2. CODEBASE DEEP-DIVE
       │
3. DOCUMENTATION FROM CODE
       │
4. GIT HISTORY ANALYSIS
       │
5. FINDINGS PRESENTATION & USER VERIFICATION
       │
6. STANDARDS DECISION
       │
7. INTENT EXPLORATION
       │
8. RESEARCH (if needed)
       │
9. ANALYZE & STRATEGIZE (if needed)
       │
10. PROCEED AS USER DIRECTS
```

────────────────────────────────────────────────────────
## 1. INITIAL ASSESSMENT
────────────────────────────────────────────────────────
Determine what the user already knows vs what needs inspection.

**If user has context** → Interview first, then inspect.
- What is this project?
- What's the current state?
- What works, what's broken, what's in-progress?
- Why are we here? (bug fix, new feature, takeover, audit)

**If user has no/limited context** → Inspect first, then discuss.
- Dive straight into codebase
- Form understanding independently
- Present findings for user to confirm/correct

────────────────────────────────────────────────────────
## 2. CODEBASE DEEP-DIVE
────────────────────────────────────────────────────────
Read EVERYTHING. No shortcuts.

### Existing Docs (read but don't trust)
- Read every doc file that exists
- Note what docs claim vs what we'll verify against code
- Flag docs that look stale or contradictory

### Code Inspection
Read every code file. For each, understand:
- Purpose and responsibility
- Relationships to other files
- Patterns and conventions used
- Data flow paths
- External integrations

### System Mapping
Build a complete picture:
- Entry points
- Core abstractions and their relationships
- Data flow paths (end to end)
- External integrations and dependencies
- Configuration mechanisms
- Build/deploy setup
- Test coverage state (what's tested, what isn't)
- Error handling patterns
- Authentication/authorization model (if any)

### State Machine Construction
Create diagrams from actual code behavior:
- System-level state machine (full project flow)
- Component-level state machines (per major module)
- These are built from CODE, not from docs

### Problem Identification
Note but don't fix yet:
- Code smells and anti-patterns
- Dead code
- Inconsistencies (naming, patterns, structure)
- Security concerns
- Performance concerns
- Missing error handling
- Untested critical paths

────────────────────────────────────────────────────────
## 3. DOCUMENTATION FROM CODE
────────────────────────────────────────────────────────
Write standardized documentation from actual code functionality.
Code is the source of truth, not existing docs.

Create in our standard format (see `conventions/documentation/structure.md`):
- ARCHITECTURE.md — from actual code structure
- STATE_MACHINES.md — from actual code behavior
- SPEC.md — from actual implemented functionality
- CONTRIBUTING.md — from actual conventions found in code

If existing docs exist and are accurate, incorporate them.
If they diverge from code, code wins. Flag divergences.

────────────────────────────────────────────────────────
## 4. GIT HISTORY ANALYSIS
────────────────────────────────────────────────────────
If a git repository exists:

- Walk commit history
- Identify patterns:
  - Commit style and conventions
  - Branching strategy in use
  - Release/tag patterns
  - Contributor patterns
- Identify architectural decisions from diffs
- Document notable findings
- Note any concerning patterns (force pushes, large
  uncommitted periods, abandoned branches)

────────────────────────────────────────────────────────
## 5. FINDINGS PRESENTATION
────────────────────────────────────────────────────────
Present EVERYTHING found to user. This is a checkpoint.

Structure:
- What we found (factual summary)
- System architecture (with state machine diagrams)
- Code quality assessment (honest, not diplomatic)
- What existing docs say vs what code actually does
- Git history insights
- Risks and concerns
- Questions that arose during inspection

**Wait for user to verify and correct.** Do not proceed until
user confirms findings are accurate.

────────────────────────────────────────────────────────
## 6. STANDARDS DECISION
────────────────────────────────────────────────────────
Ask user explicitly:

### Conventions
- Continue existing code standards (naming, formatting, patterns)?
- Or adopt our conventions going forward?
- Or hybrid? (existing code stays, new code follows ours)

### Commit Style
- Continue existing commit message style?
- Or adopt our task-prefixed format?

### Versioning
- Continue existing versioning scheme?
- Or adopt semver?

### Retroactive Documentation
- Create TASKS entries for past work? (optional)
- Create IMPL_LOGs for previous commits? (optional)
- Create retroactive ADRs from git history decisions? (optional)

These are all user choices. Claude can recommend but user decides.

────────────────────────────────────────────────────────
## 7. INTENT EXPLORATION
────────────────────────────────────────────────────────
Same intent exploration as greenfield, adapted for existing project:

- What's the intent for this project going forward?
- Is this a takeover, a contribution, an evolution?
- Is there a commercial angle now or planned?
- Will this need marketing, content, outreach?
- Non-profit open source contribution?
- Client handoff or long-term maintenance?

Intent is dynamic. Capture what's known, defer what's not.

────────────────────────────────────────────────────────
## 8. RESEARCH (if needed)
────────────────────────────────────────────────────────
**Protocol**: `conventions/stages/research.md`

Only if intent or direction requires it. Not all onboarding
projects need research.

────────────────────────────────────────────────────────
## 9. ANALYZE & STRATEGIZE (if needed)
────────────────────────────────────────────────────────
**Protocols**: `conventions/stages/analysis.md`,
`conventions/stages/strategy.md`

Only if the project direction requires strategic decisions.
A simple "fix these bugs" onboarding doesn't need strategy.
A "take over and evolve into SaaS" onboarding does.

Scale to what's needed.

────────────────────────────────────────────────────────
## 10. PROCEED AS USER DIRECTS
────────────────────────────────────────────────────────
After onboarding is complete:

- CONTEXT.md is created (current state, not aspirational)
- TASKS.md exists with known work items
- Documentation reflects actual code state
- Standards are agreed upon
- Intent is captured (even if vague)

Then work proceeds in PLAN → EXECUTE → REVIEW cycles,
same as greenfield step 9.

**Protocol files**:
- Planning: `conventions/development/task_conventions.md`
- Execution: `conventions/development/git_workflow.md`,
  `conventions/development/testing.md`,
  `conventions/development/change_levels.md`

────────────────────────────────────────────────────────
## RE-SYNC PROTOCOL
────────────────────────────────────────────────────────
When returning to an onboarded project after context loss:

1. Read CONTEXT.md
2. Read TASKS.md
3. Read active task's DETAIL.md and IMPL_LOG.md
4. Read ARCHITECTURE.md
5. Verify docs match actual code
6. If discrepancies:
   - List them
   - Present to user
   - Get approval to fix
   - Update docs to match reality
7. Resume from corrected state
