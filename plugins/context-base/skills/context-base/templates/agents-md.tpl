# {{PROJECT_NAME}} - Agent Entry

> Single entry point for AI agents working in this repository. Keep this file a map, not a notebook: rules and pointers only, bodies live one level down. Budget: soft cap ~150 lines, hard cap ~220.

## Sources of truth (in order)

1. Code, current git state, and the real environment - they always beat this file when they disagree.
2. This file, then the layers it points to.
3. Old documents and memories of past sessions - re-verify before acting on them.

## Working rules for this repository

- Task modes: answer / review / diagnose are read-only; change / build / fix require a checkable done-condition defined before work starts; monitor uses native waiting.
- Read a file on disk before editing it this session. Never edit from memory.
- Fail loud: no default values or silent skips papering over missing input - state the target, the reason, and the evidence.
- Split large work along simple, orthogonal, stable lines before starting.

## Conventions

- Entry file: this file ({{ENTRY_FILE_NAME}}). Exactly one entry; never keep a second copy under another name.
- Scratch space: `.agents/` (gitignored) - drafts, specs, checklists, session notes.
- Durable notes: `knowledge/` - one file, one topic, indexed from `knowledge/README.md`.

## Pointers

- Full operating discipline: `knowledge/context-base/operating-rules.md`
- Periodic governance (run ~weekly): `knowledge/context-base/governance-checklist.md`
{{EXTRA_POINTERS}}

## House rules (from init interview)

{{HOUSE_RULES}}
