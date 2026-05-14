# Inbox Triage Trigger Evals

## Should trigger (10)
- "Triage my inbox."
- "Sort these captures into categories."
- "Process unorganized fleeting notes."
- "Route these raw notes into keep/promote/archive."
- "What should I do with my inbox items?"
- "清理一下 inbox 里的笔记。"
- "Help me decide which captures to keep."
- "I have 30 unprocessed notes, help me sort them."
- "Which of these fleeting notes are worth keeping?"
- "Process the new captures from today."

## Should not trigger (10)
- "What links should these notes have?" → connection-review
- "What did I learn this week?" → weekly-synthesis
- "Turn this idea into a proper note." → note-promotion
- "Is my vault healthy?" → vault-health-feedback
- "My context files are outdated." → context-maintenance
- "Summarize the relationships between these notes." → connection-review
- "Write a synthesis of recent activity." → weekly-synthesis
- "Create a reference note from this material." → note-promotion
- "Find contradictions in my recent notes." → connection-review
- "What's the one most important action?" → weekly-synthesis

## Near misses (5)
- "What's worth promoting from inbox?" — triage marks promote-to-note; actual promotion is note-promotion
- "Organize my vault." — too broad; ask to scope to inbox or specific folder
- "These notes feel connected, should I keep them?" — if from inbox = triage; if sorted = connection-review
- "Archive everything older than 30 days." — triage can archive but time-based bulk needs confirmation
- "What patterns do these inbox items show?" — if routing needed = triage; if analysis needed = connection-review

## Pass criteria
- Every item gets exactly one primary route
- Evidence is local and brief (not synthesis)
- No polished final note is written during triage
- Batch size respected (≤20 per run)
- Write-back only after explicit confirmation

## Failure mode evals
- Mixed batch: 5 high-value + 5 low-value + 5 ambiguous → uses needs-deep-read for ambiguous
- Empty inbox → reports empty, suggests checking path, doesn't hallucinate items
- Oversized inbox (50+ items) → processes first 20, reports remainder
- All items are fragments → doesn't promote all; defaults to keep-in-inbox for uncertain
