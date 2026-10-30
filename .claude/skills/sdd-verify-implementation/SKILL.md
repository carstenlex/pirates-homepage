---
name: sdd-verify-implementation
description: Verify that the codebase implementation matches the requirements and tasks for an SDD feature. Use when the user wants to audit a feature, check if all acceptance criteria are met, validate implementation completeness, or run a post-implementation quality check.
disable-model-invocation: true
license: MIT License, Copyright (c) 2026 ti&m AG 
---

Audit the codebase against the feature's `requirements.md` and `tasks.md`. Produce a full verification report — do not modify any source files or task files.

## Process

### 1. Resolve the feature slug

If the user specified a feature slug, use it. Otherwise list the directories under `.sdd/` and ask which feature to verify. Only list a directory if it contains a `tasks.md` file — ignore `.archive` and any empty or incomplete folders (a feature with no `tasks.md` has nothing to verify yet).

### 2. Read the spec

Read `.sdd/<feature-slug>/requirements.md`. If it does not exist, report the missing file and stop.
Read `.sdd/<feature-slug>/tasks.md`. If it does not exist, report the missing file and stop.

These are the source of truth for what was intended.

### 3. Discover what was actually built

Explore the codebase to understand the current implementation state. For each task, identify the relevant source files from the task description and the Technical Annex in requirements.md.

### 4. Verify each task

For every `## Task` in tasks.md, in order:

**a) Run quality gates**

Execute each quality gate listed in the task's Quality gates section: run the command the gate names; if a gate names no command, determine the appropriate check and run it. Record the actual exit code and relevant output.

**b) Verify acceptance criteria**

For each acceptance criterion, gather concrete evidence:
- Run automated tests that cover it.
- Execute a build or lint check if the criterion is a static property.
- Perform a runtime observation if the criterion is behavioral (describe the observation explicitly).
- If a criterion requires a browser and you cannot open one, record it as **Skipped** with the reason.

Do not infer passing from code inspection alone — every **Passed** verdict requires runnable evidence (test output, command output, or an explicit observation).

**c) Check task completion markers**

Interpret the checkbox state in tasks.md as follows:

| Marker | Meaning |
|---|---|
| `- [ ] text` | Pending — not yet attempted |
| `- [x] text` | Passed — executed and verified |
| `- [ ] ~~text~~ *(skipped: reason)*` | Skipped — decided not executable in this environment |

Flag discrepancies between the marker state and your observed evidence (e.g., marked `[x]` but now failing; passing but still marked `[ ]`). Treat `- [ ] ~~text~~` as **Skipped** with the inline reason as the stated rationale — attempt to re-verify it anyway if the environment now permits it.

### 5. Verify requirements coverage

After all tasks are verified, check the high-level requirements:

**a) User stories** — for each user story in requirements.md, determine whether the implementation satisfies it based on the verified task evidence.

**b) Definition of Done** — check each item in the Definition of Done section against the codebase.

**c) Out of scope** — scan the changes made for this feature for accidental implementation of items listed as Out of Scope. Items that pre-existed the feature or belong to other work do not count. If any are found, report them as warnings in the report — they do not on their own change the `VERIFICATION` verdict.

### 6. Produce the verification report

Output the full report. Never omit any task, criterion, or gate.

#### Per-task tables

For each task, output:

```
## Task <NN-task-slug>

| # | Acceptance Criterion | Status | Evidence |
|---|---|---|---|
| 1 | <criterion text> | Passed / Failed / Skipped | <one-line evidence or reason> |
...

| # | Quality Gate | Status | Evidence |
|---|---|---|---|
| 1 | <gate text> | Passed / Failed / Skipped | <one-line evidence or reason> |
...
```

#### Requirements coverage table

```
## Requirements Coverage

| User Story | Status | Notes |
|---|---|---|
| <story text> | Covered / Partial / Not covered | <note> |
...

## Definition of Done

| Item | Status | Notes |
|---|---|---|
| <item> | Met / Not met / N/A | <note> |
...
```

#### Summary

End with this block:

```
## Summary

Tasks verified:      <N>
Criteria passed:     <N>
Criteria failed:     <N>
Criteria skipped:    <N>
Gates passed:        <N>
Gates failed:        <N>
Gates skipped:       <N>
User stories covered: <N>/<total>
DoD items met:       <N>/<total>

VERIFICATION: PASSED | FAILED | PARTIAL
```

Set `VERIFICATION` to:
- **PASSED** — all criteria and gates passed, all user stories covered, all DoD items met.
- **PARTIAL** — some criteria or DoD items are Skipped (e.g. browser-only), no Failures.
- **FAILED** — one or more criteria, gates, user stories, or DoD items are Failed or Not covered.

## Constraints

- Read-only: do not modify source files, tasks.md, or requirements.md.
- Do not mark checkboxes in tasks.md.
- Do not implement or fix any issues found — only report them.
- If a fix is needed, describe it clearly so the user can decide whether to run `/sdd-implement-task` or fix it manually.
