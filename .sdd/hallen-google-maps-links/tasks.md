> Hinweis zu den Prüfbefehlen: Die `grep`-Prüfungen laufen gegen einen **unminifizierten** Build (`hugo --gc --cleanDestinationDir`), weil der Minifier Anführungszeichen entfernt. Gezählt wird mit `grep -o … | wc -l` (Treffer, nicht Zeilen). Alle Befehle werden im Projektverzeichnis ausgeführt.
>
> Reihenfolge je Task: zuerst der unminifizierte Build und die `grep`-Prüfungen, danach das Build-Gate. Das Build-Gate läuft als `hugo --gc --minify > build.log 2>&1; echo $?` (muss `0` ausgeben), danach `grep -ci warn build.log` (muss `0` liefern; `grep` endet dabei mit Exit-Code 1, das ist erwartet). `build.log` darf nicht committet werden.
>
> Maps-Link-Form (überall gleich): `https://www.google.com/maps/search/?api=1&query=<Strasse+Nr>%2C+<PLZ>+<Ort>`, z. B. `…query=Römerstrasse+15%2C+9320+Arbon`. Arbon hat 9320, Amriswil 8580.


Auf der Kontaktseite stehen sieben Trainingshallen (neu: Bergli, Römerstrasse 15). Die Strassenadresse jeder Halle ist ein Link, der Google Maps in einem neuen Tab öffnet. Die Vereinsadresse bleibt reiner Text.

### Implementation steps

- [x] Im Abschnitt «Trainingshallen» von `content/kontakt.md` den Eintrag «Bergli, Arbon: Römerstrasse 15» als siebten ergänzen.
- [x] Jede der sieben Strassenadressen als Markdown-Link auf die Maps-Suche (Form siehe Hinweis oben) setzen. Der Hallenname bleibt fett und ohne Link, die Vereinsadresse unverändert.
- [x] Sauber bauen und prüfen, dass das Theme `target="_blank" rel="noreferrer"` an den Links ausgibt (kein `#ZgotmplZ`).
- [ ] ~~Mit `hugo server` die Kontaktseite am Computer und bei 375 px ansehen.~~ *(skipped: Browser nicht verfügbar, manuell prüfen)*

### Acceptance criteria

- [x] `grep -o 'google.com/maps/search' public/kontakt/index.html | wc -l` liefert 7, und `grep -o 'ZgotmplZ' public/kontakt/index.html | wc -l` liefert 0.
- [x] Jeder der sieben Maps-Links hat `target="_blank"`: `grep -o 'href="https://www.google.com/maps/search[^>]*target="_blank"' public/kontakt/index.html | wc -l` liefert 7.
- [x] Die sieben Link-Ziele sind verschieden: `grep -o 'query=[^"&]*' public/kontakt/index.html | sort -u | wc -l` liefert 7, und sie enthalten u. a. `Thomas-Bornhauserstrasse+14%2C+9320+Arbon`, `Stacherholzstrasse+34%2C+9320+Arbon`, `Stacherholzstrasse+38%2C+9320+Arbon`, `R%C3%B6merstrasse+15%2C+9320+Arbon` (Umlaut-Kodierung darf abweichen, `Römerstrasse` genügt) und `Freiestrasse+32%2C+8580+Amriswil`.
- [x] Die Seite nennt «Bergli» und «Römerstrasse 15» im sichtbaren Text, und alle sieben Hallennamen stehen auf der Seite.
- [x] Die Vereinsadresse ist kein Link: `grep -o 'maps[^>]*>Tennisstrasse' public/kontakt/index.html | wc -l` liefert 0, `mailto:info@pirates-basketball.ch` und `tel:+41799431556` sind weiterhin vorhanden.
- [ ] ~~Im Browser öffnet ein Klick auf eine Adresse Google Maps in einem neuen Tab, und die Links sind als Links erkennbar (Computer und 375 px).~~ *(skipped: Browser nicht verfügbar, manuell prüfen)*

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] `git diff --stat -- hugo.toml layouts/ assets/ data/ content/impressum.md content/datenschutz.md` liefert keine Ausgabe.

## Task [02-trainingstabelle-hallen-mit-maps-links]

In der Trainingstabelle auf der Startseite ist in jeder Zeile der Hallenname in der Spalte «Ort» ein Link auf Google Maps (neuer Tab). Die Hallen kommen aus einer zentralen Datei `data/hallen.yaml` und heissen auf der ganzen Seite einheitlich. «Bergli» ist enthalten. Computer-Tabelle und Handy-Karten bleiben optisch unverändert.

### Implementation steps

- [x] `data/hallen.yaml` anlegen mit den Schlüsseln `saentishalle`, `seegarten`, `reben4`, `abc-stacherholz`, `stacherholz-unten`, `bergli`, `freiestrasse`, je mit `name`, `strasse`, `plz`, `ort` (Adressen wie auf der Kontaktseite; Bergli: Römerstrasse 15, 9320 Arbon).
- [x] In `data/trainingszeiten.yaml` das Feld `ort` jeder der 19 Zeilen durch `halle: <schluessel>` ersetzen (Zuordnung: «Seegarten», «Seegarten, Arbon», «Seegarten Turnhalle, Arbon» → `seegarten`; «ABC-Sporthalle…» und «ABC Sporthalle…» → `abc-stacherholz`; «Untere Stacherholz, Arbon» → `stacherholz-unten`; «Bergli» → `bergli`; übrige entsprechend).
- [x] Im Partial der Trainingszeiten die Spalte «Ort» so ausgeben, dass der Schlüssel in `hallen.yaml` aufgelöst wird und ein Link mit Text «<name>, <ort>», `target="_blank"` und `rel="noreferrer"` entsteht. Die URL wird mit `urlquery` kodiert. Ein unbekannter Schlüssel bricht den Build mit einer klaren Meldung ab. Das Attribut `data-label="Ort"` bleibt.
- [x] Falls das Theme den Link in der Tabelle nicht erkennbar darstellt, eine kleine CSS-Regel in `assets/css/custom.css` ergänzen (nur Variablen/`currentColor`, keine festen Hex-Werte).
- [x] Sauber bauen, Fehlerfall geprüft (berglix brach den Build ab, zurückgesetzt). ~~Browser-Ansicht~~ *(skipped: Browser nicht verfügbar, manuell prüfen)*

