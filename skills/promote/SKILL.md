---
name: promote
description: >
  Create a visibility and promotion strategy for a project. Covers
  open-source community building, build-in-public content, social
  media presence, and audience growth. Identifies target platforms,
  creates content calendars tied to development milestones, and
  generates platform-specific post templates. Use when you want
  to increase project visibility, grow community, or build personal
  brand through a project.
disable-model-invocation: true
context: fork
agent: general-purpose
---

# Promote — Visibility & Community Strategy

Create a promotion and content strategy grounded in the project's
actual milestones and capabilities.

## Input

$ARGUMENTS may specify:
- Focus: open-source adoption, personal brand, community building
- Platforms of interest (or "recommend platforms for me")
- Cadence constraints ("I can do max 3 posts per week")
- Specific milestone to promote
- Whether this is initial strategy or update to existing plan

If no arguments, run full strategy creation.

## Process

### Step 1: Understand the Project and Audience

Read project documentation:
- docs/dev/VISION.md → problem, users, what's interesting
- docs/dev/SPEC.md → features, what's technically notable
- docs/dev/ARCHITECTURE.md → interesting technical decisions
- docs/dev/tasks/TASKS.md → milestones and progress
- docs/dev/adr/ → decisions worth explaining
- CLAUDE.md → project type, intent
- Any existing docs/gtm/ files

Extract:
- What makes this project INTERESTING to others
- What's technically novel or challenging
- What would someone learn by following the journey
- Where the project is in its lifecycle (early, mid, shipping)

### Step 2: Audience and Platform Research

Spawn `researcher` sub-agent:

```
Research where [target audience from VISION.md] congregates online.
For each platform found, report:
- Platform name and specific subcommunity (e.g., /r/rust not just Reddit)
- Approximate audience size
- Content format that performs well there
- Posting etiquette / rules
- Examples of similar projects that gained traction there
- Best times/days to post

Also identify:
- Newsletters that cover this domain
- Podcasts that discuss related topics
- Conferences or meetups (online or in-person)
- Influential people in this space worth engaging with

Use Domain Research mode.
```

### Step 3: Map Milestones to Content

Create a milestone-content map from TASKS.md:

For each significant milestone, identify:
- **What's share-worthy**: the technical challenge, the result, the lesson
- **Best format**: thread, long-form post, demo video, diagram
- **Best platform**: where this type of content performs best
- **Hook**: why someone would care about this specific update

Not every task is share-worthy. Filter for:
- Technical challenges others face too
- Surprising results or benchmarks
- Architectural decisions with interesting tradeoffs
- Failures and lessons learned (often the most engaging)
- Visual results (demos, before/after, benchmarks)

### Step 4: Create Strategy Documents

**docs/gtm/CONTENT_PLAN.md:**

```markdown
# Content Plan: [Project Name]
Date: [date]
Status: Draft — pending user review

## Content Mission
[One sentence: what value does your content provide to the audience?
e.g., "Show the real process of building an LLM inference engine
from scratch, including the failures and surprises."]

## Target Audience

| Audience          | Platform(s)        | What They Care About    |
|-------------------|--------------------|-------------------------|
| [persona 1]       | [where they are]   | [what resonates]        |
| [persona 2]       | [where they are]   | [what resonates]        |

## Content Pillars

1. **Technical Deep-Dives**
   What: detailed explanations of how you built specific things
   Why: establishes expertise, attracts technical audience
   Cadence: [suggested]
   Best platforms: [specific]

2. **Progress Updates**
   What: milestones hit, benchmarks, demos
   Why: shows momentum, creates following
   Cadence: [suggested]
   Best platforms: [specific]

3. **Lessons Learned**
   What: things that went wrong, pivots, surprises
   Why: most engaging content type — people love real stories
   Cadence: as they happen
   Best platforms: [specific]

4. **Industry Commentary**
   What: opinions on related news/trends, grounded in your experience
   Why: positions you as a thoughtful practitioner
   Cadence: opportunistic
   Best platforms: [specific]

## Platform Strategy

### [Platform 1, e.g., Twitter/X]
- **Audience**: [who's there]
- **Format**: threads (5-8 tweets), single insights, visual demos
- **Cadence**: [N posts/week]
- **Etiquette**: [platform-specific norms]
- **Template**:
  ```
  Tweet 1 (hook): [Question or surprising result — stop the scroll]
  Tweet 2-4: [Technical substance — code snippets, diagrams, numbers]
  Tweet 5: [Result or key insight]
  Tweet 6: [CTA — link, question, follow request]
  ```
- **Accounts to engage with**: [specific handles in this space]

### [Platform 2, e.g., Reddit /r/specific]
- **Audience**: [who's there]
- **Format**: long-form post with code/diagrams
- **Cadence**: [N posts/month — Reddit is quality over quantity]
- **Etiquette**: [subreddit-specific rules, self-promo policies]
- **Template**:
  ```
  Title: [Descriptive, technical — not clickbait]
  Body structure:
  - What I built and why (2-3 sentences)
  - The interesting technical challenge (bulk of post)
  - Results/benchmarks (if applicable)
  - What I learned / what I'd do differently
  - Link to repo (at the END, not the beginning)
  ```
- **Subreddits**: [specific, with subscriber counts and relevance]

### [Platform 3, e.g., LinkedIn]
- **Audience**: [professional network, hiring managers, clients]
- **Format**: short posts (< 200 words), occasional articles
- **Cadence**: [N posts/week]
- **Template**:
  ```
  Hook: [Professional angle — industry problem or insight]
  Body: [What you did and what it means — business language]
  CTA: [What you want — connections, feedback, opportunities]
  ```

### [Additional channels]
- **Hacker News**: for major milestones only (Show HN for launches)
- **Dev.to / Hashnode**: for long-form technical blogs
- **YouTube**: for demos (if visual results exist)
- **Newsletter**: [relevant newsletters to pitch to]

## Effort Estimate
| Activity                    | Time/Week | Can Skip?          |
|-----------------------------|-----------|---------------------|
| Write technical posts       | [hours]   | No — core content   |
| Social media engagement     | [hours]   | Reduce, don't skip  |
| Community interaction       | [hours]   | Important for growth |
| **Total**                   | [hours]   |                     |

[Is this realistic for you alongside development? If not, here's
what to cut first: ...]
```

