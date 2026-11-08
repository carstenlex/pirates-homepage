> Hinweis zu den Prüfbefehlen: Die `grep`-Prüfungen laufen gegen einen **unminifizierten** Build (`hugo --gc --cleanDestinationDir`), weil der Minifier Anführungszeichen und Zeilenumbrüche entfernt. Gezählt wird mit `grep -o … | wc -l` (Treffer, nicht Zeilen). Der Basispfad der Seite ist `/pirates-homepage/`. Alle Befehle werden im Projektverzeichnis ausgeführt.
>
> Reihenfolge je Task: zuerst der unminifizierte Build und die `grep`-Prüfungen, danach das Build-Gate. Das Build-Gate läuft als `hugo --gc --minify > build.log 2>&1; echo $?` (muss `0` ausgeben), danach `grep -ci warn build.log` (muss `0` liefern; `grep` endet dabei mit Exit-Code 1, das ist erwartet).

## Task [01-kontakt-seite-im-menue]

Besucher finden im Hauptmenü (Computer und Handy) die Einträge Home, Über uns und Kontakt, aber keinen Eintrag «News» mehr. «Kontakt» führt zur neuen Seite `/kontakt/` mit Vereinsadresse, E-Mail, Ansprechperson samt Telefonnummer und den fünf Trainingshallen (Strassenadressen als Platzhalter).

### Implementation steps

- [x] Neue Seite `kontakt` mit Titel «Kontakt» und Adresse `/kontakt/` anlegen (analog zu «Über uns» und «Impressum»), mit den Abschnitten Vereinsadresse (Basketball Oberthurgau Pirates, Tennisstrasse 12, 9320 Arbon), E-Mail als `mailto:`-Link (info@pirates-basketball.ch), Ansprechperson (Carsten Lex, Präsident, Mobil 079 943 15 56 als `tel:+41799431556`-Link) und Trainingshallen.
- [x] Im Abschnitt Trainingshallen die fünf Hallen auflisten: Säntishalle, Seegarten Turnhalle, Reben 4 Turnhalle, ABC-Sporthalle Stacherholz (alle Arbon) und Turnhalle Freiestrasse (Amriswil), jeweils mit sichtbarem Platzhalter «Adresse folgt».
- [x] Im Hauptmenü den Eintrag «News» entfernen bzw. auskommentieren (mit Hinweis, dass er vorübergehend ausgeblendet ist) und einen Eintrag «Kontakt» mit Verweis auf die neue Seite ergänzen. Reihenfolge: Home, Über uns, Kontakt. Das Fussmenü bleibt unverändert.
- [ ] ~~Sauber bauen und mit `hugo server` Menü (Computer und Handy) sowie die Kontaktseite ansehen.~~ *(skipped: Build sauber ausgeführt; Browseransicht nicht möglich in dieser Umgebung)*

### Acceptance criteria

- [x] `public/kontakt/index.html` existiert und enthält `mailto:info@pirates-basketball.ch`, `tel:+41799431556`, «Tennisstrasse 12», «Carsten Lex» sowie alle fünf Hallennamen, und `grep -o 'Adresse folgt' public/kontakt/index.html | wc -l` liefert 5.
- [x] In `public/index.html` verweist das Hauptmenü auf `/pirates-homepage/about/` und `/pirates-homepage/kontakt/`, und die Menü-Reihenfolge ist Home, Über uns, Kontakt.
- [x] `grep -o 'pirates-homepage/news/' public/kontakt/index.html | wc -l` liefert 0 (die Kontaktseite hat keinen News-Block, also steht der Menüeintrag nicht mehr drin). Auf der Startseite verweist der News-Block bis Task 02 weiterhin auf `/news/`, das ist hier ausgenommen.
- [x] `public/news/index.html` existiert weiterhin, und die News-Beiträge sind unverändert.
- [x] `public/kontakt/index.html` enthält je mindestens einen Link auf `pirates-homepage/impressum/` und `pirates-homepage/datenschutz/` (Fusszeile).
- [x] E-Mail-Adresse und Vereinsadresse stimmen mit dem Impressum überein: `grep -c 'info@pirates-basketball.ch' content/impressum.md` und `grep -c 'Tennisstrasse 12' content/impressum.md` liefern je mindestens 1.
- [ ] ~~Im Browser öffnet «Kontakt» (Computer und Handy, 375 px) die Seite mit der Überschrift «Kontakt», und die Platzhalter sind sichtbar.~~ *(skipped: Browser nicht verfügbar)*

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] `git diff --stat -- content/news/ content/about.md data/ layouts/partials/` liefert keine Ausgabe.

## Task [02-news-von-startseite-ausblenden]

Die Startseite zeigt nach den Trainingszeiten keine News-Vorschau und keinen «Zeige Mehr»-Link mehr. Die Seite `/news/` und alle Beiträge bleiben gebaut und per direkter Adresse erreichbar. Das Wiedereinschalten soll an einer einzigen Stelle möglich sein.

### Implementation steps

