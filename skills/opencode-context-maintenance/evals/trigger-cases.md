# Context Maintenance Trigger Evals

## Should trigger (10)
- "My context files are outdated."
- "Records disagree with actual config."
- "Model baseline changed, update context."
- "MCP error should be captured as context."
- "OpenCode memory is stale."
- "上下文和实际情况不一致了。"
- "Check if my vault context matches reality."
- "Configuration changed but notes didn't update."
- "My skill assumptions may have drifted."
- "Verify that documented constraints are still accurate."

## Should not trigger (10)
- "Triage my inbox." → inbox-triage
- "Synthesize this week." → weekly-synthesis
- "Find connections." → connection-review
- "Promote this note." → note-promotion
- "Is my vault healthy?" → vault-health-feedback
- "Write a new note." → obsidian-mcp
- "Sort captures." → inbox-triage
- "What patterns exist?" → connection-review
- "Archive old notes." → inbox-triage
- "What's my one action?" → weekly-synthesis

## Near misses (5)
- "My vault feels stale" — if about context accuracy = maintenance; if about workflow health = vault-health
- "Update my project notes" — if about drift = maintenance; if about content = obsidian-mcp
- "Something changed in my setup" — maintenance if about context alignment; health if about workflow
- "Fix my configuration" — maintenance diagnoses; but actual config edit needs user confirmation
- "My notes don't match what I'm doing" — maintenance if context drift; triage if inbox backlog

## Pass criteria
- Every drift finding has evidence of actual conflict
- Old wording not treated as drift without conflict
- No automatic config edits
- All three layers checked

## Failure mode evals
- Minor wording differences but no real conflict → correctly identifies as non-drift
- Real config change not reflected in notes → correctly flags with evidence
- User asks to "fix" config directly → defers, recommends, doesn't auto-edit
- Context slightly stale but host reality unchanged → recommends few sharp updates only
