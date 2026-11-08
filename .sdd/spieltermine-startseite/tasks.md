> Hinweis zu den Prüfbefehlen: Die `grep`-Prüfungen laufen gegen einen **unminifizierten** Build (`hugo --gc --cleanDestinationDir`), weil der Minifier Anführungszeichen entfernt. Gezählt wird mit `grep -o … | wc -l` (Treffer, nicht Zeilen). Alle Befehle laufen im Projektverzeichnis.
>
> Reihenfolge je Task: zuerst der unminifizierte Build und die `grep`-Prüfungen, danach das Build-Gate. Das Build-Gate läuft als `hugo --gc --minify > build.log 2>&1; echo $?` (muss `0` ausgeben), danach `grep -ci warn build.log` (muss `0` liefern; `grep` endet dabei mit Exit-Code 1, das ist erwartet). `build.log` darf nicht committet werden. Das Build-Gate läuft gegen den **echten** Feed; Fehlerfälle werden separat geprüft.
>
> Testdaten: Für die Prüfungen wird eine **lokale Test-ICS-Datei** mit Terminen relativ zum heutigen Datum erzeugt (ausserhalb des Repos, im Scratchpad) und mit einem beliebigen lokalen Webserver (Python ist hier nicht installiert; z. B. `npx http-server <ordner> -p <port>`, falls Node vorhanden ist, sonst ein kleiner PowerShell-`HttpListener`) auf `http://localhost:<port>/` bereitgestellt. Die Feed-URL wird dabei per Umgebungsvariable (`HUGO_PARAMS_SPIELTERMINFEED`) überschrieben, ohne `hugo.toml` zu ändern. Die Testdatei kommt nicht ins Repo. Falls Hugo `localhost` ablehnt, ist `[security.http] urls` nur lokal zu lockern und danach zurückzusetzen.
>
> Diff-Gates: Die Tasks werden nacheinander **ohne Zwischen-Commit** umgesetzt; `git diff` vergleicht daher mit `HEAD` (neue, untracked Dateien erscheinen dort nicht und sind erlaubt). Beim Gate `grep -ci warn build.log` ist die Ausgabe `0` das Erfolgskriterium, nicht der Exit-Code. Ist der echte Feed beim Build nicht erreichbar (Netzwerkausfall), ist der Build-Gate-Lauf zu wiederholen.
>
> Test-Hook: Für den Sommerzeit-Test gibt es den optionalen Parameter `spielterminHeute` (Datum `JJJJ-MM-TT`, überschreibt «heute» nur zu Testzwecken; ohne Wert gilt das Systemdatum). Er wird per `HUGO_PARAMS_SPIELTERMINHEUTE` gesetzt und nie in `hugo.toml` eingetragen.
>
> Feed-URL (Produktion): `https://calendar.google.com/calendar/ical/k9638oppgo52acvljql7f1piss%40group.calendar.google.com/public/basic.ics`. Texte: Überschrift «Nächste Spiele»; Spalten «Datum», «Zeit», «Spiel», «Ort»; leer: «Zurzeit sind keine Spiele eingetragen.»; Fehler: «Die Spieltermine sind zurzeit nicht verfügbar.»

## Task [01-naechste-spiele-tabelle]

Die Startseite zeigt unter den Trainingszeiten eine Tabelle «Nächste Spiele» mit allen Terminen **mit Uhrzeit** der nächsten zwei Monate aus dem Google Calendar: Wochentag und Datum, Uhrzeit in Schweizer Zeit, Titel und Ort als Google-Maps-Link (neuer Tab). Der Feed wird beim Build geladen. Es gibt Hinweise für «keine Termine» und «Feed nicht erreichbar» (Build läuft weiter, Warnung im Log). Am Computer erscheint eine Tabelle im Stil der Trainingszeiten, bei 375 px erscheinen Karten. Für Termine mit Uhrzeit entscheidet nur `DTSTART` über das Fenster. Ganztägige Termine behandelt Task 02.

### Implementation steps

