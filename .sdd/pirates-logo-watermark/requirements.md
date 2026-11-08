# Pirates-Logo als Wasserzeichen

Feature-Slug: `pirates-logo-watermark`

## Problem Statement

Die neue Pirates-Homepage ist ein schlichter, rein schwarzer Hintergrund. Das Vereinslogo erscheint nur klein in der Kopfzeile. Die Seite wirkt dadurch kühl und unpersönlich, und ihr fehlt der Wiedererkennungswert, den die Vereinsfarben und das Logo auf der alten Vereinsseite geben.

## Solution

Auf allen Seiten der Homepage erscheint das Pirates-Logo gross, zentriert und sehr dezent als Wasserzeichen hinter dem Inhalt. Es bleibt beim Scrollen an derselben Stelle stehen, ist weiss auf dem schwarzen Hintergrund bei sehr geringer Deckkraft (6 %) und stört weder Texte noch Tabellen noch Karten. Auf dem Handy wird das Logo vollständig und passend verkleinert dargestellt.

## User Stories

1. As a Besucher der Homepage, I want auf jeder Seite das Pirates-Logo im Hintergrund zu sehen, so that die Seite sofort als Seite der Pirates erkennbar ist.
2. As a Besucher, I want, dass das Logo nur sehr dezent sichtbar ist, so that es nicht vom Inhalt ablenkt.
3. As a Besucher, I want, dass Texte, Tabellen, Karten und News trotz Wasserzeichen gut lesbar bleiben, so that ich die Informationen ohne Mühe aufnehme.
4. As a Besucher, I want, dass das Logo beim Scrollen an seiner Stelle stehen bleibt, so that der Hintergrund ruhig wirkt.
5. As a Besucher am Computer, I want das Logo zentriert und gut proportioniert zu sehen, so that es als Gestaltungselement und nicht als Fehler wirkt.
6. As a Besucher mit dem Handy, I want das ganze Logo auf dem schmalen Bildschirm zu sehen, ohne dass es abgeschnitten wird, so that der Hintergrund auch dort stimmig wirkt.
7. As a Besucher mit dem Handy, I want, dass die Seite nicht seitlich scrollbar wird und nicht ruckelt, so that die Bedienung flüssig bleibt.
8. As a Besucher, I want das Wasserzeichen auch auf Über uns, News, Impressum und Datenschutz zu sehen, so that die Seite einheitlich wirkt.
9. As a Besucher, I want, dass das Wasserzeichen nicht anklickbar ist und keine Eingaben blockiert, so that Links, Menü und Tabellen wie gewohnt funktionieren.
10. As a Besucher mit Screenreader, I want, dass das Wasserzeichen nicht vorgelesen wird, so that rein dekorative Elemente die Navigation nicht stören.
11. As a Besucher, I want, dass das Wasserzeichen im dunklen Pirates-Farbschema zur Seite passt, so that es zu Kopfzeile, Tabellen und Karten harmoniert.
12. As a Vereinsverantwortlicher, I want, dass das Wasserzeichen das vorhandene Logo wiederverwendet, so that ich kein zweites Bild pflegen muss.
13. As a Vereinsverantwortlicher, I want, dass sich das Logo an einer einzigen Stelle austauschen lässt, so that ein neues Logo ohne Eingriff in mehrere Dateien möglich ist.
14. As a Vereinsverantwortlicher, I want, dass die Seite weiterhin auf GitHub Pages unter ihrem Unterpfad funktioniert, so that das Logo dort auch tatsächlich erscheint.

## User Acceptance Tests

1. Given ich öffne die Startseite am Computer, when die Seite geladen ist, then sehe ich das weisse Pirates-Logo gross und zentriert hinter dem Inhalt, sehr schwach sichtbar auf dem schwarzen Hintergrund.
2. Given ich öffne nacheinander Startseite, Über uns, News, Impressum und Datenschutz, when ich jede Seite ansehe, then erscheint auf jeder dasselbe Wasserzeichen an derselben Stelle.
3. Given ich scrolle eine lange Seite nach unten, when der Inhalt sich bewegt, then bleibt das Logo an derselben Position im Fenster stehen.
4. Given die Startseite zeigt Tabellen und News, when ich die Texte lese, then sind alle Texte, Tabellenzeilen, Karten und Links gut lesbar, und das Logo stört nicht.
5. Given ich öffne die Startseite auf einem Handy (Breite 375 px), when ich die Seite ansehe, then ist das Logo vollständig sichtbar, nicht abgeschnitten, höchstens etwa 90 % der Bildschirmbreite breit und zentriert.
6. Given ich öffne eine beliebige Seite auf dem Handy, when ich die Seite bediene, then gibt es kein seitliches Scrollen, und das Scrollen verläuft flüssig.
7. Given ich klicke oder tippe an eine Stelle, an der das Logo liegt, when dort ein Link, ein Menüpunkt oder Text steht, then reagiert dieses Element normal, und das Logo fängt keine Eingabe ab.
8. Given ich nutze einen Screenreader, when ich die Seite vorlesen lasse, then wird das Wasserzeichen nicht erwähnt.
9. Given die Seite läuft auf GitHub Pages unter `/pirates-homepage/`, when ich eine Seite öffne, then wird das Logo geladen und angezeigt (keine fehlende Bilddatei, kein 404).
10. Given die Seite wird gebaut, when ich die Kopfzeile ansehe, then ist das Logo in der Kopfzeile unverändert, und Hero, Tabellen, Fusszeile und Menü sehen bis auf das Wasserzeichen aus wie vorher.

