---
name: sdd-implement-all-tasks
description: Implement all pending tasks for an SDD feature automatically, one at a time, each in an isolated context. Use when the user wants to implement an entire feature hands-free, run all remaining tasks, or automate the full implementation loop without manually invoking sdd-implement-task each time.
disable-model-invocation: true
license: MIT License, Copyright (c) 2026 ti&m AG
---

Run `sdd-implement-task` repeatedly in isolated sub-agent contexts until all tasks are complete. Each task gets a fresh context so accumulated tool output from earlier tasks never inflates the context window or interferes with later ones.

The loop stops automatically when `TASKS REMAINING: 0`, or immediately if any task reports a **Failed** acceptance criterion or quality gate — a failure means the next task might build on a broken foundation, so human review is needed before continuing.

## Process

### 1. Resolve the feature slug

If the user specified a feature slug, use it. Otherwise list the directories under `.sdd/` and ask the user which feature to run. Only list a directory if it contains a `tasks.md` file — ignore `.archive` and any empty or incomplete folders (a feature with no `tasks.md` has nothing to implement yet).

### 2. Read the task list

Read `.sdd/<feature-slug>/tasks.md` to count how many tasks exist and how many are already complete. A task is complete when all its implementation steps are either `- [x]` (done) or `- [ ] ~~text~~` (skipped). Unchecked, non-struck implementation steps (`- [ ] text`) are the only signal of remaining work — skipped ACs and quality gates (`- [ ] ~~text~~`) do not count as incomplete. Report this to the user before starting:

```
Feature: <feature-slug>
Tasks:   <completed>/<total> already done
Starting loop...
```

### 3. Loop: spawn a sub-agent per task

Repeat until done:

**a) Spawn a sub-agent** with this prompt:

```
Run /sdd-implement-task for feature <feature-slug>.
```

The sub-agent has full access to the codebase, all tools, and all installed skills. It will implement the next incomplete task, verify acceptance criteria and quality gates, update `tasks.md`, and end its response with `TASKS REMAINING: <N>`.

**b) Parse the sub-agent output**

Extract the `TASKS REMAINING: <N>` line. Also scan the summary table for any rows marked **Failed**.

If the sub-agent output does not contain a `TASKS REMAINING:` line (e.g., unexpected error or context overflow), treat the task as **Failed**, stop the loop, and report: "Sub-agent produced unexpected output — no TASKS REMAINING line found. Review the output and re-run."

**c) Report progress to the user**

After each task, print a one-line status:

```
✓ Task complete — N tasks remaining
```

Or on failure:

```
✗ Task had failures — stopping (see details below)
<paste the sub-agent's summary table>
```

**d) Decide whether to continue**

| Condition | Action |
| --- | --- |
| `TASKS REMAINING: 0` | Stop — all tasks done, go to step 4 |
| Any criterion or gate is **Failed** | Stop — report failure, ask user to fix before re-running |
| `N` did not decrease since the previous iteration | Stop — loop is stuck, report which task did not advance |
| Otherwise (`N` decreased, no failures) | Continue loop from step 3a |

### 4. Final report

When the loop ends successfully, print:

```
All tasks complete for feature: <feature-slug>

<summary table: task slug | criteria passed | gates passed>
```

Recommend the user:
1. Run `/sdd-walkthrough-implementation` to review what was built.
2. Commit the changes.
3. Run `/sdd-verify-implementation` to audit the full implementation against the spec before merging.

If the loop stopped due to failure or being stuck, clearly state what happened and what the user should do next.
