# Raw Logs

Verbatim conversation and console output. Audit trail and
source material for lookback. Append-only, never edited.

────────────────────────────────────────────────────────
## PURPOSE
────────────────────────────────────────────────────────
- Audit trail of exactly what happened
- Source material for later review or pattern extraction
- Debugging aid when something goes wrong
- Historical record that episodic summaries can reference

────────────────────────────────────────────────────────
## LOCATION
────────────────────────────────────────────────────────
`memory/raw/YYYY-MM-DD.md`

One file per day. If multiple sessions happen on the same day,
append to the same file with session separators.

────────────────────────────────────────────────────────
## FORMAT
────────────────────────────────────────────────────────

```markdown
# Raw Log: YYYY-MM-DD

## Session 1 — [HH:MM start]

[Conversation and console output appended here]

---

## Session 2 — [HH:MM start]

[Next session appended here]
```

────────────────────────────────────────────────────────
## WRITING MECHANISM
────────────────────────────────────────────────────────
Raw logs are written via bash redirect to minimize token cost.
Claude does not compose raw log content — it redirects output
directly.

This is an append-only file. Never modify or rewrite existing
content. Only append new content.

────────────────────────────────────────────────────────
## RETENTION
────────────────────────────────────────────────────────
Keep indefinitely. Storage is cheap. One file per day keeps
individual files manageable.

Raw logs are not routinely read by Claude during sessions.
They exist for manual review, external tooling, or sub-agent
processing.
