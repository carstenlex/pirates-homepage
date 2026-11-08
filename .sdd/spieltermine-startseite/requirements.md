Feature-Slug: `spieltermine-startseite`

## Problem Statement

Wer die Pirates-Website besucht, findet dort Trainingszeiten, aber nicht, wann und wo die Teams als Nächstes spielen. Spieleltern, Fans und Gegner müssen nachfragen oder die Termine anderswo suchen. Die Spieltermine pflegt der Verein bereits in einem öffentlichen Google Calendar («Basketballspiele»). Auf der Website erscheinen sie nicht, und eine zweite Pflege der Termine von Hand wäre fehleranfällig und würde veralten.

## Solution

Die Startseite zeigt unter den Trainingszeiten eine Tabelle «Nächste Spiele». Sie listet alle Termine der nächsten zwei Monate aus dem Google Calendar des Vereins, nach Datum sortiert, mit Datum und Wochentag, Uhrzeit, Titel bzw. Begegnung und Ort. Der Ort ist ein Link, der Google Maps in einem neuen Tab öffnet. Ganztägige Termine werden mit angezeigt. Die Seite wird täglich automatisch neu gebaut, damit Änderungen im Kalender ohne Zutun auf der Website erscheinen. Besucherinnen und Besucher kontaktieren Google dafür nicht. Gibt es keine Termine oder ist der Kalender nicht erreichbar, steht ein kurzer Hinweis statt einer leeren oder kaputten Tabelle, und die übrige Seite bleibt online.

## User Stories

1. Als Spielereltern möchte ich auf der Startseite sehen, wann das nächste Spiel meines Kindes stattfindet, damit ich den Tag planen kann.
2. Als Fan möchte ich alle Spiele der nächsten Wochen auf einen Blick sehen, damit ich entscheiden kann, welche ich besuche.
3. Als Besucherin möchte ich Datum und Wochentag eines Spiels sehen (z. B. «Sa, 14.11.2026»), damit ich nicht selbst nachschlagen muss, auf welchen Tag es fällt.
4. Als Besucher möchte ich die Anspielzeit in Schweizer Ortszeit sehen, damit ich nicht umrechnen muss.
5. Als Besucherin möchte ich den Titel bzw. die Begegnung (z. B. «DU16 – Frauenfeld») lesen, damit ich weiss, welches Team gegen wen spielt.
6. Als Besucher möchte ich den Spielort sehen und per Klick in Google Maps öffnen, damit ich zur Halle finde.
7. Als Besucherin möchte ich, dass der Maps-Link in einem neuen Tab öffnet, damit ich die Vereinsseite nicht verliere.
8. Als Besucher möchte ich bei ganztägigen Terminen «ganztägig» statt einer Uhrzeit lesen, damit klar ist, dass es keine feste Anspielzeit gibt.
9. Als Besucherin möchte ich bei mehrtägigen Terminen den ganzen Zeitraum sehen, damit ich weiss, wie lange der Termin dauert.
10. Als Besucher möchte ich nur Termine der nächsten zwei Monate sehen, damit die Liste übersichtlich bleibt.
11. Als Besucherin möchte ich keine vergangenen Termine sehen, damit die Liste aktuell wirkt.
12. Als Besucher möchte ich Termine in zeitlicher Reihenfolge sehen, damit das nächste Spiel oben steht.
13. Als Besucherin möchte ich am Handy die Spiele als Karten lesen, damit ich nicht seitwärts scrollen muss.
14. Als Besucher möchte ich am Computer eine übersichtliche Tabelle im gleichen Stil wie die Trainingszeiten sehen, damit die Startseite einheitlich wirkt.
15. Als Besucherin möchte ich einen klaren Hinweis lesen, wenn in den nächsten zwei Monaten keine Spiele eingetragen sind, damit ich nicht denke, die Seite sei kaputt.
16. Als Besucher möchte ich einen Hinweis lesen, wenn die Termine zurzeit nicht geladen werden konnten, damit ich weiss, dass es ein vorübergehendes Problem ist.
17. Als Vereinsverantwortlicher möchte ich Spiele nur im Google Calendar pflegen, damit ich sie nicht ein zweites Mal auf der Website eintragen muss.
18. Als Vereinsverantwortlicher möchte ich, dass Änderungen im Kalender spätestens am nächsten Tag auf der Website erscheinen, damit die Angaben verlässlich sind.
19. Als Vereinsverantwortlicher möchte ich Termine, die nicht erscheinen sollen, im Kalender entfernen können, ohne dass dafür Regeln im Code nötig sind.
20. Als Vereinsverantwortlicher möchte ich, dass ein Ausfall des Kalenders die Website nicht lahmlegt, damit Trainingszeiten und Kontaktseiten erreichbar bleiben.
21. Als Vereinsverantwortlicher möchte ich bei einem Abruffehler im Build eine Warnung sehen, damit ich das Problem bemerke.
22. Als Datenschutzbewusster Besucher möchte ich, dass meine Daten beim blossen Aufruf der Seite nicht an Google gehen, damit meine Privatsphäre gewahrt bleibt.
23. Als Betreiberin der Website möchte ich, dass die Anzeige der Termine keine Cookies und kein Tracking einführt, damit die Datenschutzerklärung stimmig bleibt.
24. Als Besucherin mit Bildschirmleser möchte ich, dass die Tabelle sinnvolle Spaltenüberschriften hat, damit die Angaben verständlich vorgelesen werden.

