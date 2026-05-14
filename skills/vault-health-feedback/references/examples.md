# Vault Health Feedback Examples

## Good Findings: Workflow Layer

### Active workflow (healthy)
```text
Workflow layer: ACTIVE
Evidence:
- Inbox: 8 items, oldest is 5 days (fresh)
- Synthesis: last synthesis note created 4 days ago
- Triage: 3 notes triaged this week
- Promotion: 1 note promoted this week
Score: active
```
Why correct: checks multiple workflow signals, provides specific evidence.

### Stale workflow
```text
Workflow layer: STALE
Evidence:
- Inbox: 23 items, oldest is 45 days (backlog accumulating)
- Synthesis: last synthesis note is 3 weeks old
- Triage: no triage activity in 12 days
- Promotion: last promotion was 4 weeks ago
Score: stale
```
Why correct: identifies gap between capture (still happening) and processing (stopped).

### Dead workflow
```text
Workflow layer: DEAD
Evidence:
- Inbox: 0 items (nothing being captured)
- Synthesis: last synthesis note is 2 months old
- No new notes of any type in 3 weeks
Score: dead
```

## Good Findings: Cognitive Layer

### Returning value
```text
Cognitive layer: RETURNING VALUE
Evidence:
- 7/10 sampled recent notes have at least one backlink
- Theme "async patterns" recurs across 3 time windows
- 2 notes from last month were referenced in this week synthesis
Score: returning value
```

### Flat (no compounding)
```text
Cognitive layer: FLAT
Evidence:
- 2/10 sampled notes have any backlinks
- No theme recurs across time windows
- Notes created but never revisited (0 references after creation)
Score: flat
```
## Good Findings: Structural Layer

### Messy but functional
```text
Structural layer: MESSY BUT FUNCTIONAL
Evidence:
- Orphan rate: 35% (below 40% threshold)
- Tag entropy: 28 tags with <3 uses (moderate noise)
- Folder structure inconsistent but navigable
Score: messy but functional
Note: DO NOT recommend structural cleanup -- workflow is active
```
Why correct: identifies mess but correctly assesses it as non-blocking.

### Blocking workflow
```text
Structural layer: BLOCKING WORKFLOW
Evidence:
- Orphan rate: 62% (well above 40% threshold)
- 4 different "inbox" locations with no clear primary
- Tag system has 80+ tags with <2 uses each (pure noise)
- User reports "cannot find anything"
Score: blocking workflow
```

## Bad Findings

### Starting from structure (WRONG ORDER)
```text
Finding: vault has 45% orphan notes and inconsistent folder naming.
Recommendation: reorganize folders and add links to orphans.
```
Why wrong: jumped to structural layer without checking workflow first.
Correct: check workflow layer first. If active, structural mess is low priority.

### Too many recommendations
```text
Recommendations:
1. Clear inbox backlog
2. Reorganize folder structure
3. Add tags to untagged notes
4. Create topic indexes
5. Run weekly synthesis
6. Set up automated triage
7. Archive old projects
```
Why wrong: 7 recommendations = no focus. User cannot execute all of these.
Correct: maximum 3, ranked by leverage. The rest go in "not recommended now."

### Equating mess with failure
```text
Finding: vault is unhealthy because folders are inconsistent and naming varies.
```
Why wrong: structural mess is not health failure. A vault with active workflow,
returning cognitive value, and messy folders is HEALTHY.
Correct: health = cognitive return. Structure only matters if it blocks workflow.

## Correct Severity Ranking

```text
Priority order (highest to lowest leverage):
1. Dead workflow -> restart capture/triage cycle (highest impact)
2. Declining cognitive return -> investigate why notes do not compound
3. Structural blocking -> only if it prevents workflow execution
4. Stale workflow -> nudge processing cadence
5. Flat cognitive -> improve linking/synthesis habits
6. Messy structure -> cosmetic, lowest priority
```

## "Messy but Healthy" vs "Clean but Dead"

### Messy but healthy
- Inbox has 30 items (messy) but 5 were triaged this week (active)
- Folders are inconsistent but user finds things via search
- Tags are noisy but synthesis still produces insights
- Verdict: HEALTHY -- do not intervene on structure

### Clean but dead
- Inbox is empty because nothing is being captured
- Folders are perfectly organized but no new notes in 3 weeks
- Tags are consistent but no note has been modified in a month
- Verdict: ARCHIVAL -- workflow restart needed, not more organization

This distinction is critical: resist the urge to "fix" visible mess when the
invisible workflow is healthy, and do not be fooled by clean structure when
the system is actually dead.
