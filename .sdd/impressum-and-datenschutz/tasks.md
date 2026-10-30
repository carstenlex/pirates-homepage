## Task [01-impressum-in-footer]

A visitor can open the Impressum from the footer of every page. The page names the club as operator, with address, contact email and responsible person, in German and in the site's design. The build fails if the page goes missing.

### Implementation steps

- [x] Create `content/impressum.md` (`title: "Impressum"`, `url: /impressum/`, following the pattern of `content/about.md`) with the agreed facts only: "Basketball Oberthurgau Pirates" (Verein), Tennisstrasse 12, 9320 Arbon, `info@pirates-basketball.ch`, "Carsten Lex, Präsident", the one-line copyright notice "Inhalte: © Basketball Oberthurgau Pirates" and a manual "Stand: <Datum>" line. No phone number, register or VAT numbers, or disclaimers.
- [x] Add the `[[menu.footer]]` entry "Impressum" (`pageRef = "impressum"`, weight 10) to `hugo.toml`; do not touch `[[menu.main]]` or the theme.
- [x] Extend the `test -f` loop of the output check in `.github/workflows/hugo.yml` with `public/impressum/index.html`.
- [x] Build with `hugo --gc --minify` and check the built pages and footer links with `grep`.
- [ ] ~~Run the site locally (`hugo server`) and check the page and footer at desktop and phone width, if a browser is available.~~ *(skipped: no browser available; the built HTML and footer links were verified with `grep`)*

### Acceptance criteria

- [x] `public/impressum/index.html` exists after `hugo --gc --minify`, its `<title>` contains "Impressum", and the page contains a line starting with "Stand".
- [x] `grep -F` finds each of "Basketball Oberthurgau Pirates", "Tennisstrasse 12", "9320 Arbon", "info@pirates-basketball.ch", "Carsten Lex, Präsident" and "© Basketball Oberthurgau Pirates" in `public/impressum/index.html`.
- [x] `grep -iE` finds no "Haftungsausschluss", "Haftung für Links", "Tel", "UID", "MWST" or "Handelsregister" in the content area of the built Impressum page (the page body is checked, not the theme chrome).
- [x] The built home page, Über uns page, news list and one news post each contain a footer link whose `href` ends in `/impressum/` (checked by `grep` in each file).
- [x] The main menu on the built home page contains exactly Home, Über uns and News, and no Impressum entry (checked by `grep` on the menu markup, and `git diff` shows `[[menu.main]]` unchanged).
- [x] Reproduction: after deleting `public/impressum/index.html` from a local build, the workflow's output-check shell loop, run locally, exits non-zero.
- [ ] ~~Manual check: at phone width (about 400px) the Impressum page and the footer link are readable and tappable without sideways scrolling.~~ *(skipped: no browser available)*

### Quality gates

- [x] `hugo --gc --minify --panicOnWarning` exits with code 0.
- [x] `actionlint .github/workflows/hugo.yml` reports no errors.
- [x] `lychee --offline` on a build with `--baseURL "/"` reports zero broken internal links.

## Task [02-datenschutz-in-footer]

A visitor can open the Datenschutzerklärung from the footer of every page. It explains in plain German that the club is responsible, that the site uses no cookies, tracking, forms or analytics, and that the hosting provider records technical data (including IP addresses) that may be processed in the USA. The build fails if the page goes missing, and a check proves the site makes no external requests.

### Implementation steps

- [x] Create `content/datenschutz.md` (`title: "Datenschutz"`, `url: /datenschutz/`) with: responsible party and contact, no cookies/tracking/forms/analytics, self-hosted fonts, GitHub Pages hosting with server logs (IP address) possibly processed in the USA, a short statement of rights under the Swiss revDSG, `info@pirates-basketball.ch` as contact for privacy questions, a note that the statement is updated when the site changes, and a manual "Stand: <Datum>" line.
- [x] Add the `[[menu.footer]]` entry "Datenschutz" (`pageRef = "datenschutz"`, weight 20) next to "Impressum" in `hugo.toml`.
- [x] Extend the `test -f` loop of the output check in `.github/workflows/hugo.yml` with `public/datenschutz/index.html`.
- [x] Build with `hugo --gc --minify`, then check the built pages, the footer links and the absence of external hosts with `grep`.
- [ ] ~~Run the site locally and check the page and footer at desktop and phone width, if a browser is available.~~ *(skipped: no browser available; built HTML verified with grep)*