### Acceptance criteria

- [x] `grep -o 'google.com/maps/search' public/index.html | wc -l` liefert 19, und jeder davon hat `target="_blank"` (`grep -o 'href="https://www.google.com/maps/search[^>]*target="_blank"' public/index.html | wc -l` liefert 19).
- [x] Die alten Freitexte sind weg: `grep -c 'Untere Stacherholz\|ABC Sporthalle\|>Seegarten<\|>Seegarten, Arbon<' public/index.html` liefert 0, und `grep -o '>Bergli, Arbon<' public/index.html | wc -l` liefert 1.
- [x] Die Hallennamen in der Spalte «Ort» lauten ausschliesslich: Säntishalle, Arbon; Seegarten Turnhalle, Arbon; Reben 4 Turnhalle, Arbon; ABC-Sporthalle Stacherholz, Arbon; Stacherholz (unten), Arbon; Bergli, Arbon; Turnhalle Freiestrasse, Amriswil.
- [x] Die Maps-Ziele der Tabelle und der Kontaktseite stimmen überein: `grep -o 'query=[^"&]*' public/index.html | sort -u | wc -l` liefert 7, und die sieben Ziele sind dieselben wie auf `public/kontakt/index.html`.
- [x] Tag, Zeit und Team der 19 Zeilen sowie der Hinweistext «In den Schulferien finden keine offiziellen Trainings statt.» sind unverändert (`git diff data/trainingszeiten.yaml` zeigt nur Änderungen am Feld `ort`/`halle`).
- [x] Ein falscher `halle`-Schlüssel lässt `hugo` mit Fehlermeldung abbrechen (von Hand geprüft, danach zurückgesetzt).
- [ ] ~~Im Browser sind die Hallennamen am Computer (1280 px) und als Karten bei 375 px als Links erkennbar und antippbar, die Seite scrollt nicht seitlich, Hero, Fusszeile und Wasserzeichen sind unverändert.~~ *(skipped: Browser nicht verfügbar, manuell prüfen)*

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] Falls CSS ergänzt wurde: `git diff -- assets/css/custom.css | grep -nE '^\+.*#[0-9a-fA-F]{3,8}\b'` findet keine Treffer.
- [x] `git diff --stat -- content/impressum.md content/datenschutz.md hugo.toml layouts/index.html` liefert keine Ausgabe (`content/kontakt.md` ist hier ausgenommen, weil Task 01 sie ändert).

## Task [03-datenschutz-hinweis-maps-links]

Die Datenschutzerklärung enthält einen kurzen Hinweis, dass die Hallenadressen auf Google Maps verlinkt sind, dass erst der Klick Google Maps öffnet und dass dann die Datenschutzbestimmungen von Google gelten. Das Datum «Stand» ist aktualisiert.

### Implementation steps

- [x] In `content/datenschutz.md` prüfen, dass noch kein Abschnitt zu externen Links existiert, und einen neuen Abschnitt `###` (z. B. «Links zu Google Maps») nach «Hosting bei GitHub Pages» einfügen. Inhalt: Hallenadressen auf der Kontaktseite und in der Trainingstabelle sind auf Google Maps verlinkt; beim blossen Aufruf der Website werden keine Daten an Google übertragen; erst mit dem Klick öffnet sich Google Maps, und es gelten die Datenschutzbestimmungen von Google.
- [x] Den Satz im Abschnitt «Keine Cookies, kein Tracking» auf Widerspruch prüfen (bleibt stimmig, weil nur verlinkt wird) und «Stand:» auf das heutige Datum setzen.
- [x] Sauber bauen und die Seite `/datenschutz/` ansehen.

### Acceptance criteria

- [x] `public/datenschutz/index.html` enthält «Google Maps» (`grep -o 'Google Maps' public/datenschutz/index.html | wc -l` liefert mindestens 2), das Wort «Klick» sowie den Hinweis auf die Datenschutzbestimmungen von Google.
- [x] Der Hinweis steht in einem eigenen Abschnitt mit Überschrift (`grep -c 'Links zu Google Maps' public/datenschutz/index.html` liefert mindestens 1).
- [x] «Stand:» zeigt das Änderungsdatum (nicht mehr 30.10.2026).
- [x] Die übrigen Abschnitte (Verantwortlich, Keine Cookies, Hosting, Ihre Rechte, Änderungen) sind unverändert (`git diff content/datenschutz.md` zeigt nur den neuen Abschnitt und das Datum).
- [x] `public/impressum/index.html` und `public/kontakt/index.html` verweisen weiterhin auf `pirates-homepage/datenschutz/`.

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0.
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] `git diff --stat -- hugo.toml layouts/index.html content/impressum.md` liefert keine Ausgabe (Kontaktseite, Daten, Partial und CSS sind ausgenommen, weil Task 01 und 02 sie ändern).
