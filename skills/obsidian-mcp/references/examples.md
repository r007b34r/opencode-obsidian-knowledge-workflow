# Obsidian MCP Operation Examples

## Good: Correct Tool Selection

### Read-before-write pattern
```
1. obsidian_list_notes path:"Projects/" depth:2
   -> Found: Projects/api-design/rate-limiter.md
2. obsidian_get_note path:"Projects/api-design/rate-limiter.md" format:"document-map"
   -> Confirmed structure: frontmatter + 3 sections
3. obsidian_get_note path:"Projects/api-design/rate-limiter.md" format:"content"
   -> Read full content, identified target section
4. obsidian_replace_in_note path:"Projects/api-design/rate-limiter.md"
   search:"## Status\nIn progress" replace:"## Status\nComplete"
5. obsidian_get_note path:"Projects/api-design/rate-limiter.md" format:"content"
   -> Readback confirms change applied correctly
```
Why correct: fresh read before write, narrowest mutation, readback verification.

### Frontmatter-only change
```
1. obsidian_get_note path:"Ideas/async-patterns.md" format:"full"
   -> Read current frontmatter: tags: [idea, async]
2. obsidian_manage_frontmatter path:"Ideas/async-patterns.md"
   action:"set" key:"status" value:"promoted"
3. obsidian_get_note path:"Ideas/async-patterns.md" format:"full"
   -> Readback: frontmatter now includes status: promoted
```
Why correct: uses atomic manage tool, not whole-file overwrite.

### New note creation
```
1. obsidian_search_notes query:"fail-fast pattern"
   -> No existing note found
2. obsidian_write_note path:"Topics/fail-fast-pattern.md" overwrite:false
   content:"---\ntags: [topic, patterns]\n---\n# Fail-Fast Pattern\n..."
3. obsidian_get_note path:"Topics/fail-fast-pattern.md" format:"content"
   -> Readback confirms content matches intent
```
Why correct: searched for duplicates first, used overwrite:false, verified.

## Bad: Forbidden API Usage

### Using patch_note (FORBIDDEN)
```
obsidian_patch_note [FORBIDDEN] path:"Notes/meeting.md" patch:{operation:"add", ...}
-> ERROR: MCP error -32602: Structured content does not match output schema
```
Why wrong: patch_note has a known schema translation bug on this host.
Correct: use obsidian_replace_in_note with literal search/replace.

### Using append_to_note (FORBIDDEN)
```
obsidian_append_to_note [FORBIDDEN] path:"Inbox/captures.md" content:"New item"
-> ERROR: MCP error -32602
```
Why wrong: same discriminated-union schema bug as patch_note.
Correct: read the note, use obsidian_replace_in_note to add content at the end.
### Using overwrite:true on existing note
```
obsidian_write_note path:"Projects/active.md" overwrite:true content:"..."
-> Succeeds but destroys all existing content, links, and metadata
```
Why wrong: blunt instrument; existing content is lost without recovery.
Correct: use obsidian_replace_in_note for surgical edits on existing files.

## Good: Readback Verification

### Successful verification
```
After write -> obsidian_get_note format:"content"
Compare: expected 3 sections, found 3 sections. Tags match. Links intact.
Report: "Verified: note updated with correct frontmatter and content."
```

### Failed verification with recovery
```
After write -> obsidian_get_note format:"content"
Compare: expected "status: complete" but found "status: in progress"
Action: re-read, identify the replace target was ambiguous (multiple matches)
Fix: use more specific search string with surrounding context
Re-verify: now matches expectation
```

## Bad: Missing Verification

### Trusting write response as proof
```
obsidian_replace_in_note -> response: "success"
Agent reports: "Done, note updated."
```
Why wrong: "success" response does not prove content is correct. Silent partial
writes, encoding issues, or concurrent edits can corrupt without error.
Correct: always read back after write, compare against expectation.

### Using UI open as verification
```
obsidian_open_in_ui path:"Notes/meeting.md"
Agent reports: "Opened in Obsidian for your review."
```
Why wrong: UI visibility is not machine-readable verification.
Correct: read back with MCP, then optionally open in UI for user convenience.

## Error Recovery Examples

### Schema error recovery
```
Attempt: obsidian_patch_note -> -32602 error
Recovery: stop using patch_note entirely for this session
Switch to: obsidian_replace_in_note with literal search/replace
Document: note the failure in completion report
```

### Path not found recovery
```
Attempt: obsidian_get_note path:"Projects/old-name.md" -> note_missing
Recovery: obsidian_search_notes query:"old-name"
Found: Projects/renamed/old-name-v2.md
Action: ask user to confirm correct target before proceeding
```

### File exists conflict
```
Attempt: obsidian_write_note path:"Topics/patterns.md" overwrite:false -> file_exists
Recovery: read existing file, compare with intended content
Decision: merge via obsidian_replace_in_note or ask user about overwrite
```