- [x] Im Startseiten-Template den Block mit der News-Vorschau (Abschnitt `recent-articles`) mit einem Hugo-Kommentar deaktivieren, samt kurzem Hinweis, dass die News vorübergehend ausgeblendet sind.
- [x] Prüfen, dass das Hero-Layout selbst keine News ausgibt (die Parameter `showRecent` und `showMoreLink` wirken nur im News-Block); die Parameter bleiben unverändert.
- [ ] ~~Sauber bauen und die Startseite im Browser (1280 px und 375 px) prüfen: Hero, Trainingszeiten, Fusszeile und Wasserzeichen unverändert.~~ *(skipped: Build sauber ausgeführt; Browseransicht nicht möglich in dieser Umgebung)*

### Acceptance criteria

- [x] `grep -c 'Zeige Mehr' public/index.html` und `grep -c 'Neue Beiträge' public/index.html` liefern je 0 (beides stammt aus dem News-Block), und `grep -o 'pirates-homepage/news/' public/index.html | wc -l` liefert 0.
- [x] `grep -c 'Saisonstart bei den Pirates' public/index.html` liefert 0.
- [x] `public/news/index.html` und die Seite des Beitrags «Saisonstart bei den Pirates» existieren weiterhin.
- [ ] ~~Die Trainingszeiten (Tabellen am Computer, Karten am Handy) und der Hero auf der Startseite sind im Browser unverändert.~~ *(skipped: Browser nicht verfügbar)*
- [x] `git diff -- hugo.toml` zeigt in dieser Task keine Änderung an den Startseiten-Parametern (Layout `hero`).

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] `git diff --stat -- content/news/` liefert keine Ausgabe.

## Task [03-kopfzeile-groesseres-logo-und-titel]

Logo und Schriftzug «Pirates Basketball» in der Kopfzeile erscheinen grösser (Logo ca. 1.5-fach, Titel ca. 1.25-fach) auf allen Seiten, am Computer wie am Handy. Die Faktoren stehen als CSS-Variablen an einer Stelle. Auf dem Handy bleiben Logo, Titel und Menü-Knopf in einer Zeile ohne seitliches Scrollen. Leiste, Farben und Wasserzeichen bleiben unverändert.

### Implementation steps

- [x] Im eigenen CSS einen kommentierten Block für die Kopfzeile ergänzen (Kommentarmarken «Kopfzeile: Logo und Titel» am Anfang und «Ende Kopfzeile» am Schluss), mit den Variablen `--header-logo-scale: 1.5` und `--header-title-scale: 1.25`, der die Höchstgrösse des Logos (Theme-Vorgabe 5 rem) und die Schriftgrösse des Titels damit skaliert. Keine festen Hex-Werte, keine Änderung im Theme.
- [x] Bei Spezifitätsproblemen die Regeln anpassen (nur als Rückfallebene ein Projekt-Override des Kopfzeilen-Partials). (nicht nötig)
- [x] Auf schmalen Bildschirmen die Skalierung so begrenzen, dass Logo, Titel und Menü-Knopf in einer Zeile bleiben (Titel darf notfalls abgeschnitten werden, nicht umbrechen).
- [ ] ~~Im Browser auf allen fünf Seiten (Start, Über uns, Kontakt, Impressum, Datenschutz) bei 375 px, 639 px und 1280 px prüfen. Faktoren bei Bedarf über die Variablen nachstellen und den gewählten Wert festhalten.~~ *(skipped: Browser nicht verfügbar)*

### Acceptance criteria

- [x] In `assets/css/custom.css` stehen `--header-logo-scale: 1.5` und `--header-title-scale: 1.25`, und beide werden in Regeln für Logo bzw. Titel der Kopfzeile per `var(...)` verwendet (`grep -n 'header-logo-scale\|header-title-scale' assets/css/custom.css`).
- [ ] ~~Am Computer (1280 px) ist das Logo höher als vorher (ca. 1.5-fach): `getComputedStyle(document.querySelector('header img.logo')).maxHeight` liefert `120px` (7.5 rem statt 5 rem), und die Schriftgrösse des Titel-Links beträgt `20px` statt `16px`.~~ *(skipped: Browser nicht verfügbar)*
- [ ] ~~Bei 375 px stehen Logo, Titel und Menü-Knopf in einer Zeile, und `document.documentElement.scrollWidth <= document.documentElement.clientWidth` gilt auf allen fünf Seiten.~~ *(skipped: Browser nicht verfügbar)*
- [ ] ~~Die halbtransparente schwarze Leiste, das Wasserzeichen, die Menü-Einträge (Home, Über uns, Kontakt) und die Fusszeile sind unverändert.~~ *(skipped: Browser nicht verfügbar)*
- [ ] ~~Die Kopfzeile bleibt auf allen fünf Seiten gut lesbar, und das Menü (auch aufgeklappt auf dem Handy) ist bedienbar.~~ *(skipped: Browser nicht verfügbar)*

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] Im neuen Kopfzeilen-Block findet `awk '/Kopfzeile: Logo und Titel/,/Ende Kopfzeile/' assets/css/custom.css | grep -nE '#[0-9a-fA-F]{3,8}\b'` keine Treffer.
- [x] `git diff --stat -- content/about.md layouts/partials/extend-head.html layouts/partials/trainingszeiten.html data/` liefert keine Ausgabe.
- [ ] ~~Manuelle Prüfung im Browser (`hugo server`) bei 375 px und 1280 px bestätigt Darstellung und Lesbarkeit.~~ *(skipped: Browser nicht verfügbar)*