## Definition of Done

- Alle User Acceptance Tests bestehen.
- Das Wasserzeichen erscheint auf allen fünf Seiten (Startseite, Über uns, News, Impressum, Datenschutz).
- Texte, Tabellen und Karten sind am Computer (1280 px) und auf einem schmalen Handy-Fenster (375 px) gut lesbar.
- Auf dem Handy gibt es kein seitliches Scrollen.
- Die Seite baut ohne Fehler und Warnungen, und die generierte Seite ist auf GitHub Pages lauffähig (Logo wird unter dem Unterpfad geladen).
- Kein Rückschritt bei Kopfzeile, Hero, Trainingstabellen, News und Fusszeile.
- Das Logo wird nur einmal im Projekt gepflegt (die bestehende Bilddatei wird wiederverwendet).

## Out of Scope

- Farbvarianten des Logos oder ein anderes Bild als das bestehende weisse Logo.
- Helles Erscheinungsbild (die Seite ist ausschliesslich dunkel).
- Animationen, Parallax-Effekte oder Ein- und Ausblenden des Logos.
- Änderungen am Logo in der Kopfzeile, am Hero, am Menü oder am Farbschema.
- Eigene Einstellungen pro Seite (z. B. Wasserzeichen nur auf einzelnen Seiten abschalten).
- Anpassung der Druckansicht.

## Further Notes

- **Entscheidungen aus der Klärung:** Das Wasserzeichen verwendet das vorhandene weisse Logo auf transparentem Hintergrund (ca. 1334 × 1200 px). Es ist zentriert, beim Scrollen fixiert, auf allen Seiten sichtbar, mit 6 % Deckkraft und einer Höhe von etwa 70 % des Fensters. Auf dem Handy wird es vollständig und höchstens etwa 90 % der Breite gross dargestellt.
- **Lesbarkeit hat Vorrang:** Falls sich bei der Prüfung im Browser zeigt, dass 6 % Texte hinter Tabellen oder Karten beeinträchtigt, wird die Deckkraft reduziert. Der Wert ist als eine einzige Einstellung leicht änderbar zu halten.
- **Kopfzeile:** Sie ist zu 80 % schwarz hinterlegt, das Wasserzeichen scheint dort entsprechend noch schwächer durch. Das ist akzeptiert.
- **Hero:** Sollte künftig ein Hintergrundbild im Hero gesetzt werden, würde es das Wasserzeichen im Hero-Bereich überdecken. Das ist heute nicht der Fall und nicht Teil dieser Änderung.
- **Offene Änderung im Arbeitsverzeichnis:** `content/_index.md` enthält eine nicht committete Textänderung (Willkommenstext). Sie gehört nicht zu diesem Feature.

---

## Technical Annex
> Written against codebase as of: 2026-11-08 (commit 000866f)

### Architectural Decisions

**Ausgangslage (verifiziert)**
- Das Logo liegt als `assets/img/logo-pirates-white-clear.png` (weiss auf transparent, ca. 1334 × 1200 px) und wird bereits über `params.logo = "img/logo-pirates-white-clear.png"` in der Kopfzeile verwendet.
- Die Seite ist dunkel-only (`defaultAppearance = "dark"`, `autoSwitchAppearance = false`, kein Umschalter). In `assets/css/custom.css` setzt `body { background-color: #000 }` den schwarzen Hintergrund. Blowfish setzt am `<body>` zusätzlich die Klasse `dark:bg-neutral-800`, die durch die eigene Regel übersteuert wird.
- `assets/css/custom.css` wird vom Theme über `resources.Get "css/custom.css"` eingebunden (`themes/blowfish/layouts/partials/head.html`). Schriften werden dort über `../fonts/…` aus `static/fonts` geladen. Das Logo liegt dagegen unter `assets/`, ist also nicht per relativem Pfad aus dem CSS erreichbar.
- Das Theme hat eine eigene Funktion `backgroundCanvas` (fixierte Ebene, `object-cover`, mit Überlagerung). Sie wird **nicht** verwendet: Sie nutzt `defaultBackgroundImage`, das auch das Hero-Bild beeinflusst, skaliert mit `object-cover` statt `contain` und legt eine Farbüberlagerung darüber.
- Das Projekt hat bereits ein eigenes `layouts/` (`index.html`, `partials/trainingszeiten.html`). Das Theme bindet `partials/extend-head.html` ein, wenn die Datei im Projekt existiert (`head.html`, ca. Zeile 232).