- [x] In `hugo.toml` unter `[params]` die Feed-URL als `spielterminFeed` ablegen.
- [x] Neues Partial `layouts/partials/spieltermine.html` anlegen und in `layouts/index.html` direkt nach dem Trainingszeiten-Partial einbinden. Der Feed wird mit `resources.GetRemote` geladen.
- [x] ICS parsen: Zeilenfaltung auflösen, `\r\n` normalisieren, pro `VEVENT` `DTSTART`, `SUMMARY`, `LOCATION` lesen, ICS-Escapes (`\,` `\;` `\n` `\\`) zurücknehmen. `DESCRIPTION` wird nicht gelesen.
- [x] Uhrzeit von UTC nach Europa/Zürich umrechnen, Wochentag über ein festes Array (`So Mo Di Mi Do Fr Sa`) und Datum als `TT.MM.JJJJ` ausgeben.
- [x] Termine ab dem heutigen Tag (Europa/Zürich, auch frühere Uhrzeiten von heute) bis heute plus 2 Monate behalten, aufsteigend sortieren, keine Obergrenze. «Heute» kommt aus dem optionalen Test-Parameter `spielterminHeute`, sonst vom Systemdatum. Termine ohne Uhrzeit (ganztägig) werden in diesem Task übersprungen.
- [x] Tabelle im Stil der Trainingszeiten rendern (`<section>`, `<h2>`, `<table role="table">`, `data-label` an den Zellen). Titel und Ort nur escaped ausgeben (kein `safeHTML`). Ort als Maps-Link (`urlquery`, `target="_blank" rel="noreferrer"`), ohne Ort bleibt die Zelle leer.
- [x] Leerzustand («Zurzeit sind keine Spiele eingetragen.») und Fehlerzustand («Die Spieltermine sind zurzeit nicht verfügbar.») umsetzen. Im Fehlerfall `warnidf` statt `errorf`.
- [x] In `assets/css/custom.css` die nötigen Regeln für `.spieltermine-*` ergänzen bzw. die vorhandenen Trainingszeiten-Selektoren mitverwenden (nur Theme-Variablen, keine festen Hex-Werte), inklusive Kartenansicht unter 640 px.
- [x] Test-ICS mit relativen Terminen erzeugen (heute, +3 Tage, +3 Wochen, +3 Monate, gestern, ein Termin am heutigen Tag mit früherer Uhrzeit, je ein Termin im Winter und im Sommer (Sommer nur mit `spielterminHeute=2027-06-01` im Fenster), ein Titel mit Umlaut/Komma/Semikolon/`&`/`<`, ein Termin ohne Ort, eine gefaltete Zeile, eine `DESCRIPTION` mit HTML-Link), lokal ausliefern und die Seite damit bauen.
- [ ] ~~Mit `hugo server` die Startseite am Computer (1280 px) und bei 375 px ansehen.~~ *(skipped: kein Browser in dieser Umgebung verfügbar)*

### Acceptance criteria

