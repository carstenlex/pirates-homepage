# Trainingstabelle auf der Startseite

Feature-Slug: `trainingstabelle-startseite`

## Problem Statement

Besucherinnen und Besucher der Pirates-Homepage (Eltern, Kinder, Jugendliche, Erwachsene, Interessierte) wollen vor allem wissen, wann und wo trainiert wird. Auf der neuen Startseite gibt es dazu nichts. Es gibt nur einen Platzhaltertext und eine Platzhalter-News „Neue Trainingszeiten", die auf „genaue Angaben folgen" verweist. Die aktuellen Trainingszeiten stehen nur auf der alten Vereinsseite. Wer die neue Seite besucht, findet die wichtigste Information nicht.

## Solution

Die Startseite zeigt unterhalb des Willkommenstexts und oberhalb der letzten News zwei Tabellen:

1. **„Trainingszeiten Saison 2026/2027"** mit allen Trainings (ausser Amriswil) nach Tag, Zeit, Team/Trainer und Ort.
2. **„Amriswil – Trainingszeiten"** mit den Trainings in Amriswil und dem Hinweis, dass in den Schulferien keine offiziellen Trainings stattfinden.

Am Computer und auf breiten Bildschirmen sind das normale Tabellen. Auf dem Handy wird jede Trainingseinheit als eigene, gut lesbare Karte dargestellt. Die Platzhalter-News „Neue Trainingszeiten" entfällt, weil die Angaben jetzt direkt auf der Startseite stehen. Die Trainingszeiten werden als einfache Datei gepflegt, sodass ein Saisonwechsel keine Änderung am Seitenlayout braucht.

## User Stories

1. As a Besucher der Homepage, I want die Trainingszeiten direkt auf der Startseite zu sehen, so that ich nicht lange suchen muss.
2. As a Elternteil, I want zu sehen, an welchem Wochentag und zu welcher Uhrzeit die Gruppe meines Kindes trainiert, so that ich Hin- und Rückfahrt planen kann.
3. As a Elternteil, I want den Namen der Trainerin oder des Trainers und den Jahrgang beim Team zu sehen, so that ich die passende Gruppe für mein Kind finde.
4. As a Interessierte Person, I want zu sehen, in welcher Halle trainiert wird, so that ich weiss, wohin ich zum Schnuppertraining kommen muss.
5. As a Spielerin oder Spieler, I want mein Training mit Tag, Zeit und Ort in einer Zeile oder Karte zu finden, so that ich alle Angaben auf einen Blick habe.
6. As a Besucher mit dem Handy, I want jede Trainingseinheit als eigene Karte zu sehen, so that ich nichts seitlich scrollen oder verkleinern muss.
7. As a Besucher mit dem Handy, I want auf jeder Karte Tag und Zeit zuoberst und fett zu sehen, so that ich die wichtigste Information zuerst lese.
8. As a Besucher am Computer, I want die Trainingszeiten als übersichtliche Tabelle mit den Spalten Tag, Zeit, Team/Trainer und Ort zu sehen, so that ich die Einheiten schnell vergleichen kann.
9. As a Besucher in Amriswil, I want die Amriswil-Trainings in einer eigenen Tabelle zu finden, so that ich sie nicht zwischen den Trainings in Arbon suchen muss.
10. As a Besucher, I want den Hinweis zu sehen, dass in den Schulferien keine offiziellen Trainings stattfinden, so that ich nicht vergeblich zur Halle fahre.
11. As a Besucher, I want die Tabellen vor den letzten News zu sehen, so that die Trainingszeiten als wichtigster Inhalt nicht untergehen.
12. As a Besucher, I want die Tabellen im dunklen Pirates-Farbschema zu sehen, so that sie zum Rest der Seite passen.
13. As a Besucher, I want, dass Texte wie „U18", „4. Liga Herren" und Zeitangaben einheitlich geschrieben sind, so that die Tabellen sauber und professionell wirken.
14. As a Besucher mit Screenreader, I want, dass jede Angabe mit ihrer Spaltenbezeichnung vorgelesen wird, so that ich auch ohne Sicht auf das Layout die Zusammenhänge verstehe.
15. As a Besucher, I want einen Link zur Trainingsübersicht per Anker (z. B. `/#training`) teilen zu können, so that ich Bekannten direkt die Trainingszeiten schicken kann.
16. As a Vereinsverantwortlicher, I want die Trainingszeiten an einer einzigen Stelle in einer einfachen Datei zu pflegen, so that ich sie ohne Kenntnisse im Seitenlayout ändern kann.
17. As a Vereinsverantwortlicher, I want bei einem Saisonwechsel nur Titel und Zeilen der Datei zu ändern, so that die Darstellung unverändert bleibt.
18. As a Vereinsverantwortlicher, I want, dass die alte Platzhalter-News „Neue Trainingszeiten" entfernt ist, so that keine widersprüchlichen Angaben („genaue Angaben folgen") mehr erscheinen.
19. As a Vereinsverantwortlicher, I want, dass die übernommenen Zeiten dem Stand der Originalseite entsprechen (mit den zwei Mittwochszeilen für Amriswil nur in der Amriswil-Tabelle), so that keine doppelten oder widersprüchlichen Einträge angezeigt werden.
20. As a Trainer, I want, dass mein Training mit meinem Namen so erscheint wie auf der Originalseite, so that ich die Angaben wiedererkenne.

