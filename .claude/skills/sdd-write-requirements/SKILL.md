---
name: sdd-write-requirements
description: Turn the current conversation context into a requirements specification. Use when user wants to create a requirements doc, PRD, or spec from the current context.
license: MIT License, Copyright (c) 2026 ti&m AG, Copyright (c) 2026 Matt Pocock 
---

This skill takes the current conversation context and codebase understanding and produces a requirements specification. Do NOT start with open-ended interviews and do NOT stop to confirm your proposal before drafting — synthesize, decide, and write the document in one pass. The written `requirements.md` is itself the review artifact: the user reads it and corrects it afterwards, rather than approving an outline first.

The document has two clearly separated sections with different audiences:

- **Main body** — stable, business-readable prose. Suitable for export to Jira and review by business analysts, requirements engineers, and architects. No specific class names, method signatures, or file paths here — these go stale and confuse non-technical reviewers.
- **Technical Annex** — architect-reviewed, explicitly dated. Specific class names, method signatures, and implementation details are appropriate here because they preserve the precise decisions made during the planning session and give the task-generation step a verified starting point rather than forcing it to re-derive everything from scratch.

## Process

1. Explore the repo to understand the current state of the codebase, if you haven't already. Use the project's domain glossary vocabulary throughout, and respect any ADRs in the area you're touching.

2. Sketch out the major modules you will need to build or modify to complete the implementation. Actively look for opportunities to extract deep modules that can be tested in isolation.

   A deep module (as opposed to a shallow module) is one which encapsulates a lot of functionality in a simple, testable interface which rarely changes.

   Decide autonomously which modules to build or modify and which of them warrant automated tests, and capture those decisions in the Technical Annex — do not stop to confirm them with the user. If a module boundary or test-scope decision is genuinely consequential and you are uncertain, note the open question in the "Further Notes" section rather than blocking on a question.

3. Derive the feature slug as lowercase kebab-case from the feature name (e.g., `orders-csv-export`). This is a deterministic derivation and the slug has no consequences beyond naming the `.sdd/` folder, so just state the slug you're using and proceed — do not ask the user to confirm it unless the feature name is genuinely ambiguous.

   If `.sdd/<feature-slug>/requirements.md` already exists, show the user the first few lines of the existing file and ask whether to overwrite it. Do not proceed without explicit confirmation.

4. Record the current codebase commit for the Technical Annex header. If this is a git repository, run `git rev-parse --short HEAD` and use the result; otherwise write `not a git repository`.

5. Write the requirements specification using the template below into a file `.sdd/<feature-slug>/requirements.md`

   Inform the user of the location of the file. Recommend the next step:
   - Run `/sdd-write-tasks` to break the requirements into tasks.


<requirements-template>

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

A LONG, numbered list of user stories. Each user story should be in the format of:

1. As an <actor>, I want a <feature>, so that <benefit>

<user-story-example>
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending
</user-story-example>

This list of user stories should be extremely extensive and cover all aspects of the feature.

## User Acceptance Tests

A numbered list of acceptance tests that a human can perform to verify the feature works as described. Write these in business terms — no references to code, classes, or test frameworks. Each test should follow a Given/When/Then structure.

<user-acceptance-test-example>
1. Given an HTML page containing a navigation menu, when the page is ingested, then the navigation menu content does not appear in any retrieved chunk.
</user-acceptance-test-example>

## Definition of Done

A checklist of conditions that must be met for this feature to be considered complete and shippable. Written in business terms — no code references. Each item must be objectively verifiable.

<definition-of-done-example>
- All user acceptance tests pass.
- The feature is accessible to all user roles defined in the user stories.
- No regression in existing features.
- Documentation updated if user-facing behavior changed.
</definition-of-done-example>

## Out of Scope

A description of the things that are out of scope for this requirements specification.

## Further Notes

Any further notes about the feature.

---

## Technical Annex
> Written against codebase as of: <today's date> (commit <short-hash-from-step-4>)

This section contains the architectural and automated testing decisions derived from the planning session. It is intended for architect and developer review. Specific class names, method signatures, and implementation details are welcome here.

When this document is later used to generate tasks, the task-generation step will verify each decision in this annex against the current state of the codebase and flag any conflicts before proceeding — unless the codebase is still at the commit recorded above, in which case the verification is skipped as redundant.

### Architectural Decisions

A list of architectural and implementation decisions. This can include:

- The modules that will be built or modified, with their interfaces
- Design patterns and architectural approaches
- Library and technology choices
- Schema changes
- API contracts
- Specific interactions and data flows

Exception for code snippets: if a prototype produced a snippet that encodes a decision more precisely than prose can (state machine, reducer, schema, type shape), inline it here and note briefly that it came from a prototype. Trim to the decision-rich parts — not a working demo, just the important bits.

### Automated Testing Decisions

A list of automated testing decisions. Include:

- A description of what makes a good test (only test external behavior, not implementation details)
- Which modules will have automated tests written for them
- What types of tests (unit, integration, end-to-end)
- Prior art for the tests (i.e. similar types of existing tests in the codebase)

</requirements-template>
