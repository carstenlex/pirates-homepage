---
name: sdd-write-tasks
description: Break a requirements spec into independently-grabbable tasks using tracer-bullet vertical slices. Use when user wants to convert a requirements spec, PRD, or plan into tasks (also called issues or work items).
license: MIT License, Copyright (c) 2026 ti&m AG, Copyright (c) 2026 Matt Pocock 
---

Break a requirements spec into independently-grabbable tasks using vertical slices (tracer bullets). Tasks are numbered from `01`, with id `<NN>-<task-slug>`.

## Process

### 1. Resolve the feature slug

If the user specified a feature slug, use it. Otherwise list the directories under `.sdd/` and ask the user which feature to use. Only list a directory if it actually contains a `requirements.md` file — ignore `.archive` and any empty or incomplete folders (e.g. a leftover directory whose `requirements.md` was deleted), since this skill cannot act on them.

### 2. Gather context

Read the requirements from `.sdd/<feature-slug>/requirements.md`. If the file does not exist, report the missing file and stop — do not generate tasks without a requirements spec.

### 3. Explore the codebase

Explore the codebase to understand the current state of the code. This step is required — even if you have recently explored it, the codebase may have changed since the requirements were written.

### 4. Verify the Technical Annex

**Skip check.** If the Technical Annex header records a commit (e.g. `Written against codebase as of: … (commit abc1234)`), compare it to the current `git rev-parse --short HEAD`. If they match, the codebase has not moved since the annex was written (the common case when tasks are generated in the same session as the requirements) — print `Annex written against current HEAD abc1234 — skipping re-verification.` and go straight to step 5. Only skip on an exact match; if the header records no commit (older requirements files, or specs imported from Jira), the hashes differ, or this is not a git repository, perform the full verification below.

If the requirements contain a Technical Annex, compare each decision in it against the current codebase:

- Check that named classes, modules, methods, and files still exist and match the described interfaces.
- Identify any decisions that conflict with or no longer apply to the current state of the codebase.

If conflicts are found, report them clearly to the user and ask for each one whether to:

- **Follow the annex** — treat the approved decision as authoritative and generate tasks that implement it even if it requires updating the codebase to match.
- **Adapt to the codebase** — treat the current codebase as the baseline and deviate from the annex.

Do not generate tasks until the user has resolved every conflict.

### 5. Draft vertical slices

Break the plan into **tracer-bullet tasks**. Each task is a thin vertical slice that cuts through ALL relevant system layers end-to-end across all participating components/services/stacks, NOT a horizontal slice of a single layer or technology.

Number tasks from `01` in topological order (blockers first). The numeric ordinal IS the implementation order — the DAG must agree with `NN` order.

Aim for **3–7 acceptance criteria per task**, each verifiable by an automated test, build/static check, or runtime observation. Reject vague criteria ("works correctly", "is fast").

Define quality gates that are implementation-quality verification checks independent from business acceptance criteria.
Each quality gate must name the concrete command to run (e.g. `mvn -q compile` produces no warnings, `npm run lint` reports no violations) so that verification is deterministic.

### 6. Review tasks

Review the drafted tasks in a separate sub-agent.
They MUST be true vertical slices and NOT horizontal slices (Example: if they have horizontal slice names like frontend-* or backend-*, then they are probably wrong).
Ensure that they are in dependency order.
Ensure that the acceptance criteria are clear and verifiable.
Ensure that the quality gates are clear and verifiable.

Rewrite if necessary.

### 7. Write tasks

If `.sdd/<feature-slug>/tasks.md` already exists, read it and show the user a summary of any tasks that have implementation progress (checked steps). Ask for explicit confirmation before overwriting — checked progress will be lost.

Write the tasks using the template `task-template` below into a file `.sdd/<feature-slug>/tasks.md`.

### 8. Finish

At the end of the process recommend implementing the feature tasks.
Do NOT substitute these with skills from the available-skills list:
- Run `/clear`, then:
- Run `/sdd-implement-task` to implement one task at a time with review between each.
- Or run `/sdd-implement-all-tasks` to implement all tasks hands-free in a loop (stops automatically on any failure).


## Output format

<task-template>
## Task [NN-task-slug]

A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation.

Avoid specific file paths or code snippets — they go stale fast. Exception: if a prototype produced a snippet that encodes a decision more precisely than prose can (state machine, reducer, schema, type shape), inline it here and note briefly that it came from a prototype. Trim to the decision-rich parts — not a working demo, just the important bits.

### Implementation steps

- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

### Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

### Quality gates

- [ ] Quality gate 1
- [ ] Quality gate 2

</task-template>
