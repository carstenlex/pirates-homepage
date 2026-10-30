## Problem Statement

The Basketball Oberthurgau Pirates website is public, but it does not say who runs it, how to reach the operator, or what happens to visitors' data. Visitors cannot tell who is responsible for the content. The site is hosted by a third party in the USA that records visitors' technical data, and under Swiss data protection law (revDSG) visitors should be told about that. Without these two pages the site is incomplete and the club exposes itself to avoidable criticism.

## Solution

Two short German pages are added to the site: an **Impressum** that names the club as the operator with its postal address, contact email and responsible person, and a **Datenschutzerklärung** (privacy policy) that explains in plain language what data is processed when the site is visited. Both pages are linked from the footer of every page, so they are always one click away. The main menu stays unchanged. The texts are drafted from the facts supplied by the owner, kept deliberately minimal, and must be reviewed by the club before the site is made public.

## User Stories

1. As a visitor, I want to see who operates the website, so that I know whom the content belongs to and whom to contact.
2. As a visitor, I want to find the postal address of the club, so that I can write to it or visit it.
3. As a visitor, I want to find a contact email address, so that I can ask questions or report problems.
4. As a visitor, I want to know who is responsible for the content, so that I know whom to address with corrections.
5. As a visitor, I want a link to the Impressum on every page, so that I do not have to search for it.
6. As a visitor, I want a link to the Datenschutzerklärung on every page, so that I can read how my data is handled whenever I like.
7. As a visitor, I want to be told that the site uses no cookies, no tracking and no analytics, so that I can browse without worrying about being profiled.
8. As a visitor, I want to be told that the hosting provider records technical data such as my IP address when I open a page, so that I understand what is processed even without tracking.
9. As a visitor, I want to know that this data may be processed in the USA, so that I can judge whether I am comfortable with it.
10. As a visitor, I want to know whom to contact with privacy questions, so that I can exercise my rights.
11. As a visitor, I want both pages in German, so that I can read them in my language.
12. As a visitor, I want both pages to look like the rest of the site and be readable on a phone, so that I can read them on any device.
13. As a visitor, I want the footer links to be easy to see and tap on a phone, so that I can reach the legal pages without zooming.
14. As a visitor, I want to see when the texts were last updated, so that I know they are current.
15. As a visitor, I want the pages to work at their public addresses with no "page not found" error, so that legal information is always reachable.
16. As a club board member, I want the club named correctly as the operator, so that the site presents the club officially.
17. As a club board member, I want only the agreed facts in the texts, so that nothing inaccurate or invented is published in the club's name.
18. As a club board member, I want a minimal Impressum without long disclaimers, so that the page stays short and clear.
19. As a club board member, I want the texts reviewed before the site goes public, so that the club does not publish legal wording nobody has checked.
20. As a club board member, I want the club's role-based email address published rather than a private one, so that private contact details are not exposed.
21. As the responsible person (Präsident), I want to be named only by name and role, so that my home address is not published.
22. As a site editor, I want to edit each legal page as a single text file, so that updates are quick and need no programming.
23. As a site editor, I want to change the footer entries in the central settings, so that I can add or rename legal links without touching page templates.
24. As a site editor, I want the new pages to be published by the existing automatic process, so that no extra deployment steps are needed.
25. As a site editor, I want a failing build to be caught before it reaches the live site, as for all other changes, so that the legal pages cannot break the site.
26. As a project owner, I want the main menu to stay at Home, Über uns and News, so that the navigation remains simple.
27. As a project owner, I want no third-party fonts, scripts or services added for these pages, so that the privacy statement stays true.
28. As a future maintainer, I want the privacy statement to be easy to find and edit, so that I can update it when the hosting or the site's features change.

## User Acceptance Tests

1. Given any page of the site, when a visitor scrolls to the bottom, then the links "Impressum" and "Datenschutz" are visible in the footer.
2. Given the footer of the home page, when a visitor selects "Impressum", then the Impressum page opens.
3. Given the footer of the home page, when a visitor selects "Datenschutz", then the Datenschutzerklärung page opens.
4. Given the Impressum page, when a visitor reads it, then it names "Basketball Oberthurgau Pirates", the address "Tennisstrasse 12, 9320 Arbon", the email address "info@pirates-basketball.ch", and "Carsten Lex, Präsident" as the responsible person.
5. Given the Impressum page, when a visitor reads it, then it contains no phone number, no commercial register or VAT number, and no disclaimer paragraphs beyond a one-line content copyright notice.
6. Given the Datenschutzerklärung page, when a visitor reads it, then it states that the club is responsible, that the site uses no cookies, tracking, forms or analytics, and that the site is hosted on GitHub Pages.
7. Given the Datenschutzerklärung page, when a visitor reads it, then it states that the hosting provider records technical data such as the IP address and that this may happen in the USA.
8. Given the Datenschutzerklärung page, when a visitor reads it, then it names "info@pirates-basketball.ch" as the contact for privacy questions.
9. Given either legal page, when a visitor looks at the page, then a "Stand" line shows the date of the last update.
10. Given either legal page, when a visitor looks at the main menu, then it still contains exactly Home, Über uns and News.
11. Given the Impressum page, when the visitor looks at the tab title, then it contains "Impressum", and for the privacy page it contains "Datenschutz".
12. Given both legal pages opened on a phone-sized screen, when a visitor reads them, then the text is readable and nothing requires sideways scrolling, and the footer links are tappable.
13. Given the live site, when a visitor follows the footer links on every page type (home, Über uns, News list, a news post), then none leads to a "page not found" error.
14. Given a change that breaks the site build, when it is proposed for merging, then the check reports a failure, and the live site is unaffected, as for any other change.
15. Given all texts, when the club reviews them, then every statement matches the facts supplied by the owner and nothing in them is invented.
16. Given the live site, when a visitor opens the site with browser developer tools, then no request goes to a host other than the site's own address (no external fonts, scripts or trackers).