### Acceptance criteria

- [x] `public/datenschutz/index.html` exists after `hugo --gc --minify`, its `<title>` contains "Datenschutz", and the page contains a line starting with "Stand".
- [x] `grep -F` finds each of "Basketball Oberthurgau Pirates", "Cookies", "GitHub", "USA", "IP-Adresse" and "info@pirates-basketball.ch" in `public/datenschutz/index.html`.
- [x] The built home page, Über uns page, news list, one news post and the Impressum page each contain footer links whose `href` ends in `/impressum/` and `/datenschutz/` (checked by `grep` in each file).
- [x] A `grep -oE 'https?://[^"'"'"' )>]+'` over all built HTML and CSS, with the site's own host and non-resource links (anchors to GitHub or other pages that are only navigated to, listed explicitly in the check output) excluded, shows no external host in any `src`, stylesheet `href` or `url(...)` reference.
- [x] Reproduction: after deleting `public/datenschutz/index.html` from a local build, the workflow's output-check shell loop, run locally, exits non-zero.
- [x] The main menu on the built home page contains exactly Home, Über uns and News (checked by `grep`; `[[menu.main]]` unchanged in `git diff`).
- [ ] ~~Manual check: at phone width (about 400px) the Datenschutz page and the footer links are readable and tappable without sideways scrolling.~~ *(skipped: no browser available)*

### Quality gates

- [x] `hugo --gc --minify --panicOnWarning` exits with code 0.
- [x] `actionlint .github/workflows/hugo.yml` reports no errors.
- [x] `lychee --offline` on a build with `--baseURL "/"` reports zero broken internal links.

## Task [03-publish-and-club-review]

The two pages go live through the existing automatic process, the README tells editors where to change them, and the club's review is recorded. After this task the live site shows both pages in the footer on every page.

### Implementation steps

- [ ] Add a short README paragraph naming `content/impressum.md`, `content/datenschutz.md` and the `[[menu.footer]]` entries in `hugo.toml`.
- [ ] Commit the changes and push them on a branch; open a pull request and confirm the check passes and nothing is published.
- [ ] Send both texts to the club for review and record the outcome (reviewer, date, confirmed legal form and registered name) as a pull request comment; apply any corrections.
- [ ] Merge to `main` and confirm that the workflow deploys successfully.
- [ ] Check the live site with `curl`: footer links on every page type, both pages' content, and absence of external resources.

### Acceptance criteria

- [ ] `grep` finds "content/impressum.md", "content/datenschutz.md" and "menu.footer" in `README.md`.
- [ ] `gh pr checks` for the pull request reports the build check as passed, and before the merge `curl` on the live `/impressum/` and `/datenschutz/` URLs does not return 200 (the live site still shows the previous version).
- [ ] The pull request contains a recorded club review (a comment naming the reviewer, the date, and confirming legal form and registered name), or a comment stating explicitly that the review is still outstanding and the draft is published unreviewed by the owner's decision.
- [ ] The workflow run for the push to `main` has conclusion `success` (`gh run list`), and `https://carstenlex.github.io/pirates-homepage/impressum/` and `.../datenschutz/` return HTTP 200 and contain "Tennisstrasse 12" and "GitHub" respectively (`curl -s | grep`).
- [ ] On the live site, the footer links found by `curl -s | grep` on the home page, Über uns, the news list and a news post each point to a URL that returns HTTP 200.
- [ ] The live HTML of the home page, `/impressum/` and `/datenschutz/` contains no `src`, stylesheet `href` or `url(...)` reference to a host other than `carstenlex.github.io`.

### Quality gates

- [ ] `curl -s -o /dev/null -w "%{http_code}"` returns 200 for the home page, `/impressum/` and `/datenschutz/` on the live site.
- [ ] `hugo --gc --minify --panicOnWarning` still exits with code 0.
- [ ] `git ls-files | grep -E '(^|/)\.idea/|\.iml$|^public/|^resources/_gen/'` prints nothing.
