# Inbox Triage Decision Examples

## Good Decisions

### Example 1: Clear promote
```text
Path: Inbox/2026-05-10-api-rate-limiting-pattern.md
Decision: promote-to-note
Reason: Stable method with 3 concrete implementation steps; reusable across projects
Next action: hand off to note-promotion as reference-note
Write-back needed: no (analysis only)
```

Why this works: specific evidence (3 steps), clear reuse case, correct next-skill handoff.

### Example 2: Correct keep-in-inbox
```text
Path: Inbox/2026-05-12-half-thought-about-caching.md
Decision: keep-in-inbox
Reason: Fragment with potential but no stable claim yet; revisit after more context
Next action: none
Write-back needed: no
```

Why this works: acknowledges potential without premature promotion.

### Example 3: Appropriate deep-read
```text
Path: Inbox/2026-05-11-long-article-notes.md
Decision: needs-deep-read
Reason: Document-map shows 8 sections; title suggests method content but shallow read insufficient to judge stability
Next action: deep-read in next batch
Write-back needed: no
```

Why this works: doesn't guess when uncertain; defers to evidence.

### Example 4: Project routing
```text
Path: Inbox/2026-05-09-client-feedback-meeting.md
Decision: move-to-project
Reason: Specific to active project "ClientX redesign"; no reuse outside that context
Next action: move to Projects/ClientX/ after confirmation
Write-back needed: yes (move file)
```

### Example 5: Archive decision
```text
Path: Inbox/2026-04-15-random-link-collection.md
Decision: archive-or-ignore
Reason: 30 days old, no unique insight, links available via search
Next action: archive after confirmation
Write-back needed: yes (move to Archive/)
```

## Bad Decisions

### Bad 1: Synthesis disguised as triage
```text
Path: Inbox/2026-05-10-api-rate-limiting-pattern.md
Decision: promote-to-note
Reason: This note reveals an emerging pattern in our API design philosophy.
  The rate limiting approach connects to our earlier work on backpressure
  and suggests a unified theory of flow control that could reshape how we
  think about system boundaries...
```

Why this fails: the "reason" is a mini-synthesis. Triage reason should be ONE sentence about routing, not interpretation.

### Bad 2: Promote everything
```text
Batch result: 12 items → 10 promote, 1 keep, 1 archive
```

Why this fails: 83% promotion rate indicates no real filtering. Most inbox items are fragments. Realistic ratio: 20-30% promote, 30-40% keep, 20-30% archive/project.

### Bad 3: Full-read before deciding
```text
Phase 2: Read all 15 notes in full (format:"content")
Token usage: ~45,000 tokens for reading alone
```

Why this fails: document-map is sufficient for 80% of routing decisions. Full-read should be reserved for genuinely uncertain items (typically 2-4 per batch of 20).

### Bad 4: Writing without confirmation
```text
Decision: archive-or-ignore
Action taken: moved to Archive/ immediately
```

Why this fails: violates "analysis-only by default" constraint. Must list intended changes and wait for user confirmation.

## Decision Calibration Guide

### When to promote vs keep
- **Promote:** you could explain this to someone else and they'd find it useful
- **Keep:** you understand it but it's not yet crystallized into a transferable form

### When to deep-read vs archive
- **Deep-read:** title or structure suggests value but content is ambiguous
- **Archive:** title alone tells you it's stale/redundant (>30 days + no unique claim)

### When to move-to-project vs promote
- **Project:** useful only within a specific active deliverable
- **Promote:** useful across projects or after the project ends

### Realistic batch distributions
- Small focused inbox (5-10 items): 2-3 promote, 2-3 keep, 1-2 archive, 1-2 deep-read
- Large mixed inbox (20 items): 4-6 promote, 5-7 keep, 4-6 archive/project, 2-4 deep-read
