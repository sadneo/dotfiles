---
name: resolve-pr-conflicts
description: Resolve merge conflicts in GitHub pull requests while preserving both branches' intent and verifying the result. Use when asked to resolve PR conflicts, fix merge conflicts in a PR, or make a conflicting PR mergeable; accepts a PR number, URL, or the current branch's PR.
---

# Resolve PR conflicts

Resolve conflicts in the PR branch by merging its latest base branch. Use Git and `gh`; follow repository instructions and existing conventions. Do not merge the PR into its base.

## 1. Identify and inspect

- Accept a PR URL or number. Otherwise use the current branch's PR. Ask only if the target is ambiguous.
- Use `gh pr view` to inspect the PR's URL, state, base/head repository and branch, head SHA, mergeability, commits, files, and checks. Include the repository explicitly when needed, especially for forks.
- Inspect `git status`, current branch, remotes, worktrees, and repository instructions before modifying anything.
- If an unrelated merge, rebase, cherry-pick, or revert is underway, stop and explain what must finish first. Do not abort it.
- If the PR is closed or merged, report that and stop. If conflict status is unknown, refresh it before concluding that no work is needed.

## 2. Prepare safely

- Fetch the actual PR head and base from their respective repositories. Do not assume `origin`, `main`, or identical head/base repositories. Use explicit refs and record the starting head and base SHAs.
- Use the existing PR checkout only when clean and consistent with the fetched head. Do not discard local commits or edits to synchronize it.
- If the current checkout has unrelated changes or is on another branch, use a separate worktree and a unique local branch based on the fetched PR head. Never check out a branch already in another worktree or delete existing worktrees.
- Merge the fetched base SHA into the PR head with `git merge --no-commit --no-ff <base-sha>`. This stages a clean merge without creating a commit and preserves PR history. Do not rebase or force-push unless explicitly requested.
- A nonzero merge exit is expected for conflicts; inspect Git's actual state. If it fails for another reason, address that failure before editing files.
- If the head already contains the base, report the result. Do not manufacture an empty resolution commit.

## 3. Resolve with context

- Enumerate every unmerged path with `git diff --name-only --diff-filter=U` and inspect `git ls-files -u` where useful.
- Read the common ancestor, both versions, surrounding code, and relevant commits before choosing a resolution. During this merge, ours is the PR head and theirs is the base; neither is automatically correct.
- Preserve both branches' intended behavior. Trace related callers, configuration, and documentation so the combined result is coherent beyond the conflict markers.
- Handle add/add, modify/delete, rename, and binary conflicts explicitly. For binary files or genuinely incompatible product decisions with no inferable answer, ask a focused question.
- Regenerate generated files and lockfiles using the repository's prescribed tooling when appropriate; do not hand-invent generated content or switch package managers.
- Keep edits limited to the integration. Stage only intended paths, including intentional deletions. Never use blanket “accept ours/theirs” or `git add .` to bypass review.

## 4. Verify

- Confirm `git diff --name-only --diff-filter=U` and `git ls-files -u` are empty. Check edited files for leftover conflict markers, distinguishing literal examples from actual markers.
- Run `git diff --check` and `git diff --cached --check`.
- Review the full staged diff against the starting PR head, including automatically merged files, and compare the resulting PR diff against the fetched base. Confirm neither branch's intended changes disappeared.
- Run the relevant checks defined by repository instructions and scripts. For docs-only conflicts, verify commands, paths, links, and configuration against the actual implementation; run available documentation checks.
- Report checks as passed, failed, or not run with the reason. Do not claim success based only on removed markers, or bypass failing hooks and checks.

## 5. Finish and publish when authorized

- Resolving conflicts alone authorizes local edits and staging, not committing or pushing. Commit and/or push only when the user explicitly requests those actions. Never merge or close the PR as part of this skill.
- Before a commit, inspect `git status`, staged and unstaged diffs, and `git log --oneline -10`. Match repository commit conventions and commit only the intended integration. Do not change Git configuration or skip hooks.
- If publishing is requested, re-fetch the remote PR head and base before committing/pushing. If the head advanced, do not overwrite it: incorporate the new head and repeat resolution and verification. If the base advanced, merge the new base and repeat verification.
- Push explicitly to the PR's actual head repository and branch with a normal push. If rejected because the branch moved, fetch and reconcile; never force-push. If fork permissions prevent publishing, report the blocker and retain the local result.
- After pushing, refresh the PR's mergeability and check status with `gh`. Distinguish conflict-free from checks pending, checks failed, or other merge restrictions.
- Report the PR URL, worktree/local branch, files resolved, key resolution decisions, verification results, and commit/push status. If uncommitted, state that the worktree contains an unfinished merge and give its path and next step.
- Preserve unfinished worktrees. Remove only a worktree created by this run after its work is committed and safely retained, and never force removal.