## User Acceptance Tests

1. Given der Kalender enthält ein Spiel in drei Wochen mit Uhrzeit und Ort, when die Startseite aufgerufen wird, then steht es in der Tabelle «Nächste Spiele» mit Wochentag und Datum, Uhrzeit in Schweizer Zeit, Titel und Ort.
2. Given ein Spiel um 13:30 Uhr Schweizer Zeit, when die Startseite im Winter und im Sommer angesehen wird, then wird jeweils 13:30 und nicht die UTC-Zeit angezeigt.
3. Given der Kalender enthält Termine in 3 Tagen, in 3 Wochen und in 3 Monaten, when die Startseite aufgerufen wird, then erscheinen die ersten beiden und der dritte nicht.
4. Given der Kalender enthält einen Termin von gestern, when die Startseite aufgerufen wird, then erscheint er nicht.
5. Given der Kalender enthält einen Termin heute, when die Startseite aufgerufen wird, then erscheint er.
6. Given mehrere Termine in beliebiger Reihenfolge im Kalender, when die Startseite aufgerufen wird, then sind sie nach Datum und Uhrzeit aufsteigend sortiert.
7. Given der Kalender enthält einen ganztägigen Termin («Säntishalle geschlossen») innerhalb der nächsten zwei Monate, when die Startseite aufgerufen wird, then erscheint er mit «ganztägig» anstelle einer Uhrzeit.
8. Given ein mehrtägiger ganztägiger Termin, when die Startseite aufgerufen wird, then zeigt die Tabelle Start- und Enddatum, wobei der letzte Tag der letzte tatsächlich belegte Tag ist.
9. Given ein Termin mit Ort, when auf den Ort geklickt wird, then öffnet sich Google Maps mit der Suche nach diesem Ort in einem neuen Tab.
10. Given ein Termin ohne Ort, when die Startseite aufgerufen wird, then bleibt die Ortsspalte leer und es gibt keinen toten Link.
11. Given der Kalender enthält in den nächsten zwei Monaten keinen Termin, when die Startseite aufgerufen wird, then steht «Zurzeit sind keine Spiele eingetragen.» und keine leere Tabelle.
12. Given der Kalender ist nicht erreichbar, when die Seite gebaut wird, then schlägt der Build nicht fehl, die Startseite zeigt «Die Spieltermine sind zurzeit nicht verfügbar.», und der Build gibt eine Warnung aus.
13. Given ein Titel mit Sonderzeichen (Umlaute, Komma, Semikolon, HTML-Zeichen wie `<` oder `&`), when die Startseite aufgerufen wird, then erscheint der Titel korrekt und unverfälscht, ohne dass HTML ausgeführt wird.
14. Given eine Beschreibung mit HTML-Link im Kalendereintrag, when die Startseite aufgerufen wird, then erscheint die Beschreibung nicht.
15. Given ein Termin wurde im Kalender geändert, when der tägliche Lauf stattgefunden hat, then zeigt die Website die Änderung.
16. Given die Startseite am Computer (1280 px), when sie angesehen wird, then erscheint «Nächste Spiele» als Tabelle im gleichen Stil wie die Trainingszeiten, direkt darunter.
17. Given die Startseite bei 375 px Breite, when sie angesehen wird, then erscheinen die Spiele als Karten, die Seite scrollt nicht seitlich, und die Links sind antippbar.
18. Given die Startseite, when die Netzwerkanfragen im Browser angesehen werden, then findet keine Anfrage an Google statt (ausser nach einem Klick auf einen Maps-Link).
19. Given die Trainingszeiten, Kontakt-, Impressum- und Datenschutzseite, when sie angesehen werden, then sind sie unverändert.

## Definition of Done