- [x] Mit der Test-ICS enthält `public/index.html` die Überschrift «Nächste Spiele» und genau die Termine heute, +3 Tage und +3 Wochen (`grep -o` auf deren Titel liefert je 1); der Termin von gestern und der in +3 Monaten fehlen (je 0).
- [x] Die Reihenfolge ist aufsteigend: `grep -o` der Testtitel in Dokumentreihenfolge ergibt genau die erwartete Reihenfolge. Der Termin heute mit früherer Uhrzeit erscheint ebenfalls.
- [x] Die Uhrzeit ist Schweizer Zeit: Mit dem heutigen Datum wird ein Wintertermin `12:30Z` als `13:30` angezeigt; mit `HUGO_PARAMS_SPIELTERMINHEUTE=2027-06-01` wird ein Sommertermin `12:30Z` als `14:30` angezeigt.
- [x] Wochentag und Datum erscheinen im Format «Sa, 14.11.2026» (Wochentag aus festem Array, nicht abhängig von der Locale), geprüft mit `grep -oE '(So|Mo|Di|Mi|Do|Fr|Sa), [0-9]{2}\.[0-9]{2}\.[0-9]{4}'` für ein bekanntes Datum.
- [x] Der Titel mit Sonderzeichen erscheint unverfälscht und escaped (`&amp;`, `&lt;`, kein ausgeführtes HTML), die gefaltete Zeile ist zu einem einzigen Titel zusammengesetzt (der erwartete Gesamttitel steht als ein Treffer im HTML), und die `DESCRIPTION` samt HTML-Link steht nicht im HTML.
- [x] Jeder Termin mit Ort hat einen Maps-Link mit `target="_blank" rel="noreferrer"` (Anzahl der Maps-Links in `public/index.html` = vor der Änderung gemessene Anzahl der Trainingstabelle plus Zahl der Test-Termine mit Ort), `grep -c ZgotmplZ public/index.html` liefert 0. Beim Termin ohne Ort ist die Ortszelle leer und enthält kein `<a`.
- [x] Die Tabelle hat `<th>`-Spalten «Datum», «Zeit», «Spiel», «Ort», und das HTML der Startseite enthält ausser Maps-Links keinen Verweis auf Google (kein Skript, Bild oder Stylesheet von Google).
- [x] Vergleich mit dem Stand vor der Änderung: `public/kontakt/`, `public/impressum/`, `public/datenschutz/` und der Trainingszeiten-Abschnitt der Startseite sind inhaltlich unverändert.
- [x] Leerzustand: Mit einer Test-ICS ohne Termine im Fenster steht «Zurzeit sind keine Spiele eingetragen.» und keine Tabelle `spieltermine`.
- [x] Fehlerzustand: Mit ungültiger Feed-URL endet `hugo` mit Exit-Code 0, die Seite zeigt «Die Spieltermine sind zurzeit nicht verfügbar.», und das Build-Log enthält eine Warnung (von Hand geprüft, danach zurückgesetzt).
- [ ] ~~Im Browser erscheint die Tabelle bei 1280 px direkt unter den Trainingszeiten im gleichen Stil, bei 375 px als Karten, ohne seitliches Scrollen, Links antippbar. Hero, Fusszeile und Wasserzeichen sind unverändert.~~ *(skipped: kein Browser in dieser Umgebung verfügbar)*

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0 (gegen den echten Feed).
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] `git diff -- assets/css/custom.css | grep -nE '^\+.*#[0-9a-fA-F]{3,8}\b'` findet keine Treffer.
- [x] `git diff --stat -- data/ content/ .github/` liefert keine Ausgabe.
- [x] `git diff -- hugo.toml` zeigt nur die Zeile `spielterminFeed` (kein gelockertes `[security.http]`).

## Task [02-ganztaegige-und-mehrtaegige-termine]

Ganztägige Termine (z. B. «Säntishalle geschlossen») erscheinen mit «ganztägig» statt einer Uhrzeit. Mehrtägige ganztägige Termine zeigen Start- und Enddatum, wobei der letzte angezeigte Tag der letzte belegte Tag ist (`DTEND` ist exklusiv). Ein Termin erscheint, solange sein Zeitraum das Fenster (heute bis heute plus 2 Monate) berührt.

### Implementation steps

- [x] Das Parsing von `DTSTART`/`DTEND` mit `;VALUE=DATE` ergänzen (nur Datum, keine Zeitzonenumrechnung).
- [x] Ganztägige Termine in Sortierung und Fenster-Filter einbeziehen: Sortierung nach Startdatum (ganztägig vor Terminen mit Uhrzeit am selben Tag), Fenster nach Zeitraum.
- [x] Anzeige: «ganztägig» in der Zeitspalte, bei mehrtägigen Terminen Start- bis Enddatum mit Enddatum = `DTEND` minus 1 Tag.
- [x] Die Test-ICS um ganztägige Termine erweitern: eintägig im Fenster, mehrtägig im Fenster, einer der gestern endete, einer der gestern begann und morgen endet, einer ausserhalb des Fensters.
- [ ] ~~Neu bauen und die Tabelle am Computer und bei 375 px ansehen.~~ *(teilweise: Neu bauen erledigt; Browseransicht skipped: kein Browser in dieser Umgebung verfügbar)*

### Acceptance criteria

