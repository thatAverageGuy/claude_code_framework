# Episodic Memory

Distilled session logs. What happened, what was decided, what
the outcomes were. Not verbatim — that's raw logs. This is
the curated summary.

────────────────────────────────────────────────────────
## LOCATION
────────────────────────────────────────────────────────
`memory/episodic/YYYY-MM-DD.md`

One file per day. Multiple sessions on the same day go in
the same file as separate entries.

────────────────────────────────────────────────────────
## WHEN TO WRITE
────────────────────────────────────────────────────────
End of each significant session. A session is "significant"
if it produced decisions, outcomes, or learnings worth
remembering. Quick Q&A sessions don't need episodic entries.

────────────────────────────────────────────────────────
## WHEN TO READ
────────────────────────────────────────────────────────
- Session start: read most recent 1-2 entries for continuity
- When historical context would inform current decisions
- During review phases of the lifecycle

────────────────────────────────────────────────────────
## FORMAT
────────────────────────────────────────────────────────

```markdown
# YYYY-MM-DD

## Session 1: [Brief description]
- **Project**: [project name]
- **What happened**:
  - [2-5 bullet points of key activities]
- **Decisions made**:
  - [decision]: [brief rationale]
- **Outcomes**: [what was achieved, what failed]
- **Surprises**: [anything unexpected — high signal]
- **Open threads**: [things left unfinished]

## Session 2: [if multiple sessions]
[same format]

## Daily Reflection
[Optional: 1-2 sentences. What pattern is emerging?]
```

────────────────────────────────────────────────────────
## EXAMPLE
────────────────────────────────────────────────────────

```markdown
# 2026-03-02

## Session 1: Auth middleware implementation
- **Project**: Acme API
- **What happened**:
  - Implemented JWT validation middleware (T-012)
  - Hit issue with refresh token rotation under concurrency
  - Switched to database-level locking for token invalidation
- **Decisions made**:
  - Use RS256 over HS256 (see ADR-005)
  - Defer rate limiting to T-013
- **Outcomes**: Core middleware working, unit tests passing
- **Surprises**: RS256 verification was 4x slower than expected,
  may need caching layer
- **Open threads**: Integration tests not started, performance
  concern flagged

## Daily Reflection
Concurrency issues keep coming up. Should add concurrent access
testing as a standard checklist item for any shared-state work.
```

────────────────────────────────────────────────────────
## RETENTION
────────────────────────────────────────────────────────
Accumulates over time. Clean up manually when it bothers you.
No automated archival or scheduled maintenance.

────────────────────────────────────────────────────────
## RELATIONSHIP TO OTHER MEMORY TYPES
────────────────────────────────────────────────────────
Semantic and procedural memory are written during the session,
not distilled from episodic entries after the fact.
Episodic is a record of what happened — not a staging area.

────────────────────────────────────────────────────────
## EPISODIC vs CONTEXT.md
────────────────────────────────────────────────────────
Both capture "what happened" but serve different purposes:

- **CONTEXT.md** = resumption state. "Where am I right now, what
  do I do next." Overwritten each session. Read by the next session
  to pick up where it left off.
- **Episodic** = historical record. "What happened on this date."
  Append-only. Read for pattern recognition, historical context,
  or understanding past decisions.

If CONTEXT.md is a bookmark, episodic is the journal.