- Alle User Acceptance Tests sind bestanden.
- Der Build mit `hugo --gc --minify` endet mit Exit-Code 0 und ohne Warnungen, solange der Kalender erreichbar ist.
- Die Tabelle erscheint am Computer und bei 375 px korrekt, ohne seitliches Scrollen.
- Der tägliche automatische Lauf ist eingerichtet und hat mindestens einmal erfolgreich veröffentlicht.
- Bei nicht erreichbarem Kalender bleibt die Website online und zeigt den Hinweistext.
- Die Seite setzt weiterhin keine Cookies und lädt beim Aufruf nichts von Google.
- Trainingszeiten, Hallen-Links und übrige Seiten zeigen keine Regression.
- Die Datenschutzerklärung bleibt zutreffend (kein Eingriff nötig, siehe Further Notes).

## Out of Scope

- Pflege der Termine auf der Website von Hand oder eine zweite Datenquelle.
- Anzeige von Spielergebnissen, Tabellen oder Ranglisten.
- Anzeige der Kalenderbeschreibung (`DESCRIPTION`) oder von darin enthaltenen Links und Anmeldeformularen.
- Filter nach Team, Namensregeln im Code oder das Ausblenden bestimmter Terminarten (Pflege erfolgt im Kalender).
- Wiederholungstermine (der Kalender enthält derzeit keine).
- Aktualisierung in Echtzeit im Browser, eigene Unterseite für Spiele, Export oder Abonnieren des Kalenders.
- Bestätigung des Maps-Ziels: Der Ort ist Freitext aus dem Kalender und führt nicht immer exakt zur Halle.
- Benachrichtigungen bei Terminänderungen.

## Further Notes

- **Kalender-Daten:** Der Feed enthält derzeit rund 100 Einträge, viele davon alt (ab 2021) und teils ohne Ort. Neuere Einträge haben meist einen Ort. Sperrdaten und interne Termine stehen im selben Kalender. Sie erscheinen, falls sie im Zeitfenster liegen, weil keine Namensfilter vorgesehen sind. Wer das nicht möchte, trägt sie in einem anderen Kalender ein.
- **Tag der Anzeige:** Termine «heute» erscheinen noch, auch wenn der Anpfiff schon vorbei ist, weil der Build nur täglich läuft.
- **Mehrtägige Termine:** Der Termin erscheint, solange sein Zeitraum das Fenster berührt.
- **Aktualität:** Änderungen im Kalender erscheinen bis zum nächsten täglichen Lauf, also bis zu rund 24 Stunden später. Ein manueller Lauf ist über `workflow_dispatch` möglich.
- **Datenschutz:** Der Abruf geschieht serverseitig beim Build, Besucherdaten fliessen nicht an Google. Der bestehende Abschnitt «Links zu Google Maps» in der Datenschutzerklärung deckt die Maps-Links der Orte ab. Bei der Umsetzung ist zu bestätigen, dass kein weiterer Hinweis nötig ist.
- **Offene Frage (nicht blockierend):** Die genaue Uhrzeit des täglichen Laufs (Vorschlag 05:00 UTC) und die Überschrift «Nächste Spiele» können bei der Review angepasst werden.

---

## Technical Annex
> Written against codebase as of: 2026-11-08 (commit 8dd3954)

### Architectural Decisions

- **Datenquelle:** Öffentlicher ICS-Feed `https://calendar.google.com/calendar/ical/k9638oppgo52acvljql7f1piss%40group.calendar.google.com/public/basic.ics`. Die URL wird in `hugo.toml` unter `[params]` abgelegt (z. B. `spielterminFeed`), nicht im Template. Die Feed-URL ist öffentlich lesbar, kein Geheimnis. `X-WR-TIMEZONE` ist `Europe/Berlin`, die Zeitangaben stehen in UTC (`...Z`) oder als Datum (`;VALUE=DATE:`).
- **Abruf:** Im Hugo-Template per `resources.GetRemote` zur Build-Zeit. Ist die Ressource nicht ladbar (`.Err` oder leer), gibt das Partial `warnidf` aus (kein `errorf`) und rendert den Fehlerhinweis. Die Standard-Sicherheitsrichtlinie von Hugo erlaubt `GetRemote`; falls nicht, ist `[security.http] urls` in `hugo.toml` zu ergänzen.
- **Neues Partial:** `layouts/partials/spieltermine.html`, aus `layouts/index.html` direkt nach `{{ partial "trainingszeiten.html" . }}` eingebunden. Struktur und Klassen analog zu `trainingszeiten.html` (`<section>`, `<h2>`, `<table role="table">`, `data-label` an den `<td>`), damit die vorhandene Kartenansicht greift. Ein eigener CSS-Block `.spieltermine-*` in `assets/css/custom.css` wiederholt nur das nötige oder erweitert die vorhandenen Selektoren; nur Theme-Variablen, keine festen Hex-Werte.
- **Parser (im Partial, ohne Plugins):**
  - Zeilenfaltung auflösen (Fortsetzungszeilen beginnen mit Leerzeichen/Tab; vorher `\r\n` zu `\n` normalisieren).
  - Pro `BEGIN:VEVENT … END:VEVENT` die Felder `DTSTART`, `DTEND`, `SUMMARY`, `LOCATION` lesen. Parameter wie `;VALUE=DATE` im Feldnamen beachten.
  - ICS-Escapes zurücknehmen (`\,`, `\;`, `\n`, `\\`).
  - `DTSTART` in `YYYYMMDDTHHMMSSZ` in RFC3339 umbauen (`printf`/`substr`), mit `time.AsTime` parsen und mit `.In "Europe/Zurich"` ausgeben. Ganztägig: nur Datum, Anzeige «ganztägig».
  - Bei ganztägigen Terminen ist `DTEND` exklusiv (Folgetag); angezeigtes Ende = `DTEND` minus 1 Tag, nur bei mehrtägigen anzeigen.
  - Wochentage per festem Array (`So Mo Di Mi Do Fr Sa`) statt Locale-Abhängigkeit; Datumsformat `02.01.2006`.
