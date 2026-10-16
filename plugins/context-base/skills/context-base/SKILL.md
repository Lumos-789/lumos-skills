---
name: context-base
description: Set up a repository as a durable working base for AI coding agents - one guided initialization that creates the entry instruction file, workspace layout, and knowledge layer, followed by operating rules and periodic governance that keep agent context clean long-term. Use when starting multi-session agent work on a new repository, or when an existing CLAUDE.md or AGENTS.md has bloated into an unreliable mess that needs a disciplined rebuild.
---

# context-base

Most repositories accumulate agent context by accident: an entry file that grows every session, notes scattered across docs, no rule for where anything lives. Agents then read stale or contradictory instructions and guess. This skill initializes the repository as a **context base**: a small set of files with strict ownership that an agent can still trust months later.

It has two phases with a gate between them. Do not skip the gate.

## When to use

- Starting multi-session agent work on a repository that has no instruction system yet.
- An existing entry file (CLAUDE.md / AGENTS.md) has bloated past usefulness: it mixes rules, history, and task state, and parts contradict each other.
- Onboarding a second agent (different tool, same repository) and you want one instruction system they share.

Not for: throwaway scripts and one-off experiments with no future sessions.

## Init (one-time)

Run `init/SETUP.md`. It asks a short interview, scaffolds the entry file from `templates/agents-md.tpl`, creates the workspace layout and knowledge layer, runs `init/checks.sh`, and writes the ready marker at `.agents/skill-ready/context-base.json` inside the target repository.

Init is complete only when the marker exists - not when the steps finished.

If `init/SETUP.md`, `init/checks.sh`, or `templates/` are not available next to this SKILL.md (some marketplaces stream only this file), fetch the full package from the canonical source and continue: https://github.com/Lumos-789/lumos-skills under `plugins/context-base/skills/context-base/`.

## Use

Enter `use/OPERATE.md` for the rules of daily work, and keep its preflight habit: **before relying on the context base in a session, confirm the ready marker exists; if it is missing or stale, go back to Init** - do not improvise the layout from memory.

The full operating discipline and the periodic governance checklist are copied into the repository's own knowledge layer during Init, so the base stays self-contained even after this skill is uninstalled.
