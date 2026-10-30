# Skill-Based Spec Driven Development (SDD)

SDD is a workflow built from composable Claude Code skills that takes a feature idea through clarification → requirements → tasks → implementation → verification → archive.

Each skill owns one phase. Skills pass data through a shared storage layer (`.sdd/` directory). Context windows stay clean by running `/clear` between phases.

---

## Overview

```
idea → /sdd-clarify → /sdd-write-requirements → /sdd-write-tasks → /sdd-implement-task
```

Feature docs live under `.sdd/<feature-slug>/`:
- `requirements.md` — the product requirements document
- `tasks.md` — the tasks to be implemented

---

## Skills

### `/sdd-clarify` — Align on scope before writing specs

Interviews you about the feature until all decisions are resolved. Asks one question at a time, provides a recommended answer, and walks down each branch of the decision tree.

**When to use:** Before writing a requirements specification, when the feature idea has open questions or ambiguities.

> **Note:** `/sdd-clarify` is independent of the sdd-* framework. It works in any context where you need to resolve open questions before proceeding — not just feature development. Use it to stress-test a plan, align on a design decision, or clear ambiguity before any significant piece of work.

**Arguments:** A natural language description (inline or via `@file`), or an existing feature slug to ground the interview in that feature's requirements.

```
/sdd-clarify @exercise/feature-orders-csv-export.md
/sdd-clarify orders-csv-export
/sdd-clarify Add a feature to export orders in CSV format
```

**Output:** A summary of confirmed decisions, deferred decisions, and open risks. Recommends `/sdd-write-requirements` as the next step.

**Tip:** Do NOT run `/clear` after clarify — the requirements skill reads the clarification context.

---

### `/sdd-write-requirements` — Write the Product Requirements Document

Turns the current conversation context into a requirements specification and writes it to `.sdd/<feature-slug>/requirements.md`.

**When to use:** After `/sdd-clarify`, or when starting a feature you already understand well.

**Arguments:** Optional slug. If omitted, the skill asks for one during the process.

```
/sdd-write-requirements
/sdd-write-requirements orders-csv-export
```

**Input:** The current conversation context (clarification answers, or a direct description).

**Process:**
1. Explores the codebase to understand the current state.
2. Sketches the modules to build or modify; confirms with you.
3. Asks for the feature slug (e.g., `orders-csv-export`).
4. Drafts the requirements inline for your review — iterates until approved.
5. Writes the approved requirements to storage.

**Requirements sections:** Problem Statement, Solution, User Stories, Implementation Decisions, Testing Decisions, Definition of Done, Out of Scope.

**After:** Run `/clear`, then `/sdd-write-tasks`.

---

### `/sdd-write-tasks` — Break the requirements into tasks

Reads the requirements and breaks it into tracer-bullet vertical slices — thin tasks that each cut through all integration layers end-to-end.

**When to use:** After the requirements specification is approved.

**Arguments:** Optional slug. If omitted, the skill asks for one.

```
/sdd-write-tasks
/sdd-write-tasks orders-csv-export
```

**Process:**
1. Reads the requirements from storage.
2. Drafts 3–7 acceptance criteria per task, each verifiable by test, build check, or runtime observation.
3. Orders tasks in dependency order (blockers first, lowest `NN` first).
4. Presents the full task list for your review — iterates until approved.
5. Writes tasks to `.sdd/<feature-slug>/tasks.md`.

If tasks already exist for the feature, explicitly states which will be kept, overwritten, or deleted before writing.

**After:** Run `/clear`, then `/sdd-implement-task`.

---

### `/sdd-implement-task` — Implement tasks one at a time

Implements the next task in dependency order.

**When to use:** After tasks are written and reviewed.

**Arguments:** Optional slug. If omitted, the skill asks for one.

```
/sdd-implement-task
/sdd-implement-task orders-csv-export
```

**Process (per task):**
1. Reads the requirements and task list; picks the next task.
2. Confirms scope — states chosen task and acceptance criteria to user before coding.
3. Implements directly — surgical changes, follows project conventions, runs build and tests, marks implementation steps `[x]`.
4. Verifies each acceptance criterion and marks passing ones `[x]` in the task file.

Repeat this step until no more implementation tasks remain.

---

## Full Workflow Example

```
# 1. Clarify the feature
/sdd-clarify @exercise/feature-orders-csv-export.md
# Answer the clarification questions.

# 2. Write the requirements (no /clear between clarify and requirements)
/sdd-write-requirements
# Review the draft requirements specification and approve it.

# 3. Write tasks
/clear
/sdd-write-tasks
# Review the task breakdown and approve it.

# 4. Implement
/clear
/sdd-implement-task
# Review each task after Claude codes it. Commit when done.
# Repeat /sdd-implement-task until all tasks are implemented

# 5. Archive or delete the artifacts in `.sdd` manually when the feature is done
```

---

## Storage Layout

```text
.sdd/
  <feature-slug>/
    requirements.md
    tasks.md
  ...
```

---

## When to `/clear`

| Before this skill         | Run `/clear`? |
|---------------------------|---|
| `/sdd-clarify`            | Yes |
| `/sdd-write-requirements` | **No** — needs clarify context |
| `/sdd-write-tasks`        | Yes |
| `/sdd-implement-task`     | Yes |

---

## Tips

- **Feature prompts** — write the feature description in a separate file and reference it with `@file` to keep the prompt clean and focused.