- **Filter und Sortierung:** Fenster ab Beginn des heutigen Tages (Europa/Zürich) bis `now` plus 2 Monate (`.AddDate 0 2 0`); Termine, deren Zeitraum das Fenster berührt, bleiben. Sortierung aufsteigend nach Startzeit (z. B. über eine Liste von Dicts und `sort`). Keine Zählbegrenzung.
- **Ausgabe:** `SUMMARY` und `LOCATION` werden vom Hugo-Template standardmässig HTML-escaped; kein `safeHTML`. Ort-Link: `https://www.google.com/maps/search/?api=1&query={{ $ort | urlquery }}` mit `target="_blank" rel="noreferrer"`, wie in `trainingszeiten.html`. Ohne `LOCATION` bleibt die Zelle leer. `DESCRIPTION` wird nicht gelesen.
- **Texte:** Überschrift «Nächste Spiele»; Spalten «Datum», «Zeit», «Spiel», «Ort»; leer: «Zurzeit sind keine Spiele eingetragen.»; Fehler: «Die Spieltermine sind zurzeit nicht verfügbar.»
- **Zeitplan:** In `.github/workflows/hugo.yml` unter `on:` ein `schedule`-Eintrag mit `cron: '0 5 * * *'` (UTC). Der Trigger ist nur auf dem Standard-Branch aktiv und läuft deshalb nach dem Merge. `permissions`, `concurrency` und der Rest der Jobs bleiben unverändert. Der Schritt «Build (publish)» gilt wegen `github.event_name != 'pull_request'` auch für `schedule`.
- **Datenschutz:** Kein Eingriff in `content/datenschutz.md`, weil der Abruf nur beim Build geschieht.
- **Nicht ändern:** `themes/`, `data/trainingszeiten.yaml`, `data/hallen.yaml`, die Inhaltsseiten.

### Automated Testing Decisions

- Das Projekt hat keine automatisierten Tests und keinen Test-Runner. Es gibt dafür nur die Build-Prüfungen aus den bisherigen Features (`hugo --gc --minify > build.log`, `grep -ci warn build.log` und `grep` gegen `public/`). Es wird kein Test-Framework eingeführt.
- **Gute Prüfung:** Sie prüft nur das sichtbare Ergebnis im gebauten HTML (`public/index.html`), nicht die Template-Interna.
- **Prüfstrategie:**
  - Für den Parser eine lokale Testdatei mit fest vorgegebenen Terminen (heute, +3 Tage, +3 Wochen, +3 Monate, gestern, ganztägig, mehrtägig, mit Sonderzeichen, ohne Ort) bereitstellen und die Feed-URL beim Test per `HUGO_PARAMS_…` oder temporärer Konfiguration darauf zeigen lassen. Die Testdatei kommt nicht in die Produktion.
  - Fehlerfall von Hand prüfen: eine ungültige Feed-URL → Build-Exit 0, Hinweistext auf der Seite, Warnung im Build-Log (der übliche «grep warn»-Check ist dafür bewusst anders zu lesen).
  - Zeitzonen einmal im Winter- und einmal im Sommertermin gegen die erwartete Ortszeit prüfen.
  - Visuelle Prüfung im Browser bei 1280 px und 375 px (`hugo server`).
- **Prior art:** `.sdd/hallen-google-maps-links` (grep-Prüfungen gegen den unminifizierten Build, Fehlerfall von Hand, Build-Gate mit `build.log`).
- **Hinweis:** Der unminifizierte Build (`hugo --gc --cleanDestinationDir`) ist für `grep` auf Attribute nötig, weil der Minifier Anführungszeichen entfernt.
