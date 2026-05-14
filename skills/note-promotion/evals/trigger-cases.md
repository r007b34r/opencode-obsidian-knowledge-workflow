# Note Promotion Trigger Evals

## Should trigger (10)
- "Promote this finding to a formal note."
- "This idea is stable enough to become a reference note."
- "Create a topic note from these related captures."
- "Turn this synthesis output into a permanent note."
- "这个想法值得变成正式笔记吗？"
- "Upgrade this capture to a linkable knowledge unit."
- "Should this contradiction become its own note?"
- "Preserve this question as a question-note."
- "This method is reusable, make it a reference note."
- "Stabilize this idea into something I can link to."

## Should not trigger (10)
- "Triage my inbox." → inbox-triage
- "Find connections." → connection-review
- "Weekly synthesis." → weekly-synthesis
- "Is my vault healthy?" → vault-health-feedback
- "Context is stale." → context-maintenance
- "Sort captures." → inbox-triage
- "What patterns exist?" → connection-review
- "What did I learn?" → weekly-synthesis
- "Search my vault." → obsidian-mcp
- "List notes in folder." → obsidian-mcp

## Near misses (5)
- "Make this note better" — promotion if upgrading to formal; obsidian-mcp if just editing
- "This is worth keeping" — triage if from inbox; promotion if already triaged and stable
- "Write a clean version" — promotion if creating linkable unit; not promotion if just reformatting
- "Add this to my knowledge base" — promotion if meets criteria; triage if still raw
- "Create a note about X" — promotion if from existing material; obsidian-mcp if from scratch

## Pass criteria
- Promotion decision is explicit with score (≥3/5)
- Weak material not polished into fake clarity
- Integration targets named (≥2 links)
- Written note verified through readback

## Failure mode evals
- Good fragment that isn't yet stable → correctly recommends "wait", doesn't promote
- Material with high reuse but no connections yet → promotes but flags link gap
- User asks to promote everything → applies scoring, promotes only qualifying items
- Already-promoted note asked to promote again → recognizes duplicate, suggests update instead