## User Acceptance Tests

1. Given die Startseite wird am Computer geöffnet, when ich nach unten scrolle, then sehe ich nach dem Willkommenstext und vor den letzten News zuerst den Abschnitt „Trainingszeiten Saison 2026/2027" und danach den Abschnitt „Amriswil – Trainingszeiten".
2. Given die Startseite wird in einem Fenster breiter als 640 px geöffnet, when ich die Trainingszeiten ansehe, then erscheinen beide Abschnitte als Tabelle mit den Spaltenüberschriften „Tag", „Zeit", „Team/Trainer" und „Ort".
3. Given die Startseite wird auf einem Handy (Breite unter 640 px) geöffnet, when ich die Trainingszeiten ansehe, then ist jede Trainingseinheit eine eigene Karte mit „Tag · Zeit" fett oben, darunter Team/Trainer und zuletzt der Ort mit dem Label „Ort", und es ist kein seitliches Scrollen nötig.
4. Given die Haupttabelle wird angezeigt, when ich die Zeilen zähle, then sind es 17 Zeilen, in der Reihenfolge von Montag bis Samstag.
5. Given die Haupttabelle wird angezeigt, when ich nach den Mittwochszeilen für Amriswil („U12+U14 mixed mit Coach Manuel" und „U14/U16 mit Coach Manuel") suche, then sind diese dort nicht vorhanden.
6. Given die Amriswil-Tabelle wird angezeigt, when ich die Zeilen lese, then sehe ich genau „Mi 16:30–17:45 U12 Amriswil / Training bei Manuel, Turnhalle Freiestrasse, Amriswil" und „Mi 17:45–19:00 U14 Amriswil / Training bei Manuel, Turnhalle Freiestrasse, Amriswil".
7. Given die Amriswil-Tabelle wird angezeigt, when ich darunter schaue, then steht dort der Hinweis „In den Schulferien finden keine offiziellen Trainings statt."
8. Given die Tabellen werden angezeigt, when ich die Texte prüfe, then stehen dort „U18" (nicht „U 18"), „4. Liga Herren" (ohne Sonderzeichen), Zeiten mit Halbgeviertstrich (z. B. „17:00–18:30") und keine überflüssigen Leerzeichen in Klammern.
9. Given die Tabellen werden angezeigt, when ich Orte und Trainernamen mit der Originalseite vergleiche, then sind sie unverändert, auch dort, wo „Arbon" fehlt (z. B. „Bergli", „Seegarten").
10. Given ich öffne die Adresse der Startseite mit dem Anker `#training`, when die Seite lädt, then springt der Browser zum Abschnitt der Trainingszeiten.
11. Given eine Zeile in der Datendatei wird geändert (z. B. eine neue Uhrzeit), when die Seite neu gebaut wird, then erscheint die Änderung in Tabelle und Karte, ohne dass Layout-Dateien angepasst werden müssen.
12. Given ich öffne die News-Übersicht, when ich die Einträge ansehe, then ist „Neue Trainingszeiten" nicht mehr vorhanden, und es gibt keine Verlinkung auf diese News.
13. Given ich nutze einen Screenreader, when ich eine Karte auf dem Handy lese, then wird jeder Wert mit seiner Bezeichnung (Tag, Zeit, Team/Trainer, Ort) vorgelesen.
14. Given die Startseite wird geöffnet, when ich sie mit dem Stand vorher vergleiche, then sind Hero, Willkommenstext, Kopfzeile, Fusszeile und die letzten News unverändert.

