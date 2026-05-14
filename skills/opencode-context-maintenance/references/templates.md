# Context Maintenance Templates

## Drift Report Template

```text
## Context Drift Diagnosis
Date: YYYY-MM-DD
Trigger: [what prompted this check -- user report, observed error, routine review]
Entry points checked: [list of context source notes/configs examined]

---

### Summary
Most drifted layer: [long-term vault / current work / host reality]
Drift severity: [none / minor -- cosmetic / moderate -- misleading / severe -- blocking]
Config changes needed: [yes -- deferred / no]

---

### Long-Term Vault Context
Status: [aligned / minor drift / significant drift]
Checked: [which notes]
Findings:
- [finding]: [old claim] -> [current reality] | Evidence: [what proves it]

### Current Work Context
Status: [aligned / minor drift / significant drift]
Checked: [which notes]
Findings:
- [finding]: [old claim] -> [current reality] | Evidence: [what proves it]

### Host Reality Context
Status: [aligned / minor drift / significant drift]
Checked: [which configs/constraints]
Findings:
- [finding]: [old claim] -> [current reality] | Evidence: [what proves it]

---

### Recommended Updates
| Target | Current content | Suggested change | Priority | Reason |
|--------|----------------|------------------|----------|--------|
| [path] | [old text] | [new text] | [high/med/low] | [why] |

### Deferred Config Concerns
| Config file | Current value | Suggested value | Risk | Action needed |
|-------------|---------------|-----------------|------|---------------|
| [file] | [current] | [suggested] | [what could break] | [user must confirm] |

### No Action Needed
- [item checked that is still accurate]: [evidence of alignment]
```
## Update Recommendation Template

For each recommended update:

```text
## Update: [target note/file]
Layer: [long-term vault / current work / host reality]
Priority: [high / medium / low]
Current content: "[exact text that is wrong or stale]"
Suggested replacement: "[exact text to replace it with]"
Evidence of drift: [what proves the current content is wrong]
Risk of not updating: [what goes wrong if left as-is]
Write strategy: [obsidian_replace_in_note / obsidian_manage_frontmatter / manual]
Awaiting: [user confirmation before writing]
```

### Example update recommendation
```text
## Update: Meta/tool-constraints.md
Layer: host reality
Priority: high
Current content: "obsidian_patch_note: forbidden - schema translation bug"
Suggested replacement: "obsidian_patch_note: FORBIDDEN -- returns -32602 on all attempts"
Evidence of drift: 3 consecutive failures in session 2026-05-10; replace_in_note works
Risk of not updating: agent will keep trying patch_note and failing
Write strategy: obsidian_replace_in_note (literal replacement)
Awaiting: user confirmation
```

## Deferred Concerns Template

For config changes that must not be auto-applied:

```text
## Deferred Config Concerns
These items require user action. Do NOT auto-apply.

### Concern 1: [title]
File: [config file path]
Current state: [what it says now]
Observed issue: [what suggests it should change]
Suggested change: [what to change it to]
Risk of changing: [what could break]
Risk of not changing: [what continues to be wrong]
User action: [what the user should do -- test, apply, investigate]
```

### Example deferred concern
```text
### Concern 1: MCP server version mismatch
File: opencode.json (MCP configuration section)
Current state: obsidian-mcp-server@3.1.5
Observed issue: server responds with version header 3.1.5 but changelog shows
  3.2.0 available with potential fixes for schema translation bugs
Suggested change: upgrade to 3.2.0 and re-test forbidden APIs
Risk of changing: new version may introduce new failures; forbidden API list
  would need re-verification
Risk of not changing: known bugs remain; workarounds continue to be necessary
User action: test 3.2.0 in isolation; if patch_note works, update SKILL.md
```

## No-Drift Confirmation Template

When everything checks out:

```text
## Context Drift Check: No Drift Found
Date: YYYY-MM-DD
Entry points checked: [list]
All layers aligned: yes

### Verification Summary
- Long-term vault: [N notes checked, all accurate]
- Current work: [active project matches, decisions reflected]
- Host reality: [MCP version matches, constraints still valid]

No updates recommended. Next review suggested: [date or trigger condition].
```
