# Obsidian MCP Trigger Evals

## Should trigger (10)
- "Read this note from my vault."
- "Search my Obsidian vault for notes about X."
- "Write a new note to my vault."
- "Update the frontmatter on this note."
- "Add tags to these notes."
- "List all notes in the Projects folder."
- "Replace this section in the note."
- "Delete this note from my vault."
- "Verify that the note was written correctly."
- "Open this note in Obsidian."

## Should not trigger (10)
- "Triage my inbox." → inbox-triage makes the decision
- "What connections exist between these notes?" → connection-review decides
- "Synthesize what I learned this week." → weekly-synthesis decides
- "Is my vault healthy?" → vault-health-feedback decides
- "Promote this idea to a formal note." → note-promotion decides
- "My context files are outdated." → context-maintenance decides
- "What should I do with these captures?" → inbox-triage decides
- "Find patterns in recent notes." → connection-review decides
- "What's the one most important action?" → weekly-synthesis decides
- "Should I archive this note?" → inbox-triage decides

## Near misses (5)
- "Write a synthesis note" — obsidian-mcp handles the write, but weekly-synthesis decides content
- "Tag these triaged notes" — obsidian-mcp handles tags, but inbox-triage made the decision
- "Create a promoted note" — obsidian-mcp handles creation, but note-promotion decided
- "Fix the frontmatter on my context notes" — obsidian-mcp handles edit, context-maintenance diagnosed
- "Search for health signals" — obsidian-mcp handles search, vault-health-feedback interprets

## Pass criteria
- Vault operations execute safely with readback verification
- Forbidden APIs are never used regardless of request phrasing
- Workflow decisions are deferred to companion skills
- Every write is followed by read-back verification

## Failure mode evals
- User asks to "patch this note" → must refuse and use replace_in_note
- User asks to "append to note" → must refuse and use replace or write
- Three consecutive MCP errors → must stop and report, not retry indefinitely
- User asks to overwrite existing note → must refuse unless explicit confirmation
