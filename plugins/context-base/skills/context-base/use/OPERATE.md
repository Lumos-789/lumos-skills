# context-base - Operating the base (Use phase)

## Preflight (every session that will rely on the base)

1. Does `.agents/skill-ready/context-base.json` exist? If not, this checkout was never initialized - run Init instead of improvising the layout from memory.
2. Is the entry file present and within its length budget? If it has bloated again, run governance before adding anything new to it.

## Daily rules

- The entry file is the single entry point. Keep it a map of pointers, not a notebook: a new permanent rule goes into the knowledge layer as its own topic file, linked from the entry file in one line.
- Task state, drafts, and checklists live in `.agents/` (never committed). Conclusions worth keeping graduate into `knowledge/` as one-file-one-topic notes.
- Read a file on disk before editing it in this session - especially after context compaction or when taking over from another agent. Never edit from memory.
- Length budgets are hard: the entry file stays under a soft cap of about 150 lines (hard cap 220 - split at next touch); knowledge files under 600 soft / 800 hard.
- When a rule in the base contradicts what you observe in code or environment, report the drift instead of silently following either side.

## Weekly rhythm

Run the governance checklist (`knowledge/context-base/governance-checklist.md` in the repository) about once per week of active work, or whenever sessions start feeling slow and confused. It takes minutes and is what separates a context base from a slowly rotting entry file.