**docs/gtm/CONTENT_CALENDAR.md:**

```markdown
# Content Calendar: [Project Name]
Last updated: [date]

## Upcoming Content (tied to milestones)

| Week  | Milestone              | Content Piece              | Platform  | Status |
|-------|------------------------|----------------------------|-----------|--------|
| W1    | [from TASKS.md]        | [content angle]            | [where]   | TODO   |
| W2    | [milestone]            | [content angle]            | [where]   | TODO   |
| W3    | —                      | [lessons learned roundup]  | [where]   | TODO   |
| W4    | [milestone]            | [content angle]            | [where]   | TODO   |

## Recurring Content

| Day       | Type                   | Platform  | Notes              |
|-----------|------------------------|-----------|--------------------|
| Monday    | [e.g., weekly update]  | Twitter   |                    |
| Wednesday | [e.g., technical post] | Reddit    | Biweekly           |
| Friday    | [e.g., reflection]     | LinkedIn  |                    |

## Completed Content (archive)

| Date       | Title / Topic          | Platform  | Engagement         |
|------------|------------------------|-----------|--------------------|
| [date]     | [what was posted]      | [where]   | [likes/comments]   |
```

### Step 5: Generate Quick-Start Content

Draft 2-3 ACTUAL posts the user can use immediately:

1. **Launch/introduction post** — announce the project exists
2. **First technical deep-dive** — most interesting technical aspect
3. **"Why I'm building this"** — the personal story angle

Write these as ready-to-post drafts, adapted to the primary platform.

### Step 6: Present and Iterate

Present strategy to user. Ask:
1. "Do these platforms match where YOUR audience actually is?"
2. "Is the cadence realistic for you?"
3. "Which content pillar are you most excited about?"
4. "Any posts from the drafts you'd want to edit and publish now?"

### Step 7: Update Project Configuration

After user approves:
1. If PROJECT_INTENT is `not-set`, suggest updating to `build-in-public`
   or `community-tool` (but don't force — intent stays optional)
2. If in active development, suggest adding content tasks alongside
   dev tasks in TASKS.md (prefix: CT-XXX for content tasks)
3. Remind user: "Update CONTENT_CALENDAR.md after each post with
   engagement numbers. This helps optimize over time."

## Rules

- Content must be tied to REAL project work. Don't suggest posting
  about features that don't exist yet.
- Be specific about WHERE to post. "/r/rust" not "Reddit."
  "@_anysphere" not "relevant accounts."
- Effort estimates must be honest. If the strategy requires 10
  hours/week of content, say so. A solo developer might only have 2-3.
- Never suggest engagement bait, misleading hooks, or fake controversy.
  Technical authenticity is the brand.
- The content calendar should be SPARSE initially. 2-3 posts/week
  max until the habit is established. Better to be consistent than
  to burn out in week 2.
- Include a "minimum viable promotion" option: if the user can only
  do ONE thing, what should it be?
- Draft posts should sound like the USER, not like marketing copy.
  Read their README and VISION.md for voice cues.
