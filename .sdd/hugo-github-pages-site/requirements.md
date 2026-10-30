## Problem Statement

The Pirates Basketball team has no website. Publishing one by hand is error-prone: every change would need a manual build and upload, and a forgotten step leaves the public page out of date. The team needs a simple German-language homepage whose published version always matches the latest approved content, without anyone having to operate a server or run a deployment by hand.

## Solution

A small static website ("Pirates Basketball") is generated from content files kept in the project's public GitHub repository. Whenever a change is added to the main branch, the site is rebuilt and published automatically on GitHub Pages, so the live page is updated within minutes without manual work. Proposed changes are checked by a build before they are merged, so a broken page is caught before it can reach the live site. At launch the site is minimal: a home page, an "Über uns" (About) page, and a "News" section with placeholder posts. The site can be previewed locally before publishing.

## User Stories

1. As a site editor, I want the website to be rebuilt and published automatically whenever a change reaches the main branch, so that the live site is never out of date and I do not need to deploy anything by hand.
2. As a site editor, I want to write pages and news posts as simple text files, so that I can update the site without programming knowledge beyond basic text formatting.
3. As a site editor, I want to preview the site on my own computer before publishing, so that I can check how a change looks before visitors see it.
4. As a site editor, I want a manual "re-publish" option, so that I can republish the current state without making a new change.
5. As a site editor, I want proposed changes to be test-built before they are merged, so that I find out about errors before the live site is affected.
6. As a site editor, I want a failed build to leave the live site untouched, so that visitors never see a half-built or broken page.
7. As a site editor, I want the build to show a clear success or failure result for each change, so that I know whether my change was published.
8. As a site editor, I want to add a new news post by adding one file, so that publishing news is quick.
9. As a site editor, I want news posts to be listed with the newest first, so that visitors see current information at the top.
10. As a site editor, I want the website's title and description to be maintained in one central place, so that I can change them without searching through pages.
11. As a site editor, I want the website to behave the same on my computer and in the automatic build, so that what I preview is what gets published.
12. As a site editor, I want the tool version used to build the site to be fixed, so that an unexpected tool update cannot break or change the site.
13. As a site editor, I want the visual design to be maintained by an established, ready-made theme, so that I do not have to design or maintain the layout myself.
14. As a visitor, I want to open the Pirates Basketball website at a stable public address, so that I can find the team online.
15. As a visitor, I want a home page that introduces the team, so that I immediately understand what the site is about.
16. As a visitor, I want an "Über uns" page, so that I can learn who the Pirates Basketball team are.
17. As a visitor, I want a "News" section, so that I can read the latest announcements.
18. As a visitor, I want to open an individual news post, so that I can read it in full.
19. As a visitor, I want to move between Home, Über uns, and News from a menu on every page, so that I can navigate easily.
20. As a visitor, I want all text and navigation labels to be in German, so that I can read the site in my language.
21. As a visitor, I want the site to display properly on a phone, tablet, and computer, so that I can use it on any device.
22. As a visitor, I want pages to load quickly, so that I am not kept waiting.
23. As a visitor, I want all internal links and images to work at the public address, so that I never land on a "page not found" error from normal navigation.
24. As a visitor, I want the browser tab to show a meaningful title, so that I can recognise the site among my open tabs.
25. As a project owner, I want the source of the site to live in a public repository under my GitHub account, so that publishing on the free GitHub plan is possible.
26. As a project owner, I want development tooling files that are only relevant to my own machine kept out of the public repository, so that it contains only what is useful to others.
27. As a project owner, I want generated output kept out of the repository, so that the repository contains only the source of truth.
28. As a project owner, I want the setup steps that cannot be automated (creating the repository, enabling the publishing source) documented, so that I can complete them without guessing.
29. As a project owner, I want the public address to be derived automatically rather than typed into configuration, so that a later move to a custom domain does not need code changes.
30. As a project owner, I want the publishing process to need no secret passwords or keys, so that there is nothing sensitive to leak or rotate.
31. As a project owner, I want the theme included in a way that records its exact version, so that the site looks the same until I deliberately upgrade it.
32. As a future maintainer, I want to be able to add more sections later without changing the publishing process, so that the site can grow cheaply.

