# Operating rules (full discipline)

## 1. Sources of truth, in order

1. Live evidence: code, current git state, running services, the real environment.
2. The context base: entry file first, then the layers it points to.
3. Old documents, old sessions, and memories of past sessions - lowest trust. Re-verify against layer 1 before acting on them.

## 2. Task modes - decide before acting

| Mode | Meaning | Discipline |
|---|---|---|
| answer / review / diagnose | read-only | no edits; deliver an assessment |
| change / build / fix | edit and verify | define a checkable done-condition first; verify before reporting done |
| monitor / wait | native waiting | use the host's waiting mechanisms, never busy polling |

## 3. Verification-first (for anything that edits)

- Define done before starting: a command, a test, or an observable state.
- Reproduce before fixing. A fix for a failure nobody reproduced is a guess.
- Isolate: shrink the failure to the smallest unit that still shows it.
- Retries are clues, not solutions. "It worked on the second try" is a signal to go find the root cause, not a reason to move on.
- Never mask a failure with a default value, a fallback, or a silent skip. Fail loud: state the target, the reason, and the evidence.

## 4. Divide and conquer

Split any large task along lines that are simple (visible at a glance), orthogonal (non-overlapping), and stable (will not drift mid-task): data-flow stages, module or data ownership, page or change type. A task that crosses several regions gets split into subtasks before work starts.

## 5. Read before edit

Read the current on-disk version of a file before editing it in any session - especially after context compaction or when taking over from another agent or another machine. Never edit from memory.

## 6. File discipline

- One file, one topic. The same fact lives in exactly one place; everything else points at it.
- Entry files hold pointers and rules, not bodies. Bodies live one level down.
- Docs record why - decisions, constraints, traps, rejected options - never what the code already says.
- Length budgets: the soft cap is the healthy size; hitting the hard cap forces a split the next time the file is touched.

## 7. Git discipline (generic safe defaults)

- Commit promptly after authorized, verified changes. Do not park finished work in a dirty tree.
- No destructive commands that discard uncommitted work. Undo by new commit, not by rollback.
- Branch policy follows repository type: personal solo repositories commit on the default branch; shared repositories work on feature branches merged through review.
- Never commit secrets. Assume anything committed becomes public eventually.

## 8. Workspace hygiene

- `.agents/` is scratch space: specs, plans, checklists, session notes. Excluded from version control by design.
- A scratch note graduates into `knowledge/` only when it is stable, reusable, and shaped as one topic.
- Periodic governance (see governance-checklist.md) retires what no longer earns its place.
