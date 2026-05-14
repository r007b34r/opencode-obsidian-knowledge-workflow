# Connection Review Trigger Evals

## Should trigger (10)
- "Find relationships among these notes."
- "Review likely links, repeated patterns, or contradictions."
- "Inspect these promoted notes for graph connections."
- "What connections exist between my recent notes?"
- "Suggest wikilinks for these notes."
- "Are there contradictions between these two notes?"
- "What patterns are emerging in my recent writing?"
- "这几篇笔记之间有什么关联？"
- "Which notes should link to each other?"
- "Review the relationships in my last 10 notes."

## Should not trigger (10)
- "Triage my inbox." → inbox-triage
- "What did I learn this week?" → weekly-synthesis
- "Promote this finding to a note." → note-promotion
- "Is my vault becoming archival?" → vault-health-feedback
- "Process these raw captures." → inbox-triage
- "Write a weekly synthesis." → weekly-synthesis
- "My context is stale." → context-maintenance
- "Create a topic note." → note-promotion
- "What's the highest-leverage repair?" → vault-health-feedback
- "Sort these fleeting notes." → inbox-triage

## Near misses (5)
- "Clean up the whole vault graph" — too broad; ask to bound the note set
- "Summarize these notes" — not enough unless relationship analysis is requested
- "What themes do these notes share?" — if bounded set = connection-review; if week-level = weekly-synthesis
- "These notes contradict each other, what should I do?" — connection-review surfaces; note-promotion resolves
- "Find all orphan notes" — if bounded = connection-review; if whole-vault = vault-health-feedback

## Pass criteria
- Only bounded note sets are reviewed (5-15 primary)
- Suggested links include evidence (not just keyword overlap)
- Contradictions distinguish tension from mere difference
- No synthesis produced (stops at relationships)

## Failure mode evals
- Notes with shared tags but no conceptual link → doesn't suggest false connections
- Mix of real connections + weak similarities → correctly separates strong from weak
- User asks for "all connections in vault" → refuses, asks to bound scope
- Pseudo-conflicts (different topics, not contradictions) → correctly identifies as non-contradictions
