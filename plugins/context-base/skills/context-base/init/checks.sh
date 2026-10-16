#!/bin/sh
# context-base readiness checks - reports only, never modifies. Run from the target repo root.
set -u
rc=0
fail() { echo "FAIL $1"; rc=1; }
ok() { echo "OK   $1"; }

if [ -f AGENTS.md ]; then
  ok "entry file AGENTS.md"
elif [ -f CLAUDE.md ]; then
  ok "entry file CLAUDE.md"
else
  fail "no entry file (AGENTS.md / CLAUDE.md) at repo root"
fi
if [ -f AGENTS.md ] && [ -f CLAUDE.md ]; then
  fail "both AGENTS.md and CLAUDE.md exist - keep exactly one source"
fi

if [ -d .agents ]; then
  ok "workspace .agents/"
else
  fail "workspace .agents/ missing"
fi

if [ -f .gitignore ]; then
  grep -qx '.agents/' .gitignore && ok ".agents/ excluded in .gitignore" || fail ".gitignore does not exclude .agents/"
else
  fail ".gitignore missing"
fi

if [ -f knowledge/context-base/operating-rules.md ] && [ -f knowledge/context-base/governance-checklist.md ]; then
  ok "knowledge layer copies"
else
  fail "knowledge/context-base/ missing its two discipline files"
fi

if [ -f .agents/skill-ready/context-base.json ]; then
  ok "ready marker present"
else
  ok "ready marker not written yet (normal during first init)"
fi

if [ $rc -eq 0 ]; then
  echo "CHECKS-PASS"
else
  echo "CHECKS-FAIL (fix the items above, then re-run)" >&2
fi
exit $rc
