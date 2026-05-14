# Weekly Synthesis Examples

## Good Synthesis Output

### Example 1: Clear thesis with evidence
```text
Scope: 7 days / 12 notes / 4 deep-read
Theme stability: medium

Emerging thesis: My API design is converging on "fail fast, recover slow" --
  three separate implementations this week chose immediate rejection over queuing.
  Evidence: rate-limiter.md (reject at threshold), webhook-handler.md (drop after
  1 retry), batch-processor.md (abort batch on first poison message).

Contradictions: None meaningful this week.

Gaps: No note addresses what happens to rejected requests from the user perspective.

One action: Write a brief spec for "rejected request recovery flow" before
  implementing the next rate limiter.

One question: Is "fail fast, recover slow" actually what users want, or is it
  what is easiest to implement?

Follow-up note suggestions: topic-note "fail-fast-recover-slow-pattern"
```
Why this works: thesis is specific and grounded in 3 pieces of evidence. Gap is
actionable. Action and question are singular and high-value.

### Example 2: Honest uncertainty
```text
Scope: 7 days / 4 notes / 2 deep-read
Theme stability: low

Emerging thesis: Uncertain. Strongest signal is a shift toward async communication
  (2 notes mention moving from sync calls to event-driven), but 4 notes is
  insufficient to confirm a pattern.

Contradictions: None found (too few notes for meaningful tension).

Gaps: This was a low-output week. The gap is data itself.

One action: Expand capture habits next week; current inbox flow may be filtering
  too aggressively.

One question: Is the low note count a signal (nothing worth capturing) or a
  process failure (capturing but not routing to vault)?
```
Why this works: does not force a thesis from thin evidence. Acknowledges uncertainty.

### Example 3: Contradiction-driven synthesis
```text
Scope: 7 days / 9 notes / 5 deep-read
Theme stability: high

Emerging thesis: Unresolved tension between "move fast" and "build correctly."
  This week oscillated between both without a decision framework.

Contradictions:
  - sprint-retro.md: "we shipped 4 features" (celebration)
  - tech-debt-audit.md: "3 of those features have no tests" (concern)
  Real tension: speed and quality traded off without explicit acknowledgment.

Gaps: No note proposes a decision framework for when speed vs quality should win.

One action: Draft a one-page "speed vs quality decision matrix" with thresholds.

One question: What is the actual cost of the tech debt -- compounding or linear?
```
## Bad Synthesis Output

### Bad 1: Recap disguised as synthesis
```text
This week I worked on API design, had a meeting about auth, wrote notes about
caching, and started thinking about deployment.
```
Why this fails: lists activities without extracting meaning. No thesis, no evidence.

### Bad 2: Multiple actions
```text
One action:
1. Write the retry pattern doc
2. Review the auth middleware
3. Set up monitoring
4. Talk to the team about deadlines
```
Why this fails: "one action" means ONE. Four actions = no prioritization.

### Bad 3: Forced thesis from nothing
```text
Emerging thesis: This week reveals a deep commitment to software craftsmanship.
```
Why this fails: generic, unfalsifiable, no specific evidence. Could apply to any week.

### Bad 4: Old notes as primary evidence
```text
Emerging thesis: Based on my architecture decisions from March and Q1 patterns,
  the direction is clearly toward microservices.
```
Why this fails: evidence is months old. Synthesis must surface what is NEW.

## Quality Checklists

### Thesis quality
- Specific enough to be falsifiable
- Cites 2+ pieces of evidence from the time window
- Could NOT apply to a random other week
- Reveals something the user did not already consciously know

### Action/Question quality
Good action: specific, completable in one session, addresses highest-leverage gap.
Bad action: vague ("think more about X"), too large ("redesign the system").

Good question: challenges an assumption, opens new inquiry, worth returning to.
Bad question: already answered, too broad ("what is good design?").

## Weak Signal Handling

When fewer than 3 notes exist in the window:
- Report insufficient data explicitly
- Suggest expanding the time window
- Do NOT force a thesis from 1-2 notes

When notes are all on different topics:
- Report fragmentation honestly
- The "thesis" can be "no convergence detected"
- One action should address the fragmentation itself
