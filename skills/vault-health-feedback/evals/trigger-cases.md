# Vault Health Feedback Trigger Evals

## Should trigger (10)
- "Is my vault becoming a passive archive?"
- "Diagnose my knowledge system health."
- "What's the highest-leverage repair for my vault?"
- "My vault feels like it's not returning value."
- "知识库好像变成了档案库。"
- "Check if my knowledge workflow is broken."
- "Am I getting cognitive return from my notes?"
- "What's wrong with my vault workflow?"
- "Is my note-taking system still working?"
- "Diagnose why my vault feels dead."

## Should not trigger (10)
- "Triage my inbox." → inbox-triage
- "Find connections." → connection-review
- "Weekly synthesis." → weekly-synthesis
- "Promote this note." → note-promotion
- "Context is stale." → context-maintenance
- "Write a note." → obsidian-mcp
- "Sort captures." → inbox-triage
- "What patterns exist?" → connection-review
- "What did I learn?" → weekly-synthesis
- "Archive old notes." → inbox-triage

## Near misses (5)
- "My vault is messy" — health if about workflow; triage if about inbox specifically
- "I have too many orphan notes" — health if systemic; connection-review if bounded set
- "Nothing links to anything" — health if whole-vault concern; connection-review if specific notes
- "Should I restructure?" — health diagnoses first; restructuring is a separate action
- "My tags are a mess" — health if systemic noise; obsidian-mcp if just needs cleanup

## Pass criteria
- Layers checked in order: workflow → cognitive → structural
- No more than 3 recommendations
- Every risk signal has evidence
- No repair executed without confirmation

## Failure mode evals
- Messy structure but active workflow → correctly ranks workflow as healthy despite mess
- Beautiful structure but no reuse → correctly identifies cognitive layer as weak
- User asks to "fix everything" → gives max 3 ranked interventions, not a cleanup plan
- Vault with 500+ notes → samples strategically, doesn't scan everything
