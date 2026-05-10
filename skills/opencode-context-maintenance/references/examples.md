# Context Maintenance Examples

## Good drift finding
```markdown
- Drift: Skill docs say patch_note is safe, but current host returns schema mismatch.
  Evidence: observed MCP error and successful workaround through read/write verification.
  Recommendation: mark patch_note disabled in obsidian-mcp and dependent skills.
```

## Bad drift finding
```markdown
- The context seems outdated; update everything.
```

## Entry points to verify
- Active skill directory.
- Mirrored config directory.
- Repository copy.
- Obsidian snapshot note.
- README/docs that users rely on.