## Definition of Done

- All user acceptance tests pass.
- Both pages are reachable from the footer on every page and are in German.
- The Impressum contains exactly the agreed facts and is minimal; the Datenschutzerklärung contains the agreed statements.
- The club has reviewed both texts and confirmed the legal form and registered name before the site is announced publicly.
- The main menu is unchanged.
- The site still builds without errors or warnings, internal links are all valid, and the live site shows the new pages after merging to the main branch.
- No external services, fonts or scripts are added.
- The README mentions where to edit the legal pages and the footer links.

## Out of Scope

- Legal advice or a legal guarantee of completeness; the texts are drafts that the club must review.
- Disclaimers such as Haftungsausschluss, Urheberrecht boilerplate and Haftung für Links.
- A cookie banner or consent tool (no cookies are used).
- A phone number, commercial register number, VAT number, or bank details.
- Contact forms, newsletters, or other features that would process more data.
- Translations (German only).
- Terms of use or other legal pages.
- Changes to the main menu.

## Further Notes

- The legal form is assumed to be an association (Verein). The club must confirm the form and the exact registered name.
- The responsible person is Carsten Lex, Präsident, as given by the owner. Only name and role are published, not a private address.
- The site and this feature are developed in a public repository. The texts are therefore public from the first commit onward, even before the live site is announced. The club should review the drafts before merging, or accept that the draft is visible.
- If features are added later (analytics, forms, embedded media, maps), the Datenschutzerklärung must be updated.
- The existing requirements for the site (spec `hugo-github-pages-site`) still apply to all pages added here.
- Open question: whether the "Stand" date is maintained by hand in the text or derived from the file's last change. Manual is assumed, for simplicity.

---

## Technical Annex
> Written against codebase as of: 2026-10-30 (commit d031442)

### Architectural Decisions

**Content**
- Two Markdown pages in `content/`: `content/impressum.md` (`title: "Impressum"`, `url: /impressum/`) and `content/datenschutz.md` (`title: "Datenschutz"`, `url: /datenschutz/`), following the pattern of the existing `content/about.md`. Both are plain pages (default Hugo `page` kind) and use the theme's default single layout.
- Both pages carry placeholder-free text drafted from the supplied facts. The "Stand: <Datum>" line is part of the Markdown body, written manually.
- Impressum body: club name and legal form (Verein), address (Tennisstrasse 12, 9320 Arbon), email `info@pirates-basketball.ch`, responsible person "Carsten Lex, Präsident", and one copyright line "Inhalte: © Basketball Oberthurgau Pirates".
- Datenschutz body: responsible party; no cookies, tracking, forms or analytics; self-hosted fonts; GitHub Pages hosting with server logs including IP addresses processed by GitHub (Microsoft) possibly in the USA; contact `info@pirates-basketball.ch`; the user's rights under the revDSG in short form; a note that the statement is updated when the site changes.
- The pages are not added to `[[menu.main]]`; they appear only in the footer menu.

**Footer menu**
- Add two `[[menu.footer]]` entries to `hugo.toml` (names "Impressum" and "Datenschutz", `pageRef = "impressum"` / `"datenschutz"`, weights 10 and 20).
- Verified in the codebase: `themes/blowfish/layouts/partials/footer.html` renders `.Site.Menus.footer` when `params.footer.showMenu` is true (default), so no template override is needed. If rendering at phone width proves unsatisfactory, the fix is custom CSS in `assets/css/custom.css`, not a theme edit.
- The theme submodule `themes/blowfish` is not modified.

**Repository and delivery**
- No change to the workflow in `.github/workflows/hugo.yml`; the existing build, output check and deploy run unchanged.
- Optionally extend the workflow's output check by `public/impressum/index.html` and `public/datenschutz/index.html`, so the build fails if a legal page is missing. Decision: yes, extend the loop, because the pages carry legal weight.
- README: add a short paragraph naming the two files and the footer menu entries in `hugo.toml`.

**Privacy facts to keep true**
- Fonts are self-hosted (`static/fonts`), no external requests are made by the site. Any later change that adds an external resource must also update the Datenschutzerklärung.

### Automated Testing Decisions

- A good test checks external behavior only: whether the pages are built, linked and contain the agreed facts. It does not test Hugo or the theme internals.
- No unit tests: there is no custom code, only content and configuration.
- **Build check (integration):** `hugo --gc --minify --panicOnWarning` must still exit 0 (as in the existing workflow and quality gates).
- **Output check (integration):** extend the existing `test -f` loop in the workflow with `public/impressum/index.html` and `public/datenschutz/index.html`.
- **Content check (integration):** after the build, a short shell check with `grep` verifies that `public/impressum/index.html` contains the address, the email address and the responsible person, and that `public/datenschutz/index.html` contains "GitHub". This guards the agreed facts against accidental edits. It may be run locally as part of the task's quality gates and does not need to be part of the workflow.
- **Footer check (integration):** `grep` on a few built pages (home, about, news list, one post) verifies the footer links to `/impressum/` and `/datenschutz/`.
- **Link check:** the existing offline `lychee` run on a build with `--baseURL "/"` must report no broken internal links (same approach as in the site spec).
- **External requests:** `grep` for `https://` hosts in the built HTML other than the site's own, to confirm no external resources were introduced.
- Prior art: the existing quality gates and workflow output check of the site spec (`hugo-github-pages-site`), plus the lychee link check.
