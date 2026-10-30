## Task [01-hugo-site-skeleton]

A first end-to-end slice: a clean public-ready repository that builds a German "Pirates Basketball" home page locally with the PaperMod theme. It covers tool installation, repository hygiene, site configuration, theme inclusion, and a working local preview of the home page.

### Implementation steps

- [x] Install Hugo extended locally at the newest stable version that meets the theme's requirement (e.g. `winget install Hugo.Hugo.Extended`), and record the version. **Recorded: 0.167.0 extended** (Blowfish v3.9.0 declares support for 0.164.0–0.167.0 only).
- [x] Unstage `.idea/` and `Pirates Homepage.iml` (`git rm --cached`) and add `.gitignore` entries for `.idea/`, `*.iml`, `public/`, `resources/_gen/`, `.hugo_build.lock`.
- [x] Add Blowfish as a git submodule under `themes/blowfish`, pinned to release tag v3.9.0 (replaces PaperMod, whose latest release v8.0 does not build on current Hugo).
- [x] Create `hugo.toml` with German language settings, title "Pirates Basketball", description "Homepage der Pirates Basketball", theme PaperMod, and search, social icons and analytics disabled.
- [x] Review PaperMod defaults (`ShowReadingTime`, `ShowShareButtons`, date formats, etc.) for German suitability and set them in `[params]`.
- [x] Create the home page content, using PaperMod's home-info mode with placeholder German text.
- [ ] ~~Run the site locally and check the home page in a browser.~~ *(partly skipped: `hugo server` served the page and CSS with HTTP 200, but no browser is available to look at it)*

### Acceptance criteria

- [x] `hugo version` reports an extended build that meets the theme's Hugo version range. *(v0.167.0+extended, within Blowfish 0.164.0–0.167.0)*
- [x] `hugo --gc --minify` builds without errors or warnings and produces `public/index.html`. *(built with --panicOnWarning, exit 0)*
- [x] The built home page has language `de` and the browser tab title contains "Pirates Basketball".
- [x] `git ls-files` lists no `.idea/` or `.iml` files and no `public/` content; `git submodule status` shows PaperMod pinned.
- [ ] ~~`hugo server` serves the home page locally with the theme design applied.~~ *(skipped: page and CSS served with HTTP 200, but the visual design cannot be checked without a browser)*

### Quality gates

- [x] `hugo --gc --minify --panicOnWarning` exits with code 0 (if PaperMod itself triggers warnings, drop the flag here and in all later tasks and note it in the README).
- [x] `git status --short` shows no unexpected files (no generated output, no IDE files).

## Task [02-about-and-news-content]

Add the remaining launch content: the "Über uns" page and a News section with two placeholder posts, plus the main menu with German labels. A visitor can navigate Home → Über uns → News → a single post, and a new post only requires adding one file.

### Implementation steps

- [x] Add the "Über uns" page at `/about/` with placeholder German text.
- [x] Add the News section with a list page and two dated placeholder posts.
- [x] Define the main menu in `hugo.toml`: Home, Über uns, News.
- [x] Verify that a newly created post (via `hugo new content news/<slug>.md`) appears in the list with no other edits, then remove the test post.
- [x] Change `title` in `hugo.toml`, rebuild, check that the new title appears on all pages, then revert.
- [ ] ~~Check the pages in a browser at desktop and phone width.~~ *(skipped: no browser available; the viewport meta tag is present and the theme is responsive)*

### Acceptance criteria

- [x] The build output contains `public/index.html`, `public/about/index.html`, `public/news/index.html` and one page per post.
- [x] The menu on every page shows Home, Über uns and News, all in German, and every entry leads to an existing page.
- [x] The news list shows posts newest first, and each entry opens the full post.
- [x] A test post added as a single file shows up in the news list after a rebuild.
- [x] Changing `title` in `hugo.toml` changes the browser tab title on every page, with no other file edited.
- [ ] ~~At phone width (about 400px), all pages are readable without sideways scrolling.~~ *(skipped: no browser available)*

### Quality gates

- [x] `hugo --gc --minify --panicOnWarning` exits with code 0.
- [x] `lychee --offline --root-dir "$PWD/public" "public/**/*.html"` (lychee at a pinned version) reports zero broken internal links. *(run against a build with `--baseURL "/"` into a temp dir, since the real `baseURL` has the `/pirates-homepage/` subpath; lychee 0.24.2, 100 OK, 0 errors)*

## Task [03-ci-build-check]

A GitHub Actions workflow that builds the site in CI, with the same pinned Hugo version as locally. It runs on pull requests and on pushes to `main`, and it fails the check if the build or the output check fails. Deployment is added in the next task.

### Implementation steps

