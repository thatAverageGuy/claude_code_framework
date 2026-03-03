# CLAUDE.md — Framework Repo

You are working on the Claude Code Framework itself.
This repo IS the framework — changes here affect every project that uses it.

────────────────────────────────────────────────────────
## WHAT THIS REPO IS
────────────────────────────────────────────────────────
A load-on-demand CLAUDE.md framework for structured project work.
Components: CLAUDE.md (renamed as CLAUDE_Framework.md, but should be renamed to CLAUDE.md when using in an actual project), conventions/, .claude/skills/, .claude/agents/,
.claude/hooks/, .claude/settings.json.

Consumers copy this framework into their projects. Changes here
do NOT propagate to existing consumer projects automatically.

────────────────────────────────────────────────────────
## IDENTITY WHILE WORKING HERE
────────────────────────────────────────────────────────
You are editing framework infrastructure, not application code.
Every change has downstream impact on all projects using this framework.

- Be conservative. A bug in a convention file silently misdirects
  every project that loads it.
- Be precise. Ambiguity in a skill becomes real mistakes at runtime.
- Test mentally: "If a new project loaded this tomorrow, would it
  behave correctly?"

────────────────────────────────────────────────────────
## WORKING CONVENTIONS
────────────────────────────────────────────────────────
This repo uses lightweight conventions — no formal task system,
no IMPL_LOG.md per change. Direct commits with short messages.

**What still applies:**
- Never edit without understanding the downstream effect
- If changing a convention file, trace all skills/agents that
  reference it — check for breakage
- If changing a skill, re-read the convention file it implements
  to verify alignment
- If changing settings.json hooks, verify the hook script exists
  and handles failure gracefully

**What doesn't apply here:**
- Formal TASKS.md / DETAIL.md / IMPL_LOG.md workflow
- Change level system
- Semver tagging (until public release)

────────────────────────────────────────────────────────
## COMPONENT RELATIONSHIPS
────────────────────────────────────────────────────────
Before editing anything, understand the dependency chain:

```
CLAUDE.md (reference index)
    └── conventions/          ← describes HOW things should be done
            └── skills/       ← executes what conventions describe
            └── agents/       ← isolated workers, return to caller
            └── hooks/        ← automation, fires without token cost
                └── settings.json ← wires hooks to events
```

Changing a convention file = check every skill/agent that references it.
Changing a skill = check the convention file it implements.
Changing a hook = check settings.json wiring + the shell script.

────────────────────────────────────────────────────────
## CURRENT STATE
────────────────────────────────────────────────────────
Read README.md for current structure and component overview.
No CONTEXT.md here — repo is simple enough to orient from README.

If something is unclear about intent, check git log for context.

────────────────────────────────────────────────────────
## THINGS TO NEVER DO
────────────────────────────────────────────────────────
- Don't add content to CLAUDE.md that belongs in a convention file
- Don't create skills that duplicate what convention files already describe
- Don't make hooks synchronous unless they must block (async = free)
- Don't add empty placeholder files to memory/ or anywhere — organic growth only
- Don't commit without reading the full diff — one misplaced line in
  settings.json breaks all hooks silently

────────────────────────────────────────────────────────
## WHEN ADDING A NEW COMPONENT
────────────────────────────────────────────────────────
**New convention file:**
1. Add entry to CLAUDE.md reference index with accurate description
2. Verify no existing file already covers this topic

**New skill:**
1. Follow pattern: frontmatter → confirmation note (if destructive) → steps → on failure
2. Keep under 70 lines — convention files carry the detail
3. Add to skills table in README.md

**New agent:**
1. Read-only tools unless write access is justified — explain why in the file
2. Define output format explicitly — agents return to caller, not write to disk
   (exception: researcher writes to docs/research/, quality-gate writes to docs/dev/tasks/)
3. Add to README.md

**New hook:**
1. Write the shell script first, test it manually
2. Add silent-failure handling — hooks that error noisily break the UX
3. Wire in settings.json
4. Document in conventions/tooling/hooks.md

────────────────────────────────────────────────────────
## AUTHOR
────────────────────────────────────────────────────────
GitHub: thatAverageGuy