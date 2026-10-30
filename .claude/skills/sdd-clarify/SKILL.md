---
name: sdd-clarify
description: Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, clarify a plan.
disable-model-invocation: true
license: MIT License, Copyright (c) 2026 ti&m AG, Copyright (c) 2026 Matt Pocock 
---

Interview the user relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

Do NOT use the AskUserQuestion tool. Ask one question at a time.

If a question can be answered by exploring the codebase, explore the codebase instead.

Do NOT read files in the `.sdd` directory, except if the user explicitly requests it.

When all identified questions are resolved, summarize the final plan and decisions.
Tell the user they can run `/sdd-write-requirements` as the next step when ready.
