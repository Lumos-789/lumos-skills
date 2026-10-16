# lumos-skills

A plugin marketplace for AI coding agents. Every skill here follows a **two-phase standard**: a one-time `Init` that sets up and verifies what the skill needs (writing a ready marker when everything checks out), and a `Use` phase that is only entered after that gate - no guessing whether setup actually worked.

## Install

**Claude Code** (installs one plugin, on demand):

```
/plugin marketplace add Lumos-789/lumos-skills
claude plugin install context-base@lumos-skills
```

**Any agent, one command** (via [skills.sh](https://skills.sh)):

```
npx skills add Lumos-789/lumos-skills
```

## Plugins

| Plugin | What it does |
|---|---|
| [context-base](plugins/context-base/) | Turns a repository into a durable agent working base: one guided initialization creates the entry instruction file, workspace layout, and knowledge layer; then operating rules and weekly governance keep the context clean. For new repos, and for rebuilding a CLAUDE.md that has bloated into an unreliable mess. |

## License

MIT. Each plugin carries its own MIT license inside its package.
