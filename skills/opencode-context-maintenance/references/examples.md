# Context Maintenance Examples

## Good Drift Findings

### Real drift: host constraint changed
```text
Layer: Host reality
Finding: obsidian-mcp SKILL.md documents obsidian_patch_note as forbidden
  but current host returns -32602 on every attempt.
Evidence: 3 failed patch_note calls in last session; replace_in_note succeeds.
Conflict: documented behavior != observed behavior.
Recommendation: update SKILL.md to mark patch_note as Forbidden.
Priority: high -- affects every write operation.
```
Why correct: identifies specific conflict between documentation and reality,
provides evidence from observed behavior, recommends targeted update.

### Real drift: project status outdated
```text
Layer: Current work
Finding: Meta/active-projects.md lists "API redesign" as current project,
  but no notes about API redesign exist in the last 6 weeks.
Evidence: obsidian_search_notes "API redesign" -> last match is 2026-03-28.
  Recent notes are all about "event-driven migration" instead.
Conflict: documented "current" != actual current work.
Recommendation: update active-projects.md to reflect event-driven migration.
Priority: medium -- misleads context but does not break operations.
```

### Real drift: methodology note contradicts practice
```text
Layer: Long-term vault
Finding: Meta/methodology.md says "triage daily" but synthesis notes show
  triage happens weekly at best. The methodology note is aspirational, not actual.
Evidence: last 4 weeks of triage activity: 1x/week average.
Conflict: documented process != actual cadence.
Recommendation: update methodology to reflect weekly cadence, or flag as aspirational.
Priority: low -- does not break anything, but misleads planning.
```
## Bad Drift Findings (False Drift)

### Old wording treated as drift (WRONG)
```text
Finding: Meta/workflow-principles.md uses the phrase "knowledge garden" but
  recent notes use "knowledge vault" instead.
Recommendation: update all instances of "garden" to "vault."
```
Why wrong: terminology preference changed but the content is still accurate.
"Garden" and "vault" refer to the same thing. No actual conflict exists.
Correct: only flag if the old term causes confusion or references something
that no longer exists.

### Style difference treated as drift (WRONG)
```text
Finding: Meta/capture-guide.md is written in bullet points but newer notes
  use prose paragraphs. The guide feels outdated.
Recommendation: rewrite in prose style.
```
Why wrong: format difference is not drift. The content may be perfectly accurate
despite being in a different style than recent writing.
Correct: check if the CONTENT is still accurate, ignore style differences.

### Aspirational content treated as drift (WRONG)
```text
Finding: Meta/goals.md says "achieve inbox zero weekly" but inbox currently
  has 15 items. This is drift.
Recommendation: remove the goal or lower the bar.
```
Why wrong: a goal that is not met is not drift. Drift requires that the documented
state claims to describe reality but does not.
Correct: only flag if the note claims "inbox is at zero" when it is not.

## Config Concern Deferral Examples

### Correct deferral
```text
Finding: opencode.json has model set to claude-sonnet-4-20250514 but user
  mentioned wanting to try opus in last session.
Action: DEFERRED -- config change requires user confirmation.
Reported as: "Deferred config concern: model preference may have changed.
  Current: claude-sonnet-4-20250514. User mentioned opus. Confirm before changing."
```
Why correct: never auto-edits config. Reports finding and defers to user.

### Correct deferral: MCP config
```text
Finding: MCP server config points to obsidian-mcp-server@3.1.5 but a 3.2.0
  release exists. Some forbidden APIs might be fixed.
Action: DEFERRED -- upgrading MCP server could break or fix things.
Reported as: "Deferred config concern: obsidian-mcp-server 3.2.0 available.
  Current forbidden APIs may be resolved. Recommend testing in isolation first."
```

### Wrong: auto-editing config (NEVER DO THIS)
```text
Finding: opencode.json timeout is 30s but operations sometimes take 45s.
Action: updated timeout to 60s in opencode.json.
```
Why wrong: config edits can break the environment. Even "obvious" fixes
can have unintended consequences.
Correct: report the finding, suggest the change, wait for user to apply.

## Entry Point Identification

### Good entry point selection
```text
Context entry points identified:
1. Meta/active-projects.md -- current work layer
2. Meta/methodology.md -- long-term vault layer
3. Meta/tool-constraints.md -- host reality layer
4. Skills/obsidian-mcp/SKILL.md -- host reality (MCP constraints)
Total notes to check: 4 (focused, not vault-wide)
```

### Bad entry point selection (WRONG)
```text
Checking all notes in vault for consistency...
obsidian_list_notes path:"/" depth:10
-> 847 notes found, reading each one...
```
Why wrong: reading the whole vault wastes tokens and finds noise.
Context sources are specific, known locations -- not scattered everywhere.