## Definition of Done

- Alle User Acceptance Tests bestehen.
- Beide Tabellen sind in der geforderten Reihenfolge auf der Startseite sichtbar, in Tabellen- und in Kartendarstellung.
- Die übernommenen Inhalte stimmen mit der Originalseite überein (abgesehen von der typografischen Bereinigung und der Entfernung der zwei Amriswil-Mittwochszeilen aus der Haupttabelle). Die Vereinsverantwortlichen haben die Zeiten einmal selbst gegen die Live-Seite geprüft.
- Die News „Neue Trainingszeiten" ist gelöscht.
- Darstellung geprüft im hellen und dunklen Erscheinungsbild des Themes (soweit aktiviert), am Computer und auf einem schmalen Handy-Fenster.
- Die Seite baut ohne Fehler und Warnungen, und die generierte Seite ist auf GitHub Pages lauffähig.
- Kein Rückschritt bei den bestehenden Seiten (Startseite, Über uns, News, Impressum, Datenschutz).
- In der Projektdokumentation ist beschrieben, wie die Trainingszeiten gepflegt werden.

## Out of Scope

- Eigene Seite „Training" oder neuer Menüpunkt. Die Datenstruktur erlaubt das später, es wird aber nicht gebaut.
- Filter, Suche oder Sortierung der Tabellen durch die Besucher.
- Änderung oder Bereinigung der Inhalte über die typografische Bereinigung hinaus (z. B. Ergänzen fehlender Ortsnamen wie „Arbon", Zusammenführen von Duplikaten, Prüfung der Trainerangaben).
- Automatische Übernahme der Daten von der alten Vereinsseite.
- Änderungen am Willkommenstext, am Hero, am Menü oder am Farbschema.
- Mehrsprachigkeit (die Seite ist nur Deutsch).
- Kalender-Export (iCal) oder Erinnerungen.
- Anmeldung zu Trainings.

## Further Notes

- **Quellenqualität:** Die Daten stammen aus der automatischen Konvertierung der Originalseite https://www.pirates-basketball.ch/de. Die Zeilengrenzen waren beim Auslesen konsistent, aber die Vereinsverantwortlichen sollten die Werte einmal selbst gegen die Live-Seite prüfen.
- **Widerspruch in der Quelle:** Die Originalseite führt die Amriswil-Trainings am Mittwoch doppelt auf, einmal in der Haupttabelle (U12+U14 mixed 16:30–19:00, U14/U16 18:00–19:00) und einmal in der Amriswil-Tabelle (U12 16:30–17:45, U14 17:45–19:00). Entscheidung: Es gilt nur die Amriswil-Tabelle.
- **Typografische Bereinigung (Entscheidung):** überflüssige Leerzeichen entfernen, „U 18" zu „U18", Halbgeviertstrich in Zeitbereichen und Jahrgangsbereichen (z. B. „2015–2016"), „4\." zu „4.", Titel „Saison 2026/2027" ohne Leerzeichen um den Schrägstrich. Inhaltlich wird nichts geändert.
- **Trainernamen:** Die Vornamen und teils Nachnamen von Trainerinnen und Trainern werden so übernommen, wie sie bereits auf der öffentlichen Vereinsseite stehen. Der Datenschutztext der neuen Seite sollte dazu nicht angepasst werden müssen. Das wäre bei Gelegenheit zu bestätigen.
- **Saisonwechsel:** Der Titel „Saison 2026/2027" steht in der Datendatei, nicht im Layout.
- **Offene Frage Kartenreihenfolge:** Die Zeilen bleiben in Quellreihenfolge. Falls die Gruppen künftig nach Team statt nach Tag gruppiert werden sollen, ist das eine eigene Änderung.

---

## Technical Annex
> Written against codebase as of: 2026-11-08 (commit e2432c7)

### Architectural Decisions

**Ausgangslage (verifiziert)**
- Hugo 0.167 (extended), Theme Blowfish als Verzeichnis `themes/blowfish`, kein eigenes `layouts/`-Verzeichnis im Projekt. Eigene CSS liegt in `assets/css/custom.css`, Farbschema `pirates` in `assets/css/schemes/`.
- `hugo.toml`: `[params.homepage] layout = "hero"`, `showRecent = true`, `showRecentItems = 3`.
- `themes/blowfish/layouts/index.html` rendert das Partial `home/hero.html` (Hero mit `.Content` aus `content/_index.md` auf Bild/Verlauf) und danach in einer `<section>` `recent-articles/main.html`.
- Der Inhalt der Startseite (`.Content`) liegt innerhalb des Hero-Blocks. Ein Shortcode in `content/_index.md` würde die Tabellen daher in den Hero-Block mit Overlay setzen und nicht zwischen Hero und News. Das passt nicht zur geforderten Reihenfolge.

**Entscheidung: Layout-Override im Projekt, kein Eingriff ins Theme**
- Neue Datei `layouts/index.html` (überschreibt `themes/blowfish/layouts/index.html`). Sie ist eine Kopie des Theme-Templates mit einer zusätzlichen Zeile `{{ partial "trainingszeiten.html" . }}` zwischen dem Homepage-Partial und der `recent-articles`-Section. Das Theme bleibt unverändert, Theme-Updates bleiben möglich. Die Kopie ist beim Theme-Update auf Änderungen am Original zu prüfen (Hinweis in der Doku).
- Neues Partial `layouts/partials/trainingszeiten.html`. Es liest `site.Data.trainingszeiten` und rendert pro Tabelle:
  - `<section class="trainingszeiten">` mit `<h2>` (Titel aus den Daten), erste Tabelle mit `id="training"` als Anker.
  - `<table>` mit `<thead>` (Tag, Zeit, Team/Trainer, Ort) und `<tbody>`; jede `<td>` erhält `data-label="Tag|Zeit|Team/Trainer|Ort"`.
  - Optionale Fussnote als `<p class="trainingszeiten-note">`.
- Alle sichtbaren Texte (Spaltenüberschriften) kommen aus der Datendatei oder dem Partial, da das Projekt-Partial nicht dem Theme-i18n-Zwang unterliegt. Das Projekt ist nur deutsch.

**Datendatei `data/trainingszeiten.yaml`**

Struktur (Entscheidung, Form wie unten):

```yaml
tabellen:
  - titel: "Trainingszeiten Saison 2026/2027"
    id: training          # optional, Anker
    zeilen:
      - { tag: "Mo", zeit: "17:00–18:30", team: "...", ort: "..." }
  - titel: "Amriswil – Trainingszeiten"
    zeilen: [...]
    hinweis: "In den Schulferien finden keine offiziellen Trainings statt."
```

Inhalt Tabelle 1 (17 Zeilen, bereinigt, Reihenfolge wie Quelle):

| Tag | Zeit | Team/Trainer | Ort |
|---|---|---|---|
| Mo | 17:00–18:30 | Basketballschule U12 mit Olivier (Jahrgänge 2015–2016) | Säntishalle, Arbon |
| Mo | 18:30–20:00 | U16 Mädchen / Training bei Hürriyet Celiksap (Jahrgänge ab 2011–2015) | Säntishalle, Arbon |
| Mo | 20:15–22:00 | 4. Liga Herren | Seegarten Turnhalle, Arbon |
| Di | 17:30–19:00 | U14 Jungs bei Ali Kilic und Miodrag Cvetkovic (Jahrgänge 2013/2014) | Reben 4 Turnhalle, Arbon |
| Di | 18:45–20:15 | U18 Jungs / Training bei Claudio (Jahrgänge 2009/2010) | Seegarten Turnhalle, Arbon |
| Di | 20:15–21:45 | U22 Mädchen bei Georg | Seegarten |
| Mi | 17:00–18:30 | Basketballschule U12 mit Olivier (Jahrgänge 2015–2016) | Seegarten Turnhalle, Arbon |
| Mi | 18:30–20:00 | U16 Jungs / Training bei Sasa (Jahrgänge 2011/2012) | Seegarten, Arbon |
| Mi | 20:15–22:00 | 4. Liga Herren | Seegarten Turnhalle, Arbon |
| Mi | 20:15–21:45 | Just4Fun / Veteranen / Plausch bei Georg | ABC-Sporthalle Stacherholz, Arbon |
| Do | 20:30–21:45 | U18 Jungs / Training bei Carsten (Jahrgänge 2009/2010) | ABC Sporthalle Stacherholz, Arbon |
| Do | 20:30–21:45 | U22 Mädchen bei Georg | ABC Sporthalle Stacherholz, Arbon |
| Fr | 17:30–19:00 | U16 Jungs / Training bei Sasa (Jahrgänge 2011/2012) | Reben 4 Turnhalle, Arbon |
| Fr | 17:30–19:00 | U14 Jungs / Training bei Ali und Mio (Jahrgänge 2013/2014) | Bergli |
| Fr | 17:30–19:00 | U16 Mädchen bei Hürriyet (Jahrgänge 2011/2012/2013/2014) | Untere Stacherholz, Arbon |
| Sa | 09:30–10:30 | Basketballschule U8 mit Olivier (Jahrgänge 2019–2020) | Seegarten Turnhalle, Arbon |
| Sa | 10:30–12:00 | Basketballschule U10 mit Olivier (Jahrgänge 2017–2018) | Seegarten, Arbon |

Inhalt Tabelle 2 (2 Zeilen):

| Tag | Zeit | Team/Trainer | Ort |
|---|---|---|---|
| Mi | 16:30–17:45 | U12 Amriswil / Training bei Manuel | Turnhalle Freiestrasse, Amriswil |
| Mi | 17:45–19:00 | U14 Amriswil / Training bei Manuel | Turnhalle Freiestrasse, Amriswil |

Hinweis darunter: „In den Schulferien finden keine offiziellen Trainings statt."

**Responsive Darstellung (nur CSS, in `assets/css/custom.css`)**
- Umschaltpunkt 640 px (`@media (max-width: 639.98px)`), passend zum Tailwind-Breakpoint `sm`. Der Theme-Stylesheet `assets/css/compiled/main.css` ist vorkompiliert. Neue Tailwind-Klassen in Projekt-Templates würden dort fehlen, deshalb werden eigene Klassen (`.trainingszeiten …`) in `custom.css` definiert, ohne Tailwind-Build.
- Mobile: `thead` visuell versteckt (`position: absolute; clip`, nicht `display: none`, damit Screenreader die Überschriften behalten), `table, tbody, tr, td { display: block }`, `tr` als Karte (Rand, Radius, Innenabstand, Abstand nach unten).
  - Erste Zeile der Karte: Tag und Zeit zusammen fett. Realisierung: `td[data-label="Tag"]` und `td[data-label="Zeit"]` als `display: inline`, mit Trennzeichen „ · " per `::after` am Tag. Team/Trainer als Fliesstext. Ort mit `::before { content: attr(data-label) ": " }` als kleines Label „Ort".
  - Hinweis: Wenn `display: block` auf `table`/`tr`/`td` gesetzt wird, können Screenreader die Tabellensemantik verlieren. Zur Absicherung `role="table"`, `role="row"`, `role="cell"` und `role="columnheader"` im Markup setzen (bekanntes Muster).
- Desktop: normale Tabelle, volle Breite des Inhaltsbereichs, Kopfzeile abgesetzt, dezente Zeilentrennung. Farben aus den Theme-Variablen des Schemas `pirates` (`--color-primary-*`, `--color-neutral-*`, wie in `assets/css/schemes/pirates.css` definiert), keine festen Hex-Werte, soweit möglich.
- Abstände und Breite sollen zum Hero-Block passen (`max-w-7xl`-Container des Themes). Wrapper-Container im Partial entsprechend.

**Anker**
- `id="training"` auf der Überschrift/Section der ersten Tabelle. Über die Link-Syntax `/#training` erreichbar. Kein Menüeintrag.

**Inhalte löschen**
- `content/news/trainingszeiten.md` löschen. Im Repo auf Verweise darauf prüfen (`Grep` nach „trainingszeiten"). `public/` und `resources/` enthalten generierte Ausgaben. Sie sind beim nächsten Build zu regenerieren und nicht von Hand zu ändern (vorher prüfen, ob `public/` versioniert ist).
- `content/_index.md` bleibt unverändert.

**Nicht ändern**
- Alles unter `themes/blowfish/` (Theme-Update-Fähigkeit).
- `hugo.toml`: voraussichtlich keine Änderung nötig. Ein Aufbau in `layouts/index.html` genügt.

### Automated Testing Decisions

- **Kontext:** Das Projekt ist eine statische Hugo-Seite ohne Test-Framework und ohne Build-Skripte für Tests. Es gibt keine vorhandenen automatisierten Tests als Vorbild. Hier lohnt kein neues Test-Framework für ein einzelnes Partial.
- **Was ein guter Test ist:** Er prüft nur das äussere Verhalten der gebauten Seite (HTML-Ausgabe), nicht die Template-Interna.
- **Build-Prüfung (automatisch, Pflicht):** `hugo --gc --minify` (bzw. wie das Projekt es bereits baut) läuft ohne Fehler und ohne Warnungen. Das fängt Fehler im Template und eine fehlerhafte YAML-Datei.
- **Ausgabe-Prüfung (leichtgewichtig, als Shell-Prüfung gegen `public/index.html`, einmalig bei der Umsetzung):**
  - Der Abschnitt mit `id="training"` ist vorhanden.
  - Es gibt zwei `<table>`-Elemente, 17 plus 2 `<tr>` im `tbody`.
  - Die Reihenfolge im HTML ist Hero → Trainingszeiten → letzte News.
  - Der Text „In den Schulferien finden keine offiziellen Trainings statt." ist vorhanden.
  - Die Strings „U 18" und „4\." kommen nicht vor.
  - `public/news/trainingszeiten/` existiert nicht mehr.
  Diese Prüfung kann als kleines Skript im Repo oder nur als Check bei der Umsetzung laufen. Ein dauerhaftes Skript wird nicht verlangt.
- **Manuelle Prüfung (nicht automatisierbar mit vertretbarem Aufwand):** Kartendarstellung bei Breite unter 640 px, Tabellendarstellung darüber, helles und dunkles Erscheinungsbild und Screenreader-Verhalten gemäss den User Acceptance Tests. Prüfung im Browser über `hugo server` (z. B. mit dem Skill `run`).
- **Kein Unit-Test** für das Partial und kein End-to-End-Framework (Playwright o. ä.): Der Aufwand steht in keinem Verhältnis zum Nutzen bei einer rein statischen, seltenen Änderung.
