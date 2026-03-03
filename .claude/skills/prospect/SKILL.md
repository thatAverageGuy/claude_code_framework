---
name: prospect
description: Plan and execute targeted outreach campaigns — prospect research, email sequences, sales collateral, demo specs. For consulting and client acquisition.
argument-hint: "[target-segment-or-company]"
---

Targeted outreach grounded in prospect research.

## Process

1. **Understand the offering**
   - Read discovery findings and strategy docs
   - What specifically are we offering?
   - What problems does it solve?
   - What proof points exist? (demos, case studies, metrics)

2. **Define Ideal Client Profile**
   With user, establish:
   - Industry/vertical
   - Company size/stage
   - Key decision makers (titles, roles)
   - Pain points we address
   - Budget range
   - Disqualifying criteria

3. **Research prospects**
   Spawn researcher agent:
   - Find companies matching ICP
   - Profile each prospect (size, stack, pain points, recent activity)
   - Identify decision makers
   - Find engagement hooks (recent blog posts, job listings, announcements)

4. **Design outreach campaign**
   Spawn outreach-specialist agent:
   - Personalized email sequences (3-touch max)
   - Each email references prospect's specific situation
   - Low-friction next steps (not "buy now", more "see a demo")

5. **Create outreach plan**
   Write to `docs/strategy/outreach_plan.md`:

   ```markdown
   # Outreach Plan

   ## Ideal Client Profile
   [Defined above]

   ## Prospect Pipeline
   | Company | Contact | Hook | Status | Next Action |
   |---------|---------|------|--------|-------------|

   ## Email Sequences
   ### Sequence: [Segment Name]
   **Email 1** (Day 1): [subject] — [key message]
   **Email 2** (Day 4): [subject] — [follow-up angle]
   **Email 3** (Day 8): [subject] — [final touch, breakup style]

   ## Demo/PoC Specs (if applicable)
   ### Demo for [Prospect/Segment]
   - Scope: [what to build]
   - Effort: [time estimate]
   - Success criteria: [what proves value]

   ## Timeline
   | Week | Action | Volume | Expected |
   |------|--------|--------|----------|
   ```

6. **User approval before any outreach**
   - Present full plan
   - Get explicit approval for each prospect/sequence
   - Never send anything without user consent

## Rules
- Personalization over volume
- Never promise what doesn't exist
- 3-touch max per prospect — no spam
- Every email under 150 words
- Always include opt-out
- Demo/PoC creation requires separate user approval
