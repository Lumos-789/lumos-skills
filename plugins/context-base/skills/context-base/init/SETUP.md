# context-base - Initialization (one-time)

Goal: turn the target repository into a context base and write the ready marker. The whole flow is idempotent - safe to re-run - and never overwrites user edits without asking.

## Step 1 - Interview (ask all questions at once, then wait)

1. Who works here: solo, or a team whose members also commit?
2. Which agents will be used? Names of the tools are enough.
3. New setup, or rebuilding an existing entry file? If existing: which file, and may I read it first?
4. Any house rules that must survive (naming, commit style, deploy constraints, legal limits)?

Record the answers; they fill the template placeholders.

## Step 2 - Scaffold

1. **Entry file**: create `AGENTS.md` at the repository root from `templates/agents-md.tpl`, filling placeholders from the interview. If the user prefers `CLAUDE.md` as the physical filename, create that instead - exactly one entry file, never two copies. If rebuilding an existing one: read it fully first, salvage every still-true rule into the new file, then replace it in a single commit so git history keeps the old version.
2. **Local workspace**: create `.agents/` for scratch (drafts, specs, checklists, session notes - never committed). Add `.agents/` to `.gitignore`, creating the file if absent.
3. **Knowledge layer**: create `knowledge/` with `knowledge/README.md` as its one-line-per-note index, and `knowledge/context-base/` containing copies of `use/reference/operating-rules.md` and `use/reference/governance-checklist.md` from this package (if those package files are missing, fetch them from the canonical source named in SKILL.md). The repository stays self-contained even if this skill is later removed.

## Step 3 - Self-checks

Run `init/checks.sh` from the repository root. Every item must pass; fix and re-run until clean. The script only reports - it never modifies anything.

## Step 4 - Ready marker

Write `.agents/skill-ready/context-base.json`:

```json
{
  "skill": "context-base",
  "phase": "ready",
  "checkedAt": "ISO-8601 timestamp",
  "checks": {
    "entryFile": "AGENTS.md",
    "workspace": ".agents/",
    "knowledgeLayer": "knowledge/context-base/"
  },
  "expiresAt": null
}
```

Report what was created, and remind the user: the entry file is now the single entry point for every future session - point new agents at it.

## Re-init policy

Re-running later is expected after big restructuring. Never silently replace an entry file the user has since edited: diff first, ask, then merge.