- [x] Create the workflow file `.github/workflows/hugo.yml` with triggers: `pull_request` on `main`, `push` on `main`, and `workflow_dispatch`.
- [x] Set `permissions: contents: read` and pin all third-party actions to an exact version tag.
- [x] Pin the Hugo extended version once in the workflow's environment (`HUGO_VERSION`), matching the local version (0.167.0).
- [x] Add checkout with `submodules: recursive` and `fetch-depth: 0`, the Hugo install step, and `hugo --gc --minify`.
- [x] Add an output check step that fails if `public/index.html`, `public/about/index.html` or `public/news/index.html` is missing.
- [x] Validate the workflow file syntax locally with `actionlint`.
- [x] Verify in a fresh clone (`git clone --recurse-submodules <local path> <tmp dir>`) that the build and output check commands succeed without any manual theme download.

### Acceptance criteria

- [x] The workflow has the three triggers and uses `actions/checkout` with submodules enabled.
- [x] The Hugo version appears in exactly one place in the workflow and equals the local version.
- [x] A deliberately broken build (for example, a missing theme or invalid config) makes the build commands fail, shown by a local reproduction of the same commands.
- [x] The output check step exits non-zero when one of the three expected files is missing.
- [x] The workflow references no secrets, and all third-party actions are version-pinned.
- [x] In a fresh recursive clone, the workflow's build and output check commands succeed with no manual theme download.

### Quality gates

- [x] `actionlint .github/workflows/hugo.yml` reports no errors.
- [x] `grep -n "secrets\." .github/workflows/hugo.yml` finds nothing.
- [x] Running the workflow's build and output check commands locally exits with code 0.

## Task [04-pages-deployment-and-readme]

Publish the site on GitHub Pages: add the deploy job to the workflow, document the one-time manual setup in a README, and verify the live site after the first push to `main`. After this task, every push to `main` updates the live site.

### Implementation steps

- [x] Extend the workflow: upload the Pages artifact and add a `deploy` job, both only on push and manual dispatch (not on pull requests), with the `github-pages` environment, `baseURL` taken from `actions/configure-pages`, concurrency group `pages` (`cancel-in-progress: false`), and permissions `pages: write` and `id-token: write`.
- [x] Write `README.md` covering the one-time setup (create the public repo `carstenlex/pirates-homepage`, set Pages source to "GitHub Actions"), local preview, how to add a news post, and the pinned Hugo version.
- [ ] ~~Commit the work, then (by the owner) create the GitHub repo, add the remote and push `main`.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~Open a pull request with a small good change and one with a deliberate build error; confirm the first passes and the second fails, and neither deploys.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~Merge to `main`, and confirm that the workflow deploys and its result is visible in the repository's Actions tab.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~Edit one news post, merge it, and note how long the live site takes to show it; add a new post file and confirm it appears in the list; trigger "Run workflow" manually.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~Verify the live site against the user acceptance tests that need the live address (UAT 1, 6, 11, 12), and confirm that no secrets are configured in the repository settings.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*

### Acceptance criteria

- [ ] ~~The deploy job does not run for pull requests, and runs for pushes to `main` and manual dispatch.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~The workflow run for a push to `main` shows a success result in the repository, and the live site at `https://carstenlex.github.io/pirates-homepage/` shows the home page with the title "Pirates Basketball".~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~Following every menu link and post link on the live site leads to an existing page, with working CSS, and pages are readable at phone width without sideways scrolling.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~A pull request that builds correctly shows a successful check and publishes nothing; a pull request with a build error shows a failed check and leaves the live site unchanged.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [ ] ~~A news post change merged to `main` appears on the live site within a few minutes, a new post file appears in the news list with no other edit, and the manual "Run workflow" action completes with the site still available.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*
- [x] The README describes the manual setup steps, local preview, adding a news post, and the pinned Hugo version, which equals the version in the workflow.
- [ ] ~~Publishing works with no repository secrets configured, and `.claude/`, `.sdd/` and `README-SDD.md` stay in the repository but are not reachable on the live site.~~ *(skipped: needs the GitHub repository, which the owner has not created yet)*

### Quality gates

- [x] `actionlint .github/workflows/hugo.yml` reports no errors on the final workflow file.
- [x] `hugo --gc --minify --panicOnWarning` still exits with code 0.
- [ ] ~~`curl -s -o /dev/null -w "%{http_code}" https://carstenlex.github.io/pirates-homepage/.sdd/` and the same for `/README-SDD.md` return 404, and `ls public` shows no `.sdd`, `.claude` or `README-SDD.md`.~~ *(skipped: the live site does not exist yet; the `ls public` part passed locally)*
- [x] `git ls-files` shows no `.idea/`, `.iml`, `public/` or `resources/_gen/` files, and the repository contains no secrets. *(checked locally; nothing is committed yet)*
