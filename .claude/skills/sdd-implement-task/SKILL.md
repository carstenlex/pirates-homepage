---
name: sdd-implement-task
description: Implement the next pending task for a feature, verify all acceptance criteria and quality gates, then stop and report. Use when user wants to implement the next task or a specific task of a feature.
disable-model-invocation: false # must be invokable to be used inside an agent (see sdd-implement-all-tasks)
license: Copyright (c) 2026 ti&m AG
---

Implement one task for a feature — finish it end-to-end, verify all acceptance criteria, then stop and report back.

If no feature is specified, list the directories under `.sdd/` and ask the user which feature to implement. Only list a directory if it contains a `tasks.md` file — ignore `.archive` and any empty or incomplete folders (a feature with no `tasks.md` has nothing to implement yet).

## Process

### 1. Gather context

Read the requirements from `.sdd/<feature-slug>/requirements.md`. If the file does not exist, report the missing file and stop.
Read the tasks from `.sdd/<feature-slug>/tasks.md`. If the file does not exist, report the missing file and stop.

### 2. Pick next task

If the user named a specific task (e.g., `02-api-endpoint`), implement that task. Otherwise, pick the first incomplete task in the list — the first `## Task` that has any unchecked, non-struck implementation steps (`- [ ] text`, not `- [ ] ~~text~~`).

### 3. Implement

- Touch only what the task requires.
- Follow project conventions (global instructions, existing patterns).
- Write tests where `requirements.md`'s `Automated Testing Decisions` section calls for them.
- Run the build and tests after completing each implementation step.
- If the build or tests fail, fix the failure before continuing to the next step.
- Mark each step in the task's implementation steps as you complete it in `.sdd/<feature-slug>/tasks.md` with `- [x]`.

### 4. Verify acceptance criteria

For each acceptance criterion:
- Demonstrate it passes with concrete evidence: test output, command output, or a manual check with an explicit result.
- Mark it `- [x]` only after producing that evidence. Never mark based on code inspection alone.
- If it cannot be executed in this environment (e.g. requires a browser, an unavailable external system, or manual user interaction), mark it `- [ ] ~~<criterion text>~~ *(skipped: <reason>)*`. Do not leave it as a bare `- [ ]` — that looks identical to "not yet attempted".

### 5. Run quality gates

For each quality gate:
- Run the command. Record the actual output.
- Mark it `- [x]` only after the command ran and passed.
- If the gate cannot be run in this environment, mark it `- [ ] ~~<gate text>~~ *(skipped: <reason>)*`.

### 6. Report completion

Report to the user with a summary table of every acceptance criterion and quality gate — showing its actual status:
- **Passed** — ran and verified with concrete evidence
- **Failed** — ran but did not pass
- **Skipped** — could not be verified (e.g. browser required but unavailable); state the reason explicitly

Never omit criteria or gates. Never upgrade a Skipped or Failed item to Passed. End the report with this exact line so callers can detect completion:

```
TASKS REMAINING: <N>
```

Where `<N>` is the count of `## Task` headings in `tasks.md` that still have any unchecked, non-struck implementation steps (`- [ ] text`, not `- [ ] ~~text~~`). Skipped ACs and quality gates (`- [ ] ~~text~~`) do not count as remaining work.

After printing the report, stop. Do not proceed to the next task — each invocation implements exactly one task.