**Entscheidung: reine CSS-Lösung mit fixierter Pseudo-Ebene, Logo-URL über Hugo**
- Neue Datei `layouts/partials/extend-head.html`. Sie holt das Logo mit `resources.Get` (Pfad aus `site.Params.logo`, damit der Austausch an einer Stelle erfolgt) und gibt einen kleinen `<style>`-Block aus, der die URL als CSS-Variable setzt, z. B. `:root { --watermark-url: url("<RelPermalink>"); }`. `RelPermalink` berücksichtigt den Unterpfad `/pirates-homepage/` der GitHub-Pages-Seite. Keine absoluten Pfade mit führendem `/` von Hand.
- `assets/css/custom.css` erhält eine Regel für `body::before`:
  - `content: ""; position: fixed; inset: 0; z-index: -1; pointer-events: none;`
  - `background: var(--watermark-url) center / contain no-repeat;`
  - `opacity: 0.06;`
  - Grösse: Höhe ca. 70 vh, Breite max. ca. 90 vw. Umsetzung z. B. über `inset`/`width`/`height`/`margin: auto` oder `background-size: contain` auf einer Ebene mit `height: 70vh; width: 90vw`. Zentriert mit `left: 50%; top: 50%; transform: translate(-50%, -50%)` oder `inset: 0; margin: auto`.
  - Keine `background-attachment: fixed` (unter iOS Safari problematisch). Stattdessen `position: fixed`.
- **Stapelreihenfolge prüfen:** `body` hat einen eigenen Hintergrund, der auf die Zeichenfläche (canvas) übertragen wird. Ein Pseudo-Element mit `z-index: -1` erscheint daher über dem Body-Hintergrund und unter dem Inhalt. Das ist beim Umsetzen im Browser zu bestätigen, insbesondere gegen die Elemente `#the-top`, `<header>` (80 % schwarz hinterlegt) und den `relative`-Container um `<main>`. Falls ein Stapelkontext die Ebene verdeckt oder über den Inhalt legt, ist `z-index` oder die Ebene (z. B. `html::before`) anzupassen.
- **Dekorativ:** Als Pseudo-Element ist die Ebene nicht im Accessibility-Tree (Inhalt ist leer, das Bild kommt aus dem Hintergrund). `pointer-events: none` verhindert das Abfangen von Eingaben.
- **Kein Eingriff ins Theme:** nur `layouts/partials/extend-head.html` (neu) und `assets/css/custom.css` (erweitert). Keine Änderung an `themes/blowfish/`, `hugo.toml` oder `content/`. Keine neue Bilddatei.
- **Hero-Hinweis:** `partials/home/hero.html` zeichnet nur dann ein Bild und einen Verlauf, wenn `homepageImage` oder `defaultBackgroundImage` gesetzt ist. In `hugo.toml` ist beides nicht gesetzt, daher überdeckt der Hero das Wasserzeichen heute nicht.
- Farben: keine festen Hex-Werte im neuen CSS-Block. Das Logo ist bereits weiss. Die Deckkraft ist eine einzelne Zahl, am besten als CSS-Variable (z. B. `--watermark-opacity: 0.06`) für schnelles Nachjustieren.

### Automated Testing Decisions

- **Kontext:** Statische Hugo-Seite ohne Test-Framework. Wie beim Feature `trainingstabelle-startseite` lohnt kein neues Framework für eine reine CSS-/Template-Änderung.
- **Was ein guter Test ist:** Er prüft nur das äussere Verhalten der gebauten Seite (HTML und CSS in `public/`), nicht die Template-Interna.
- **Build-Prüfung (Pflicht):** `hugo --gc --minify` endet mit Exit-Code 0 und ohne Warnungen.
- **Ausgabe-Prüfung (Shell, einmalig bei der Umsetzung), gegen die Ausgabe nach `hugo --gc --cleanDestinationDir`:**
  - Das gebaute HTML jeder der fünf Seiten enthält die gesetzte Variable mit der Logo-URL, und die URL beginnt mit dem Unterpfad (`/pirates-homepage/…`), nicht mit `/img/…`.
  - Die Logo-Datei existiert unter diesem Pfad in `public/`.
  - Das ausgelieferte CSS enthält die Regel für das Wasserzeichen mit `position: fixed`, `pointer-events: none` und `opacity: .06`.
  - `grep -nE '#[0-9a-fA-F]{3,8}\b'` im neu hinzugefügten CSS-Block findet keine Treffer.
  - `git status --porcelain themes/` liefert keine Ausgabe.
- **Manuelle Prüfung (nicht automatisierbar mit vertretbarem Aufwand):** Sichtbarkeit und Stärke, Lesbarkeit hinter Tabellen und Karten, Stapelreihenfolge, kein seitliches Scrollen bei 375 px, vollständige Darstellung des Logos auf dem Handy, Verhalten beim Scrollen, Klickbarkeit von Links über dem Logo. Prüfung im Browser über `hugo server`.
- **Kein Unit-Test und kein End-to-End-Framework** (Playwright o. ä.): Der Aufwand steht in keinem Verhältnis zum Nutzen bei einer rein dekorativen Änderung.
