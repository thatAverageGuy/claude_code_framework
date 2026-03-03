# Procedural Memory

What works and what doesn't on this project. Built from
experience, not theory. Written in the moment, not batched.

────────────────────────────────────────────────────────
## LOCATION
────────────────────────────────────────────────────────
`memory/procedural/`

Starts empty. Files are created when there's something
worth remembering.

────────────────────────────────────────────────────────
## WHEN TO WRITE
────────────────────────────────────────────────────────
Write immediately when:
- A pattern proves itself (something worked well, worth repeating)
- A failure teaches something (something broke, don't repeat it)
- A workflow optimization is discovered (faster/better sequence)

Do not write speculative patterns. Only what's been proven
by experience on this project.

────────────────────────────────────────────────────────
## WHEN TO READ
────────────────────────────────────────────────────────
Before starting implementation work, scan headers in
`memory/procedural/` for relevant entries. Skim, don't
deep-read unless something looks directly applicable.

────────────────────────────────────────────────────────
## FORMAT
────────────────────────────────────────────────────────
No rigid template. Common structures:

**For patterns (things that work):**
```markdown
### [Pattern name]
- **Context**: when this applies
- **What to do**: the pattern
- **Why**: evidence or reasoning
- **Learned from**: [task/date]
```

**For anti-patterns (things that don't work):**
```markdown
### [Anti-pattern name]
- **What happened**: what was done
- **Why it failed**: root cause
- **Do instead**: the alternative
- **Learned from**: [task/date]
```

### Common files that tend to emerge

| File | Content |
|------|---------|
| `patterns.md` | Approaches that proved effective |
| `anti-patterns.md` | Failures worth remembering |
| `workflows.md` | Optimized step sequences |

────────────────────────────────────────────────────────
## RETENTION
────────────────────────────────────────────────────────
Update in-place. Remove patterns that no longer apply.
No scheduled maintenance.
