> Hinweis zu den Prüfbefehlen: Die `grep`-Prüfungen laufen gegen einen **unminifizierten** Build (`hugo --gc --cleanDestinationDir`), weil der Minifier Anführungszeichen und Zeilenumbrüche entfernt. Gezählt wird mit `grep -o … | wc -l` (Treffer, nicht Zeilen). Der Minifier-Build (`hugo --gc --minify`) dient nur als Build-Gate.

## Task [01-haupttabelle-auf-startseite]

Besucher sehen auf der Startseite zwischen Willkommenstext (Hero) und den letzten News den Abschnitt „Trainingszeiten Saison 2026/2027" als Tabelle mit den Spalten Tag, Zeit, Team/Trainer und Ort. Die Daten kommen aus einer YAML-Datei, die Seite ist über den Anker `#training` erreichbar. Dies ist die erste durchgehende Scheibe: Daten, Template-Override, Partial, Basis-Styling und Build.

### Implementation steps

- [x] Datendatei mit der Struktur `tabellen[] { titel, id?, zeilen[] { tag, zeit, team, ort }, hinweis? }` anlegen und die 17 bereinigten Zeilen der Haupttabelle aus dem Technical Annex übernehmen (nur Tabelle 1, Titel „Trainingszeiten Saison 2026/2027", `id: training`).
- [x] Projekt-Layout `index.html` als Kopie des Theme-Templates anlegen und zwischen Homepage-Partial und `recent-articles`-Section genau eine Zeile für das neue Partial einfügen. Theme-Dateien bleiben unverändert.
- [x] Partial schreiben, das pro Tabelle Section, Überschrift, `<table>` mit `thead`/`tbody` und `data-label` an jeder Datenzelle rendert. Die `id` der ersten Tabelle wird als Anker gesetzt. Keine absoluten Links mit führendem `/` (die Seite läuft unter dem Unterpfad `/pirates-homepage/`).
- [x] Basis-Styling der Desktop-Tabelle (Kopfzeile abgesetzt, Zeilentrennung, volle Breite, Farben nur über die Variablen des Schemas „pirates", keine festen Hex-Werte) in die eigene CSS-Datei des Projekts.
- [x] Build ausgeführt; Browser-Ansicht (`hugo server`) nicht möglich in dieser Umgebung.

### Acceptance criteria

- [x] Im gebauten HTML der Startseite steht die Überschrift „Trainingszeiten Saison 2026/2027" nach dem Hero-Inhalt und vor der Section mit den letzten News (Reihenfolge der Zeichenpositionen prüfbar, z. B. mit `grep -ob`).
- [x] Die Tabelle hat die Spaltenüberschriften „Tag", „Zeit", „Team/Trainer", „Ort" und genau 17 Zeilen in `tbody` (18 `<tr`-Treffer inklusive Kopfzeile, 68 `data-label`-Zellen), in der Reihenfolge Montag bis Samstag.
- [x] Die 17 Zeilen stimmen Zelle für Zelle mit der Tabelle im Technical Annex überein, inklusive der Orte ohne „Arbon" („Seegarten", „Bergli") und der Zeile „U22 Mädchen bei Georg". Die beiden Amriswil-Mittwochseinträge („U12+U14 mixed", „U14/U16 mit Coach Manuel") kommen nicht vor.
- [x] Die Texte sind typografisch bereinigt: kein „U 18", kein „4\.", keine Leerzeichen direkt nach „(" oder vor „)", Zeiten und Jahrgangsbereiche mit Halbgeviertstrich, Titel ohne Leerzeichen um den Schrägstrich.
- [ ] ~~Es gibt ein Element mit der `id` `training`, und der Aufruf der Startseite mit `#training` springt im Browser zum Abschnitt. Das Partial enthält keine Links oder Asset-Pfade mit führendem `/`.~~ *(skipped: Sprung im Browser nicht prüfbar; id="training" im HTML vorhanden, keine führenden Slashes)*
- [x] Eine geänderte Uhrzeit in der YAML-Datei erscheint nach Neubau, ohne dass Layout-Dateien angepasst werden müssen.
- [x] Hero, Willkommenstext, Kopfzeile, Fusszeile und die Section der letzten News sind in Struktur und Inhalt unverändert.

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0, und `hugo --gc --minify 2>&1 | grep -ci warn` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] `diff layouts/index.html themes/blowfish/layouts/index.html` zeigt nur die eine eingefügte Partial-Zeile.
- [x] Nach `hugo --gc --cleanDestinationDir`: `grep -o '<tr[ >]' public/index.html | wc -l` liefert 18, `grep -o 'data-label=' public/index.html | wc -l` liefert 68, und `grep -cF 'U 18' public/index.html` sowie `grep -cF '4\.' public/index.html` liefern 0.
- [x] Im neu eingefügten CSS-Block findet `grep -nE '#[0-9a-fA-F]{3,8}\b'` keine Treffer.

## Task [02-amriswil-tabelle-mit-hinweis]

Unter der Haupttabelle erscheint der Abschnitt „Amriswil – Trainingszeiten" mit den zwei Mittwochs-Trainings in Amriswil und dem Hinweis auf die Schulferien. Das Partial kann damit mehrere Tabellen und einen optionalen Hinweis darstellen.

### Implementation steps

- [x] Zweite Tabelle (Titel „Amriswil – Trainingszeiten", 2 Zeilen, `hinweis`) in die Datendatei aufnehmen.
- [x] Partial um die Ausgabe des Hinweises als Absatz unter der Tabelle erweitern. Ohne `hinweis` wird nichts ausgegeben. Beide Tabellen erhalten dasselbe Styling.
- [x] Build ausgeführt; Reihenfolge per Zeichenpositionen geprüft (Browser nicht verfügbar).

### Acceptance criteria

- [x] Im gebauten HTML stehen die Überschriften in der Reihenfolge Hero, „Trainingszeiten Saison 2026/2027", „Amriswil – Trainingszeiten", letzte News (Zeichenpositionen prüfbar).
- [x] Die Amriswil-Tabelle enthält genau „Mi 16:30–17:45 U12 Amriswil / Training bei Manuel, Turnhalle Freiestrasse, Amriswil" und „Mi 17:45–19:00 U14 Amriswil / Training bei Manuel, Turnhalle Freiestrasse, Amriswil".
- [x] Unter der Amriswil-Tabelle steht der Text „In den Schulferien finden keine offiziellen Trainings statt." genau einmal.
- [x] Die Haupttabelle hat weiterhin 17 Datenzeilen und kein Hinweis-Absatz erscheint unter ihr.
- [ ] ~~Beide Tabellen sind gleich gestaltet und im Browser im hellen und dunklen Erscheinungsbild lesbar.~~ *(skipped: Browser nicht verfügbar; gleiche CSS-Klassen für beide Tabellen)*

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0, und `hugo --gc --minify 2>&1 | grep -ci warn` liefert 0.
- [x] Nach `hugo --gc --cleanDestinationDir`: `grep -o 'In den Schulferien finden keine offiziellen Trainings statt\.' public/index.html | wc -l` liefert 1, und `grep -o '<tr[ >]' public/index.html | wc -l` liefert 21.

## Task [03-karten-ansicht-handy]

Auf Bildschirmen schmaler als 640 px erscheint jede Trainingseinheit beider Tabellen als eigene Karte: „Tag · Zeit" fett oben, darunter Team/Trainer, zuletzt der Ort mit dem Label „Ort". Ab 640 px bleibt die Tabelle. Die Tabellensemantik bleibt für Screenreader erhalten.

### Implementation steps

- [x] CSS für `max-width: 639.98px`: Tabellenelemente als Blöcke, Kopfzeile visuell versteckt (nicht `display: none`), Zeile als Karte mit Rand, Radius und Abstand.
- [x] Karteninhalt: Tag und Zeit als erste fette Zeile mit Trenner „ · ", Team/Trainer als Text, Ort mit Label aus `data-label`.
- [x] Im Partial `role`-Attribute ergänzen: `table` auf der Tabelle, `rowgroup` auf `thead` und `tbody`, `row` auf `tr`, `columnheader` auf `th`, `cell` auf `td`.
- [ ] ~~Ansicht im Browser bei 375 px, 639 px und 640 px sowie im hellen und dunklen Erscheinungsbild prüfen.~~ *(skipped: Browser nicht verfügbar)*

### Acceptance criteria

- [ ] ~~Bei 375 px Breite zeigt jede der 19 Trainingseinheiten eine Karte, und `document.documentElement.scrollWidth <= document.documentElement.clientWidth` gilt (kein horizontales Scrollen der Seite).~~ *(skipped: Browser nicht verfügbar)*
- [ ] ~~Jede Karte zeigt „Tag · Zeit" fett zuoberst, darunter Team/Trainer, darunter „Ort: …".~~ *(skipped: Browser nicht verfügbar; CSS implementiert)*
- [ ] ~~Bei 639 px erscheinen Karten, bei 640 px erscheint die normale Tabelle mit sichtbarer Kopfzeile.~~ *(skipped: Browser nicht verfügbar; Media-Query max-width 639.98px)*
- [ ] ~~Die Kopfzeile bleibt im DOM und ist auf dem Handy nicht per `display: none` versteckt. Der Accessibility-Tree zeigt 4 `columnheader` pro Tabelle und `cell`-Elemente für alle Datenzellen.~~ *(skipped: Accessibility-Tree nicht prüfbar; thead per clip versteckt, 8 columnheader und 76 cell im HTML)*
- [x] Im gebauten HTML hat jede der 76 Datenzellen ein `data-label`, und `table`, `thead`/`tbody`, `tr`, `th` und `td` tragen die oben genannten `role`-Attribute.
- [ ] ~~Der Ferien-Hinweis ist auf dem Handy sichtbar, und Karten wie Tabellen sind im hellen und dunklen Erscheinungsbild lesbar.~~ *(skipped: Browser nicht verfügbar)*

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0, und `hugo --gc --minify 2>&1 | grep -ci warn` liefert 0.
- [x] Nach `hugo --gc --cleanDestinationDir`: `grep -o 'data-label=' public/index.html | wc -l` liefert 76.
- [x] Im gesamten neu hinzugefügten CSS findet `grep -nE '#[0-9a-fA-F]{3,8}\b'` keine Treffer.
- [ ] ~~Manuelle Prüfung im Browser (`hugo server`) bei 375 px und 1280 px bestätigt Karten- und Tabellenansicht.~~ *(skipped: Browser nicht verfügbar)*

## Task [04-platzhalter-news-entfernen-und-doku]

Die Platzhalter-News „Neue Trainingszeiten" wird gelöscht, und die Pflege der Trainingszeiten wird dokumentiert, damit der Saisonwechsel ohne Layout-Kenntnisse möglich ist. Abschliessend wird die gesamte Seite auf Regressionen geprüft, und die Vereinsverantwortlichen bestätigen die übernommenen Zeiten.

### Implementation steps

- [x] Die News-Datei „Neue Trainingszeiten" löschen und im Projekt (Inhalt, `hugo.toml`, Menüs) per Suche prüfen, dass nirgends auf sie verwiesen wird.
- [x] In `README.md` beschreiben: Datei und Struktur der Trainingszeiten (einschliesslich der Felder `id` und `hinweis`), Ablauf beim Saisonwechsel, Hinweis auf den Layout-Override und dass er bei Theme-Updates mit dem Original verglichen werden muss.
- [ ] ~~Gesamte Seite sauber bauen und alle Seiten im Browser durchsehen.~~ *(skipped: Browser nicht verfügbar; Build sauber, alle 5 Seiten generiert)*
- [ ] ~~Die Vereinsverantwortlichen bitten, die Zeiten gegen die Live-Seite zu prüfen.~~ *(skipped: manuelle Bestätigung durch Menschen nötig)*

### Acceptance criteria

- [x] Nach einem sauberen Build existiert `public/news/trainingszeiten` nicht, und die News „Neue Trainingszeiten" erscheint weder auf der Startseite noch in der News-Übersicht. Von den übrigen News verschwindet nichts.
- [x] Im Projekt (Inhalt, `hugo.toml`, Menüs) gibt es keinen Verweis auf `news/trainingszeiten`.
- [x] `README.md` erklärt, wie Zeilen geändert oder hinzugefügt werden und wie eine neue Saison angelegt wird, und nennt die Felder `id` und `hinweis`.
- [x] `README.md` erwähnt den Layout-Override und den Hinweis für Theme-Updates.
- [x] Startseite, Über uns, News, Impressum und Datenschutz bauen und werden bis auf die entfernte News und die neuen Tabellen unverändert angezeigt.
- [ ] ~~Ein Vereinsverantwortlicher hat bestätigt, dass die Zeiten mit der Live-Seite übereinstimmen.~~ *(skipped: Bestätigung durch Menschen ausstehend)*

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0, und `hugo --gc --minify 2>&1 | grep -ci warn` liefert 0.
- [x] Nach `hugo --gc --cleanDestinationDir`: `test ! -e public/news/trainingszeiten` ist erfolgreich.
- [x] `grep -rn 'news/trainingszeiten' content hugo.toml layouts` findet keine Treffer.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
