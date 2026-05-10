# Obsidian MCP Trigger Evals

## Should trigger
- User asks to read, search, list, open, tag, edit, write, delete, or verify an Obsidian note.
- User asks to run a workflow skill that depends on vault evidence.
- User asks to import skill content, save review results, or verify note persistence.

## Should not trigger alone
- User asks for conceptual advice without vault access.
- User asks for codebase file edits outside Obsidian.
- User asks for web research only.

## Near misses
- "Summarize what we did" should use available conversation context first; use vault only if the user asks to inspect notes.
- "What should my vault structure be?" is advice unless the user asks to inspect the vault.

## Regression checks
- Never use `obsidian_patch_note` or `obsidian_append_to_note` while the host returns schema mismatch failures.
- Never rely on `format: section` as sole verification.
- Always read back after writes.
