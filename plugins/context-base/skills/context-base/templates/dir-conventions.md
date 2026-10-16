# Directory conventions of the base

| Path | Committed | Purpose | Lifetime |
|---|---|---|---|
| `AGENTS.md` (or `CLAUDE.md`) | yes | Single entry: rules and pointers | permanent, kept small |
| `knowledge/` | yes | One-file-one-topic durable notes, plus the copied discipline files | long-lived, governed |
| `knowledge/README.md` | yes | Index of the knowledge layer - one line per note | permanent |
| `knowledge/context-base/` | yes | The two discipline files copied in during Init | updated with the skill |
| `.agents/` | no | Scratch: drafts, specs, checklists, session notes | short-lived |
| `.agents/skill-ready/` | no | Readiness markers (machine-local state) | refreshed on re-init |
| `.agents/governance-log.md` | no | Notes from governance runs | scratch |

Rules of movement:

- Scratch graduates into `knowledge/` when it is stable, reusable, and one topic.
- Knowledge retires when it no longer serves the current state of the code.
- Nothing duplicates the entry file's role as the single map; everything else is a destination it points to.