## User Acceptance Tests

1. Given the site source on the main branch, when a change to a news post is added to the main branch, then within a few minutes the live site shows the updated post.
2. Given a change on the main branch, when the automatic process finishes, then its result (success or failure) is visible to the project owner in the repository.
3. Given a change that makes the site impossible to build, when it is proposed for merging, then the check reports a failure and the live site still shows the previous version.
4. Given the live site is up to date, when the project owner triggers the manual re-publish, then the process runs and the live site remains available and unchanged.
5. Given a proposed change that builds correctly, when it is proposed for merging, then the check reports success and nothing is published until it reaches the main branch.
6. Given the live site address, when a visitor opens it, then the home page is shown with the title "Pirates Basketball" in the browser tab.
7. Given the home page, when a visitor looks at the menu, then it contains entries for Home, Über uns, and News, all in German.
8. Given the home page, when a visitor selects "Über uns", then the About page opens.
9. Given the home page, when a visitor selects "News", then a list of news posts is shown, newest first.
10. Given the news list, when a visitor selects a post, then the full post opens.
11. Given any page of the live site, when a visitor follows every menu link and every link inside the pages, then none leads to a "page not found" error.
12. Given the live site opened on a phone-sized screen, when a visitor browses all pages, then text is readable and nothing requires sideways scrolling.
13. Given an editor who has installed the site tooling, when they start the local preview, then the site opens on their computer and looks the same as the live site apart from the address.
14. Given a new news post file added to the News section, when the change is published, then the post appears in the news list without any other file being edited.
15. Given the site title is changed in the central settings, when the change is published, then the new title appears on all pages.
16. Given the public repository, when its file list is viewed, then no editor project files and no generated site output are present.
17. Given a fresh clone of the repository, when the theme is fetched together with it, then the local preview and the automatic build both work without any manual theme download.
18. Given the repository settings, when no secret or password has been configured, then publishing still works.

## Definition of Done

- All user acceptance tests pass.
- The live site is reachable at its public GitHub Pages address, showing Home, Über uns, and News in German.
- A change merged to the main branch is published automatically without manual steps.
- A proposed change that fails to build is reported as failed and never reaches the live site.
- The tool version used for building is fixed and is the same for the automatic build and the documented local preview.
- The public repository contains no editor-specific files and no generated output.
- No secrets are required or stored for publishing.
- A short README explains the one-time manual setup steps, how to preview locally, and how to add a news post.
- Existing development files (`.claude/`, `.sdd/`, `README-SDD.md`) remain in the repository and do not appear on the live site.

## Out of Scope

- Custom domain name, DNS setup, or HTTPS configuration beyond the GitHub default.
- Multilingual support (only German).
- Search, social media icons, comments, analytics, and cookie banners.
- A contact page, team/member profiles, game schedule, or results.
- A content management interface; content is edited as files.
- Custom theme design or branding (logo, colour scheme) beyond the standard theme.
- Hosting providers other than GitHub Pages.
- Restricting site access to specific people.
- Real content; launch uses placeholder text.

## Further Notes

- The site title and description are "Pirates Basketball" and "Homepage der Pirates Basketball". This combines the earlier agreement ("Pirates" / "Homepage der Pirates") with the instruction to add "Basketball". It should be confirmed.
- The public repository means everything committed is visible to everyone, including the SDD working files. The owner agreed to keep them.
- The repository currently has no commits, and `.idea/` and the `.iml` file are staged. They must be unstaged before the first commit.
- Open question: whether the newest Hugo release meets PaperMod's minimum version. This is to be verified when pinning.

---

## Technical Annex
> Written against codebase as of: 2026-10-30 (commit: none, repository has no commits yet)

### Architectural Decisions

