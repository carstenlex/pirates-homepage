---
name: sdd-walkthrough-implementation
description: Walk the user step by step through an implemented SDD feature to build a clear understanding of what was built, why, and how. Use when the user wants to understand an implementation, review completed work, onboard onto a feature, or learn what the AI built while they were away. Trigger on phrases like "walk me through", "explain the implementation", "what was built", "help me understand what changed", "review what was implemented".
disable-model-invocation: true
license: Copyright (c) 2026 ti&m AG
---

Guide the user through an implemented SDD feature one task at a time. Think of this as a pair-programming explanation session, not a documentation read-out. The goal is not to read every line of code — it is to build a mental model of what was built, why each decision was made, and how the pieces fit together.

## Process

### 1. Resolve the feature

If the user specified a feature slug, use it. Otherwise list the directories under `.sdd/` and ask which feature to walk through. Only list a directory if it contains a `tasks.md` file — ignore `.archive` and any empty or incomplete folders (a feature with no `tasks.md` has nothing to walk through yet).

### 2. Read the spec

Read `.sdd/<feature-slug>/requirements.md` and `.sdd/<feature-slug>/tasks.md`. These are your source of truth for *what was intended* — you will use them to explain the *why* behind each implementation choice.

### 3. Discover what was actually built

Explore the codebase to understand what was implemented. Use the task descriptions and the `Architectural Decisions` section of `requirements.md` to identify the relevant files and modules.

### 4. Orient the user

Note how many tasks are complete versus incomplete. A task is complete when all its implementation steps are either `- [x]` (done) or `- [ ] ~~text~~` (skipped) — skipped acceptance criteria and quality gates do not make a task incomplete. If some tasks are incomplete, state this clearly at the start and limit the walkthrough to completed tasks by default — ask the user if they want to discuss incomplete tasks as well.

Before diving into tasks, give a brief orientation (3–5 sentences):

- What problem this feature solves (from the Problem Statement)
- The high-level approach that was chosen (from the Technical Annex)
- How many tasks were implemented and roughly how they are ordered

Ask the user if they are ready to begin, or if they have any upfront questions.

### 5. Walk through each task

For each completed task, in implementation order:

**a) Connect to the requirement**
State which user story or acceptance criterion this task addresses. Explain *why* this piece of the work was needed — the user benefit, not just the code change.

**b) Explain the design decision**
Describe the approach taken and why it was chosen over alternatives. Draw from the Technical Annex and the task description. Focus on the reasoning, not the mechanics.

**c) Show the key code**
Identify the 1–3 most important code changes in this task. Show those specific pieces and explain what each one does. Skip boilerplate, tests, and configuration unless they encode an interesting decision.

**d) Check readiness**
Ask the user if they want to go deeper into this topic or continue to the next task.

### 6. Close with a summary

After all tasks, give a short summary:

- The thread connecting requirements → design decisions → implementation
- Any interesting trade-offs or things left out of scope
- Suggested next steps if the user wants to go deeper (e.g., specific files to read, tests to run, the out-of-scope items from requirements.md)

## Tone

Be conversational. Use analogies where they help. If the user asks a question mid-walkthrough, answer it fully before continuing — do not defer questions to "later".
