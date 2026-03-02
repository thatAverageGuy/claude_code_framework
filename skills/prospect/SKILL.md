---
name: prospect
description: >
  Plan and execute outreach campaigns for consulting lead generation,
  client discovery, and sales. Identifies prospects, crafts personalized
  email sequences, designs demo/PoC projects, and creates tracking
  systems. Use when looking for new clients, consulting opportunities,
  or partnership outreach.
disable-model-invocation: true
context: fork
agent: general-purpose
---

# Prospect — Outreach Campaign Planning

Create targeted outreach campaigns grounded in your actual capabilities
and the prospect's actual needs.

## Input

$ARGUMENTS may specify:
- Campaign type: consulting leads, product sales, partnerships
- Target profile: industry, company size, role, geography
- Specific companies or people to research
- Existing project/service to pitch (or general consulting)
- Constraints: max outreach volume, no cold calling, etc.

If no arguments, start with Ideal Client Profile definition.

## Process

### Step 1: Understand What You're Offering

Read project documentation (if project-based outreach):
- docs/dev/VISION.md → what problem you solve
- docs/dev/SPEC.md → specific capabilities
- README.md → how you currently describe it
- docs/gtm/COMMERCIAL_STRATEGY.md → positioning (if exists)

For general consulting outreach, ask the user:
1. "What services do you offer? Be specific."
2. "What's your strongest proof point? (case study, demo, metric)"
3. "What's your rate range or pricing?"
4. "What size companies are you targeting?"
5. "Any industries you specialize in?"

### Step 2: Define Ideal Client Profile (ICP)

If not provided in $ARGUMENTS, build it interactively:

```markdown
## Ideal Client Profile

### Company Characteristics
- Industry: [specific industries]
- Size: [employee range or revenue range]
- Stage: [startup / growth / enterprise]
- Geography: [if relevant]
- Tech stack signals: [technologies that indicate fit]

### Decision Maker
- Title: [specific titles — CTO, VP Engineering, etc.]
- Pain: [what keeps them up at night]
- Budget authority: [can they approve spend?]

### Qualifying Signals
- [Signal that indicates they need what you offer]
- [e.g., "Job posting for ML engineer" = they're building ML capability]
- [e.g., "Blog post about scaling challenges" = they're hitting scale problems]

### Disqualifying Signals
- [When to NOT pursue, even if they seem to fit]
- [e.g., "Already using a competitor with long contract"]
```

### Step 3: Prospect Research

Spawn `researcher` sub-agent in Prospect Research mode:

```
Find [N] companies matching this Ideal Client Profile:
[ICP from Step 2]

For each prospect, find:
1. Company name and what they do
2. Specific pain point relevant to our offering: [offering]
3. Decision maker name and title
4. Public contact (LinkedIn, company email pattern)
5. Recent news or activity (funding, hiring, launches)
6. Warm introduction paths (mutual connections, events, communities)
7. Why NOW is a good time to reach out

Prioritize prospects by:
- Strength of pain signal (High/Medium/Low)
- Accessibility of decision maker
- Potential deal size
```

### Step 4: Design Outreach Campaign

Spawn `outreach-specialist` sub-agent with prospect list and
offering context to create:

```
Design a [N]-touch email sequence for these prospects:
[Prospect list from researcher]

Our offering: [from Step 1]
Our strongest proof point: [from Step 1]
Tone: [professional but human, not salesy]

For each prospect, personalize:
- Opening reference (something specific about THEIR company)
- Pain point connection (how our offering maps to their situation)
- Proof point (relevant case study or metric)

Create:
1. Email sequence templates (3 touches)
2. Per-prospect personalization notes
3. Follow-up rules and timing
4. Tracking spreadsheet structure
```

### Step 5: Demo/PoC Planning (if applicable)

If outreach involves demonstrating capabilities:

```markdown
## Demo Strategy

### Standard Demo
- Duration: [minutes]
- Format: [live / recorded / repo]
- Shows: [specific capabilities relevant to ICP]
- Does NOT show: [what to leave out — keep it focused]
- Setup required: [what you need before the demo]

### Custom PoC Template
For prospects who need proof-of-concept work:

New directory: demos/[prospect-or-segment]/
- Estimated build time: [hours]
- Scope: [exactly what the PoC demonstrates]
- Success criteria: [what "working" looks like]
- Data needed from prospect: [what they must provide]
- Deliverable: [what they get — repo, report, presentation]
```