**Hosting and repository**
- GitHub repository `carstenlex/pirates-homepage`, public.
- Pages source: "GitHub Actions" (one-time manual setting). Site URL `https://carstenlex.github.io/pirates-homepage/`.

**Hugo project (repo root)**
- `hugo.toml` with: `baseURL` placeholder (overridden in CI), `languageCode = "de-DE"`, `defaultContentLanguage = "de"`, `title = "Pirates Basketball"`, `theme = "PaperMod"`, a `[params]` block with description "Homepage der Pirates Basketball", and a `[[menu.main]]` block with entries Home (`/`), Über uns (`/about/`), News (`/news/`).
- PaperMod search, social icons and analytics stay disabled. PaperMod's `ShowReadingTime`, `ShowShareButtons` and similar defaults are reviewed for German suitability.
- Content: `content/_index.md` (home; PaperMod home-info mode via params), `content/about.md` (title "Über uns", `url = /about/`), `content/news/_index.md` and two placeholder posts `content/news/<slug>.md` with `date`, `title`, `draft: false`.
- Theme: git submodule at `themes/PaperMod`, pinned to a release tag commit. Added via `git submodule add https://github.com/adityatelange/hugo-PaperMod themes/PaperMod`.
- `.gitignore`: `public/`, `resources/_gen/`, `.hugo_build.lock`, `.idea/`, `*.iml`.

**Hugo version**
- Hugo extended, exact version stored once in the workflow `env` (e.g. `HUGO_VERSION`). The version is the newest stable one that meets PaperMod's minimum requirement, checked at implementation time. Local install via `winget install Hugo.Hugo.Extended`, with the same version documented in the README.

**CI/CD: `.github/workflows/hugo.yml`**
- Triggers: `push` on `main`, `pull_request` on `main`, and `workflow_dispatch`.
- Permissions: `contents: read`, `pages: write`, `id-token: write`. Concurrency group `pages`, `cancel-in-progress: false`.
- Job `build` (all triggers): `actions/checkout` with `submodules: recursive` and `fetch-depth: 0`; install Hugo extended at the pinned version (downloaded release `.deb`, or `peaceiris/actions-hugo` pinned to a commit/tag); `actions/configure-pages` (output `base_url`) on push and dispatch; `hugo --gc --minify --baseURL "${{ steps.pages.outputs.base_url }}/"` (on pull requests, build with the default `baseURL` and skip configure-pages); `actions/upload-pages-artifact` on push and dispatch only.
- Job `deploy` (`needs: build`, only when `github.event_name != 'pull_request'`): environment `github-pages`, `actions/deploy-pages`.
- All third-party actions pinned to an exact major version tag at minimum.

**Repository hygiene**
- Unstage `.idea/` and `Pirates Homepage.iml` (`git rm --cached`), then ignore them.
- Keep `.claude/`, `.sdd/`, `README-SDD.md` (the outdated `CLAUDE.md` was deleted). Hugo ignores unknown top-level folders; none is named `content`, `static`, `layouts` or `assets`.

**Documentation**
- New `README.md` covering the one-time setup (create repo, set Pages source), local preview (`hugo server`), adding a news post (`hugo new content news/<slug>.md`), and the pinned Hugo version.

### Automated Testing Decisions

- A good test checks external behavior only: whether the site builds and whether the output contains the expected pages and working links. It does not test the internals of Hugo or the theme.
- No unit tests: there is no custom code, only configuration and content.
- **Build check (integration):** the pull-request job runs `hugo --gc --minify` and fails on any template or configuration error. `--panicOnWarning` is considered if it works with PaperMod.
- **Output check (integration):** after the build, a CI step verifies that `public/index.html`, `public/about/index.html` and `public/news/index.html` exist, e.g. with a short shell `test -f` check. Optionally, an internal link check on `public/` (a pinned link-checker action or tool) detects broken links.
- **End-to-end:** the deployment itself is verified manually once after the first push by running UAT 1, 6 and 11 against the live address. It is not automated.
- Prior art: none in this repository; the existing SDD skills define no tests for this kind of project.
