# Obsidian MCP Examples

## Good read-before-write
1. Search/list the target note.
2. Read the current content or document map.
3. Choose the narrowest safe mutation.
4. Write/replace/manage metadata.
5. Read back and report evidence.

## Bad operation
- Calling overwrite on a note that has not been read.
- Deleting a note without explicit confirmation.
- Treating a successful write response as proof without readback.
- Using disabled tools after a known host schema failure.

## Failure recovery
- If a tool returns schema mismatch, stop using that tool family.
- Switch to whole-note read + safe replace/write strategy only after preserving existing content.
- Record the failing tool, arguments class, error text, and workaround in the final report.
