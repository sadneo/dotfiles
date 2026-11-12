---
name: logical-commits
description: Group all current Git changes into logical Conventional Commits. Use when asked for logical commits, a dry commit plan, or wet execution of that plan.
---

# Logical commits

## Mode

- `dry`: inspect changes and print only proposed commit subjects, one per line, in execution order. No headings, bullets, explanations, or Git mutations; do not stage, unstage, commit, or change files.
- `wet` (default): create every planned commit. Invoking this skill without a mode authorizes wet execution. A dry run never authorizes a later wet run by itself.
- An unknown or conflicting mode requires clarification before proceeding.

## Plan

1. Read repository instructions, `git status --short`, `git diff`, `git diff --cached`, and `git log --oneline -10`. Inspect untracked files and relevant surrounding code; do not infer their contents from filenames. Handle repositories without commits by inspecting their files instead of history.
2. Cover all staged, unstaged, and untracked changes, including work predating this session. Respect ignored files. Never include credentials, secrets, or accidental generated artifacts; report blockers rather than silently claiming everything was committed.
3. Group changes by coherent intent, not directory or file extension. Keep implementation, its tests, documentation, and required lockfile updates together. Separate unrelated fixes, features, refactors, and tooling changes. Prefer the fewest independently understandable commits; order prerequisites first.
4. Split unrelated changes within one file by hunks when practical. Never edit working files merely to arrange commits. Keep inseparable changes together rather than creating broken intermediate states.
5. Produce subjects using `<type>(<optional-scope>): <imperative summary>`. Omit parentheses when there is no scope. Use `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`, or `revert` accurately. Use concise lowercase summaries without a trailing period; target 72 characters or fewer. Follow repository scope conventions while retaining Conventional Commits syntax.
6. Mark actual breaking changes with `!` before `:` and explain the incompatible change in a `BREAKING CHANGE:` commit-body footer during wet execution.

## Execute (wet only)

1. Reinspect current changes before execution. If a prior dry plan exists and the diff is unchanged, preserve its grouping and subjects; otherwise recompute from the current diff.
2. Do not proactively run tests, lint, builds, or other repository checks. Let Git hooks run normally during commits.
3. Preserve all working-tree content. If the existing index mixes groups, record its staged diff before adjusting only the necessary index entries; never use destructive resets, checkout, clean, or stash. If safe selective staging is unavailable, stop and explain the blocker.
4. Stage explicit paths or non-interactive patches for exactly one group. Inspect `git diff --cached` before each commit to confirm that every staged change belongs to that group and contains no secrets. Never blindly stage everything.
5. Commit with the planned subject and any required body. Repeat until every eligible change is committed. Do not amend, rewrite history, push, change Git configuration, skip hooks, or create empty commits.
6. If a commit or hook fails, stop and report the failure and remaining changes. Preserve successful commits; after resolving the failure, retry with a new commit rather than amending.
7. Verify `git status --short` and report created hashes and subjects, plus any remaining changes or blockers. Never claim a clean tree unless verified.

## Dry output example

```text
refactor(db): consolidate schema sources
fix(deploy): resolve schema paths during deployment
docs(hosting): update database setup instructions
```

If there are no changes, print `No changes to commit.` In dry mode, if inspection cannot produce a valid plan, print only a concise blocker instead of invented subjects.
