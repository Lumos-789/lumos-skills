# Governance checklist

Run about once per week of active work, or whenever sessions start feeling slow and confused. Every action is a small edit-and-commit; no big rewrites in one pass.

## Entry file

- [ ] Within the soft cap (~150 lines)? Between soft and hard: distill at next touch. Over the hard cap (~220): split now - move bodies into topic files, leave one-line pointers.
- [ ] Every pointer resolves - the file it names exists?
- [ ] Every rule still true against current code? Delete or fix drifted ones. A wrong rule is worse than no rule.
- [ ] No task state, no history, no session notes inside it - those belong in `.agents/` scratch.

## Knowledge layer

- [ ] The index (`knowledge/README.md`) lists every note, and every note is reachable from the index.
- [ ] One-file-one-topic actually holds. Split any grab-bag file.
- [ ] Anything stale - describing code that changed or tools that were retired? Update or delete it. Docs serve current state only.
- [ ] Scratch notes that proved durable: graduate them into `knowledge/` as topic files, then remove the scratch copy.

## Workspace

- [ ] `.agents/` still excluded in `.gitignore` - nobody re-added it by accident.
- [ ] The ready marker still matches reality (entry file name, layout). Refresh its `checkedAt` when re-verified.

## Session feel (the honest signal)

- [ ] Did any agent this week misread the base - follow a stale rule, miss a pointer? Each incident names a fix: move it, split it, or delete the thing that misled.

Close each run with a short paragraph in `.agents/governance-log.md`: date, what was trimmed, split, or deleted. That log is scratch - it is never committed.
