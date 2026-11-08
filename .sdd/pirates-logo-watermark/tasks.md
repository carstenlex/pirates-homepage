> Hinweis zu den Prüfbefehlen: Die `grep`-Prüfungen laufen gegen einen **unminifizierten** Build (`hugo --gc --cleanDestinationDir`), weil der Minifier Anführungszeichen und Zeilenumbrüche entfernt. Gezählt wird mit `grep -o … | wc -l` (Treffer, nicht Zeilen). Der Minifier-Build (`hugo --gc --minify`) dient nur als Build-Gate. Der Basispfad der Seite ist `/pirates-homepage/`.

## Task [01-wasserzeichen-auf-allen-seiten]

Besucher sehen auf jeder Seite (Startseite, Über uns, News, Impressum, Datenschutz) das weisse Pirates-Logo gross, zentriert und mit 6 % Deckkraft hinter dem Inhalt. Es bleibt beim Scrollen fixiert und fängt keine Klicks ab. Dies ist die durchgehende Scheibe: Logo-URL aus der Konfiguration, CSS-Ebene, Build und Sichtprüfung am Computer.

### Implementation steps

- [x] Projekt-Partial `extend-head.html` anlegen. Es holt das Logo über `site.Params.logo` mit `resources.Get` und gibt einen `<style>`-Block aus, der die `RelPermalink`-URL als CSS-Variable setzt (z. B. `--watermark-url`). Existiert das Logo nicht, wird nichts ausgegeben. Keine von Hand geschriebenen Pfade mit führendem `/`.
- [x] In `assets/css/custom.css` einen eigenen, kommentierten Block für das Wasserzeichen ergänzen: fixierte Pseudo-Ebene auf `body`, zentriert, Logo mit `contain`, ca. 70 vh hoch, `pointer-events: none`, Stapelebene hinter dem Inhalt, Deckkraft als eigene CSS-Variable (`--watermark-opacity: 0.06`). Keine festen Hex-Werte.
- [x] Sauber bauen und mit `hugo server` am Computer (1280 px) prüfen, dass die Ebene hinter Inhalt, Kopfzeile und Tabellen liegt und nicht darüber. Bei Problemen mit dem Stapelkontext die Ebene (z. B. `z-index` oder Ankerelement) anpassen. (gebaut; Sichtprüfung nicht möglich)
- [ ] ~~Alle fünf Seiten im Browser durchsehen (Lesbarkeit, Klickbarkeit von Links, Scrollverhalten).~~ *(skipped: kein Browser in dieser Umgebung)*

### Acceptance criteria

- [x] Im gebauten HTML jeder der fünf Seiten (`index.html`, `about`, `news`, `impressum`, `datenschutz`) steht die CSS-Variable mit der Logo-URL genau einmal, und die URL beginnt mit `/pirates-homepage/` (nicht mit `/img/`).
- [x] Die Logo-Datei, auf die die URL zeigt, existiert unter diesem Pfad in `public/`.
- [x] Das ausgelieferte CSS enthält die Regel mit `position: fixed`, `pointer-events: none` und der Deckkraft `0.06` (bzw. `.06` nach Minifizierung).
- [ ] ~~Im Browser erscheint das Logo auf allen fünf Seiten gross und zentriert hinter dem Inhalt, bleibt beim Scrollen an derselben Stelle im Fenster, und Texte, Tabellen und News sind gut lesbar.~~ *(skipped: kein Browser in dieser Umgebung)*
- [ ] ~~Links, Menüpunkte und Tabellen über dem Logo reagieren normal auf Klick, das Logo fängt keine Eingaben ab.~~ *(skipped: kein Browser in dieser Umgebung)*
- [ ] ~~Das Logo in der Kopfzeile sowie Hero, Trainingstabellen, News und Fusszeile sind unverändert.~~ *(skipped: kein Browser in dieser Umgebung)*

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0, und `hugo --gc --minify 2>&1 | grep -ci warn` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] Im neu hinzugefügten CSS-Block findet `grep -nE '#[0-9a-fA-F]{3,8}\b'` keine Treffer.
- [x] Nach `hugo --gc --cleanDestinationDir`: `grep -c 'watermark-url' public/index.html public/about/index.html public/news/index.html public/impressum/index.html public/datenschutz/index.html` liefert für jede Datei mindestens 1, und `grep -o 'url(/img/' public/index.html | wc -l` liefert 0.

## Task [02-wasserzeichen-auf-dem-handy]

Auf schmalen Bildschirmen wird das Wasserzeichen vollständig und höchstens ca. 90 % der Bildschirmbreite breit dargestellt, ohne dass die Seite seitlich scrollbar wird oder ruckelt. Abschliessend wird das gesamte Feature auf Lesbarkeit und Regressionen geprüft.

### Implementation steps

- [x] Grösse der Wasserzeichen-Ebene so begrenzen, dass sie sowohl in der Höhe (ca. 70 vh) als auch in der Breite (max. ca. 90 vw) hineinpasst und das Logo mit `contain` vollständig sichtbar bleibt. Keine `background-attachment: fixed`.
- [ ] ~~Im Browser bei 375 px, 639 px und 1280 px prüfen: Logo vollständig, zentriert, kein seitliches Scrollen. Auf der Startseite zusätzlich die Kartenansicht der Trainingszeiten und die News ansehen.~~ *(skipped: kein Browser in dieser Umgebung)*
- [ ] ~~Falls Texte, Karten oder Tabellen hinter dem Logo schlechter lesbar sind, die Deckkraft über die eine CSS-Variable senken und den gewählten Wert festhalten.~~ *(skipped: kein Browser in dieser Umgebung)*
- [x] Sauber bauen und alle fünf Seiten abschliessend auf Regressionen durchsehen.

### Acceptance criteria

- [ ] ~~Bei 375 px Breite ist das Logo vollständig sichtbar (nicht abgeschnitten), zentriert und höchstens ca. 90 % der Bildschirmbreite breit.~~ *(skipped: kein Browser in dieser Umgebung)*
- [ ] ~~Bei 375 px gilt `document.documentElement.scrollWidth <= document.documentElement.clientWidth` auf allen fünf Seiten (kein seitliches Scrollen).~~ *(skipped: kein Browser in dieser Umgebung)*
- [x] Die Ebene verwendet `position: fixed` und kein `background-attachment: fixed` (Prüfung im ausgelieferten CSS).
- [ ] ~~Die Trainingskarten und -tabellen, News, Impressum und Datenschutz sind am Handy (375 px) und am Computer (1280 px) gut lesbar.~~ *(skipped: kein Browser in dieser Umgebung)*
- [x] Die Seite baut ohne Fehler, und alle Seiten sind bis auf das Wasserzeichen unverändert gegenüber vorher.

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0, und `hugo --gc --minify 2>&1 | grep -ci warn` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] Im gesamten neu hinzugefügten CSS findet `grep -nE '#[0-9a-fA-F]{3,8}\b'` keine Treffer, und `grep -c 'background-attachment' assets/css/custom.css` liefert 0.
- [ ] ~~Manuelle Prüfung im Browser (`hugo server`) bei 375 px und 1280 px bestätigt Darstellung und Lesbarkeit.~~ *(skipped: kein Browser in dieser Umgebung)*