- [x] Ein eintägiger ganztägiger Termin im Fenster erscheint mit «ganztägig» und genau einem Datum.
- [x] Ein mehrtägiger ganztägiger Termin (z. B. 3 Tage) zeigt Start- und Enddatum, und das Enddatum ist der letzte belegte Tag (nicht der Folgetag).
- [x] Ein Termin, der gestern endete, fehlt. Ein Termin, der gestern begann und morgen endet, erscheint. Ein Termin ausserhalb des Fensters fehlt.
- [x] Ganztägige und zeitgebundene Termine stehen gemeinsam in einer Liste, korrekt nach Datum sortiert.
- [x] Mit der gleichen, erweiterten Test-ICS wie in Task 01 erscheinen die zeitgebundenen Termine unverändert. Enthält die ICS im Fenster nur ganztägige Termine, erscheint die Tabelle statt des Leerzustands. Am gleichen Tag steht ein ganztägiger Termin vor einem mit Uhrzeit.
- [ ] ~~Im Browser sind ganztägige Termine am Computer und als Karten bei 375 px lesbar, ohne seitliches Scrollen.~~ *(skipped: kein Browser in dieser Umgebung verfügbar)*

### Quality gates

- [x] `hugo --gc --minify > build.log 2>&1; echo $?` gibt 0 aus, und `grep -ci warn build.log` liefert 0 (gegen den echten Feed).
- [x] `git status --porcelain themes/` liefert keine Ausgabe.
- [x] `git diff -- assets/css/custom.css | grep -nE '^\+.*#[0-9a-fA-F]{3,8}\b'` findet keine Treffer.
- [ ] ~~`git diff --stat -- data/ content/ .github/ hugo.toml layouts/index.html` liefert keine Ausgabe.~~ *(skipped: hugo.toml und layouts/index.html enthalten die noch nicht committeten Änderungen aus Task 01 (je 1 Zeile); Task 02 hat sie nicht angefasst, data/ content/ .github/ sind unverändert)*

## Task [03-taeglicher-build]

Die Website wird jeden Tag automatisch neu gebaut und veröffentlicht, damit Kalenderänderungen ohne Zutun erscheinen. Der bestehende Workflow bekommt einen Zeitplan, der Rest bleibt unverändert.

### Implementation steps

- [ ] In `.github/workflows/hugo.yml` unter `on:` einen `schedule`-Trigger mit `cron: '0 5 * * *'` ergänzen. Bestehende Trigger, `permissions`, `concurrency` und Jobs bleiben unverändert.
- [ ] Prüfen, dass der Schritt «Build (publish)» und der Deploy-Schritt für das Ereignis `schedule` laufen (Bedingung `github.event_name != 'pull_request'`).
- [ ] Datenschutz prüfen: Der Abruf erfolgt nur beim Build, in `content/datenschutz.md` ist keine Änderung nötig.
- [ ] Voraussetzung: Task 01 und 02 sind committet und auf `main`. Dann pushen und einen manuellen Lauf (`workflow_dispatch`) prüfen. Der erste geplante Lauf ist erst am Folgetag beobachtbar (`schedule` läuft nur auf dem Standard-Branch).

### Acceptance criteria

- [ ] Die Workflow-Datei enthält genau einen `schedule`-Eintrag mit `cron: '0 5 * * *'` neben `pull_request`, `push` und `workflow_dispatch`.
- [ ] Die Datei ist gültiges YAML (z. B. `gh workflow list` zeigt «Hugo build and deploy» ohne Fehler, oder `npx yaml valid < .github/workflows/hugo.yml`).
- [ ] Ein Kalendereintrag, der nach dem letzten Lauf geändert wurde, erscheint nach einem weiteren manuellen Lauf (Ersatz für den Tageslauf).
- [ ] Ein manuell gestarteter Lauf auf `main` (`gh workflow run` bzw. `workflow_dispatch`) endet erfolgreich und veröffentlicht die Seite.
- [ ] Auf der veröffentlichten Startseite steht «Nächste Spiele» mit Terminen aus dem echten Kalender.
- [ ] `content/datenschutz.md` ist unverändert, und die Seite lädt beim Aufruf nichts von Google (keine Anfrage an `google.com` im Netzwerk-Tab, ausser nach Klick auf einen Maps-Link).

### Quality gates

- [ ] `git status --porcelain themes/` liefert keine Ausgabe.
- [ ] Der Commit ändert nur die Workflow-Datei: `git show --stat --format= HEAD` listet ausschliesslich `.github/workflows/hugo.yml`.