**Important**: Demo/PoC projects go in a demos/ directory at project
root. NEVER create a demo without user approval. Present the spec
first, build only after confirmation.

### Step 6: Assemble Outreach Plan

**docs/gtm/OUTREACH_PLAN.md:**

```markdown
# Outreach Plan: [Campaign Name]
Date: [date]
Status: Draft — pending user review

## Campaign Overview
- **Objective**: [specific goal — N meetings, N clients, N demos]
- **Target**: [ICP summary]
- **Duration**: [weeks]
- **Effort**: [hours/week]

## Prospect Pipeline

### Tier 1 — High Priority
| Company        | Contact          | Pain Point        | Angle        | Status |
|----------------|------------------|-------------------|--------------|--------|
| [company]      | [name, title]    | [specific]        | [approach]   | TODO   |

### Tier 2 — Medium Priority
| Company        | Contact          | Pain Point        | Angle        | Status |

### Tier 3 — Exploratory
| Company        | Contact          | Pain Point        | Angle        | Status |

## Email Sequences

### Sequence A: [Segment Name]
[Full email templates from outreach-specialist]

### Per-Prospect Personalization
| Company        | Email 1 Hook           | Specific Proof Point      |
|----------------|------------------------|---------------------------|
| [company]      | [personalized opener]  | [relevant case/metric]    |

## Campaign Timeline
| Week | Actions                                    | Target            |
|------|--------------------------------------------|-------------------|
| 1    | Send Email 1 to Tier 1 ([N] prospects)     | [N] opens         |
| 1    | Research Tier 2 prospects                   |                   |
| 2    | Send Email 2 follow-ups                    | [N] replies       |
| 2    | Send Email 1 to Tier 2                     |                   |
| 3    | Send Email 3 (final touch)                 | [N] meetings      |
| 3    | Conduct demos for interested prospects     |                   |

## Tracking

### Campaign Metrics
| Metric            | Target    | Actual   |
|-------------------|-----------|----------|
| Emails sent       |           |          |
| Open rate         | > 40%     |          |
| Reply rate        | > 15%     |          |
| Meetings booked   |           |          |
| Proposals sent    |           |          |
| Deals closed      |           |          |

### Per-Prospect Tracking
| Company    | E1 Sent | E1 Opened | E2 Sent | Reply | Meeting | Outcome |
|------------|---------|-----------|---------|-------|---------|---------|
| [company]  | [date]  | [y/n]     |         |       |         |         |

## Follow-Up Rules
- Reply within 24 hours to any response
- Positive reply → propose meeting within 48 hours
- "Not now" → add to nurture list, follow up in 90 days
- No response after 3 emails → stop, add to nurture
- Negative reply → thank them, remove from campaign

## Effort Estimate
- Prospect research: [hours, one-time]
- Email personalization: [hours, one-time]
- Sending and tracking: [hours/week]
- Demo prep (if needed): [hours per demo]
- Total campaign effort: [hours over duration]
```

### Step 7: Present and Iterate

Present the full outreach plan. Ask:
1. "Do these prospects match the kind of clients you want?"
2. "Does the email tone feel right for your voice?"
3. "Is the volume manageable alongside your other work?"
4. "Any prospects you already have a connection to?"
5. "Ready to start sending, or want to adjust first?"

### Step 8: Execution Support

After user approves:
1. Offer to finalize per-prospect email drafts (ready to send)
2. If demo/PoC needed, create the project spec (with user approval)
3. Set up tracking structure in docs/gtm/OUTREACH_PLAN.md
4. Remind: "Update the tracking table after each send/response.
   This data improves future campaigns."

## Rules

- NEVER fabricate prospect information. If you can't find a decision
  maker's name, say "could not identify — research needed."
- Email templates must sound human, not AI-generated. No "I hope
  this email finds you well." No "leverage." No "synergy."
- Respect opt-outs immediately. If someone says no, they're done.
- Demo projects require EXPLICIT user approval before creation.
  Present the spec, get a "yes," then build.
- Keep campaigns small and focused. 10-15 well-researched prospects
  beat 100 spray-and-pray emails.
- Include effort estimates that account for the user doing this
  alongside full-time development work.
- If the user doesn't have a clear offering or proof point yet,
  say so honestly and recommend what to build/document first
  before doing outreach.
- All outreach must be truthful. Never claim capabilities the project
  doesn't have or results that haven't been achieved.
