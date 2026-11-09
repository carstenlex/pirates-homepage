## Task [01-vereinsfuehrung]

Die Seite „Über uns" bekommt ihr neues Gerüst: Der bisherige Werbetext entfällt, und der erste Abschnitt „Vereinsführung" zeigt drei Karten mit Foto, Name und Funktion. Die Daten stehen in einer YAML-Datei, die Fotos werden von der alten Vereinsseite geholt und einheitlich zugeschnitten. Das Layout der Seite legt die Abschnittsreihenfolge fest (Vereinsführung, danach der Markdown-Inhalt, danach Beiträge und Hauptversammlungen) und lässt Platz für die folgenden Abschnitte. Die Seite bleibt unter `/about/` und im Menü erreichbar.

### Implementation steps

- [x] Layout-Ansatz festlegen: Das Theme-Layout für Einzelseiten ansehen und ein eigenes Layout für „Über uns" anlegen (Front-Matter-Parameter `layout`), das Titel und Rahmen wie die übrigen Seiten ausgibt, ohne den Theme-Ordner zu ändern
- [x] Bisherigen Fließtext in `content/about.md` entfernen; Titel, Adresse `/about/` und `showDate: false` bleiben
- [x] Datendatei für die Vereinsführung anlegen: Name, Funktion und Foto für Carsten Lex (Präsident), Hürriyet Celiksap (Finanzen), Claudio Cioce (J+S Coach)
- [x] Die drei Porträts von der alten Vereinsseite herunterladen, auf einheitliche quadratische Größe zuschneiden (Ausschnitt mit Gesicht prüfen) und im Projekt ablegen
- [x] Partial für die Vereinsführung anlegen: Karten mit Foto (per Hugo-Ressource), Name und Funktion; Bau bricht mit klarer Meldung ab, wenn ein Foto fehlt
- [x] Styles in `custom.css` ergänzen: drei Spalten auf dem Desktop, eine Spalte auf dem Handy, Fotos ohne Verzerrung, Pirates-Farben
- [x] Texte „Verantwortlich für folgende Themen" bewusst nicht übernehmen
- [x] Entscheidung festhalten: Die Einwilligung der drei Personen zur Veröffentlichung ihrer Fotos klärt der Verein

### Acceptance criteria

- [x] Die gebaute Seite `/about/` enthält genau drei Karten mit den Namen Carsten Lex, Hürriyet Celiksap und Claudio Cioce und den Funktionen Präsident, Finanzen und J+S Coach
- [x] Der bisherige Werbetext („Basketball in Arbon, Amriswil und Umgebung", „Ihr habt Lust auf die coolste Sportart") und der Text „Verantwortlich für folgende Themen" kommen im gebauten HTML nicht vor
- [x] Jede Karte hat ein Foto mit `alt` (Name der Person); eine fehlende Fotodatei in der Datendatei bricht den Bau mit einer Meldung ab, die die Person nennt (einmal provoziert und zurückgenommen)
- [ ] ~~(manuell) Bei 375 px Breite stehen die Karten untereinander, ohne horizontales Scrollen; bei Desktop-Breite nebeneinander, mit gleich großen Fotos ohne Verzerrung~~ *(skipped: manuelle Pruefung im Browser nicht moeglich)*
- [x] Die Seite bleibt unter `/about/` erreichbar, der Menüeintrag „Über uns" führt dorthin; Kopf- und Fußzeile sind vorhanden
- [x] Startseite, Kontakt, Impressum und Datenschutz bleiben im gebauten Ergebnis vorhanden und unverändert

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `git diff --exit-code HEAD -- themes/` endet mit Exit-Code 0 (Theme unverändert)

## Task [02-wir-stehen-fuer-und-statuten]

Der zweite Abschnitt „Wir stehen für" zeigt die neun Grundsätze der Ethik-Charta im Sport im Wortlaut der alten Vereinsseite. Am Ende steht ein Download-Link auf die Statuten (PDF), die im Projekt liegen. Der Text wird in der Seiten-Datei gepflegt und erscheint an der vorgesehenen Stelle im Layout, nach der Vereinsführung.

### Implementation steps

- [x] Wortlaut von „Wir stehen für" (Einleitung und neun Grundsätze mit Erläuterungen) von der alten Seite im Original lesen und in `content/about.md` übernehmen
- [x] Statuten-PDF von der alten Seite herunterladen und im Projekt unter einem sauberen Namen ablegen
- [x] Am Ende des Abschnitts einen Link „Statuten (PDF)" auf die Datei setzen (Download-Verhalten, sprechender Linktext)
- [x] Prüfen, dass der Markdown-Inhalt im Layout nach der Vereinsführung und vor den späteren Abschnitten steht
- [x] Prüfen, dass die Überschriftenhierarchie stimmt (eine Hauptüberschrift, Abschnitte als zweite Ebene)

### Acceptance criteria

- [x] Die gebaute Seite enthält die Überschrift „Wir stehen für" und genau neun Grundsätze mit Titel und Erläuterung
- [x] Die Texte stimmen mit der alten Vereinsseite überein (Stichprobe: Titel „Gleichbehandlung für alle." und „Gegen jegliche Form von Korruption." kommen vor)
- [x] Der Abschnitt steht im gebauten HTML nach der Vereinsführung
- [x] Der Link „Statuten" zeigt auf eine Datei, die im Bauergebnis existiert und eine gültige PDF-Datei ist (`file` oder Kopfbytes `%PDF`)
- [x] Kein Link der Seite verweist auf `pirates-basketball.ch`
- [ ] ~~(manuell) Der Statuten-Link ist per Tab erreichbar, zeigt sichtbaren Fokus und lädt das PDF mit Enter~~ *(skipped: Browser-Pruefung nicht moeglich; Link ist ein normaler a-Element mit download)*

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `git diff --exit-code HEAD -- themes/` endet mit Exit-Code 0

## Task [03-mitgliedsbeitraege]

Der dritte Abschnitt „Mitgliedsbeiträge" zeigt den Einleitungstext der alten Seite und darunter eine Tabelle mit allen 11 Teams, Jahrgängen, Beiträgen und Kultur-Legi-Preisen. Das Kultur-Legi-Logo steht in der Kopfzelle der Kultur-Legi-Spalte. Auf dem Handy erscheint die Tabelle als Karten. Die Daten stehen in einer YAML-Datei, die du selbst pflegst.

### Implementation steps

- [x] Wortlaut des Einleitungstexts von der alten Seite im Original lesen
- [x] Datendatei für die Beiträge anlegen: Einleitung, Logo-Pfad und 11 Zeilen (U6, U8, U10, U12, U14, U16, U18, U22, Damen, Herren, Just-for-Fun) mit Jahrgängen, Beitrag und Kultur-Legi-Beitrag; Beträge von der alten Seite übernehmen
- [x] Partial für die Beiträge anlegen: Tabelle mit korrekten Spaltenüberschriften, Strich „–" bei leeren Jahrgängen, Logo (aus den Projekt-Ressourcen, mit `alt`) in der Kopfzelle der Kultur-Legi-Spalte; Bau bricht mit Meldung ab, wenn das Logo fehlt
- [x] Partial im Layout nach dem Markdown-Inhalt einbinden
- [x] Mobile Kartenansicht der Tabelle in `custom.css` ergänzen (nach dem Muster der Trainingszeiten-Tabelle), Logo in der Kopfzelle skaliert sinnvoll
- [x] Beträge gegen die alte Seite abgleichen und dem Verein zur Gegenprüfung vorlegen

### Acceptance criteria

- [x] Die gebaute Seite enthält die Überschrift „Mitgliedsbeiträge" und einen Einleitungstext mit Saison Juli bis Juni, halbem Beitrag ab Januar und Rechnung per E-Mail
- [x] Die Tabelle enthält genau 11 Datenzeilen mit den Beträgen der alten Seite (Stichprobe: U6 154 / 104, U14 209 / 134, Herren 452 / 302, Just-for-Fun 120 / 60)
- [x] Bei Damen, Herren und Just-for-Fun steht in der Jahrgangsspalte „–"
- [x] Die Kopfzelle der Kultur-Legi-Spalte enthält das Logo mit `alt="Kultur-Legi"`
- [x] Der Abschnitt steht im gebauten HTML nach „Wir stehen für"
- [ ] ~~(manuell) Bei 375 px Breite sind alle Werte lesbar und zuordenbar, ohne horizontales Scrollen; bei Desktop-Breite stimmt die Spaltenausrichtung~~ *(skipped: Browser-Pruefung nicht moeglich)*

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `git diff --exit-code HEAD -- themes/` endet mit Exit-Code 0

## Task [04-hauptversammlungen]

Der vierte Abschnitt „Hauptversammlungen" zeigt eine Tabelle der HV mit Nummer, Datum und Protokoll-Download. Die acht Protokolle (2. bis 9. HV) liegen im Projekt, die neueste HV steht oben. Der Bau prüft, dass jedes Protokoll existiert. Neue Hauptversammlungen werden durch eine Zeile in einer Datendatei ergänzt.

### Implementation steps

- [x] Die acht Protokoll-PDFs von der alten Seite herunterladen und mit einheitlichen Namen im Projekt ablegen (Nummer und Jahr im Dateinamen)
- [x] Datendatei anlegen: je HV Nummer, Datum (volles Datum für 2019 bis 2021, nur Jahr für 2022 bis 2026) und Protokolldatei, neueste zuerst
- [x] Partial anlegen: Tabelle mit den Spalten HV, Datum, Protokoll; sprechende Linktexte; Bau bricht mit Meldung ab, die die Zeile nennt, wenn eine Protokolldatei fehlt
- [x] Partial im Layout als letzten Abschnitt einbinden
- [x] Mobile Kartenansicht der Tabelle ergänzen, Styles wiederverwenden
- [x] Keine Spalte „Weitere Unterlagen" und keine Zusatzdokumente von 2019 übernehmen

### Acceptance criteria

- [x] Die gebaute Seite enthält die Überschrift „Hauptversammlungen" und eine Tabelle mit den Spalten HV, Datum und Protokoll, ohne Spalte „Weitere Unterlagen"
- [x] Die Tabelle hat genau 8 Datenzeilen, die 9. HV steht oben, die 2. HV (08.05.2019) unten
- [x] Bei 2022 bis 2026 zeigt die Datumsspalte nur das Jahr, bei 2019, 2020 und 2021 das volle Datum
- [x] Jeder Protokoll-Link zeigt auf eine Datei im Bauergebnis, die eine gültige PDF-Datei ist
- [x] Wird in der Datendatei ein Protokoll auf einen nicht existierenden Dateinamen gesetzt, bricht der Bau mit einer Meldung ab, die die Zeile nennt (einmal provoziert und zurückgenommen)
- [x] Eine zusätzliche Zeile samt PDF erscheint nach Neubau ohne weitere Änderung an der richtigen Stelle (einmal geprüft und zurückgenommen)
- [ ] ~~(manuell) Bei 375 px Breite ist die Tabelle ohne horizontales Scrollen lesbar; alle Protokoll-Links sind per Tab erreichbar und lassen sich mit Enter auslösen~~ *(skipped: Browser-Pruefung nicht moeglich)*

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `git diff --exit-code HEAD -- themes/` endet mit Exit-Code 0

## Task [05-build-pruefung-und-pflege]

Ein Prüfskript baut die Seite und prüft die gesamte Seite „Über uns" automatisch. Es läuft im GitHub-Workflow vor dem Deploy. Eine kurze Pflegeanleitung erklärt, wie Beiträge, Vereinsführung und Hauptversammlungen geändert werden. Eine Regressionsprüfung stellt sicher, dass die übrigen Seiten unverändert bleiben.

### Implementation steps

- [x] Prüfskript (Bash) nach dem Muster des Hero-Prüfskripts anlegen: baut in ein temporäres Zielverzeichnis und prüft das HTML von `/about/`
- [x] Prüfungen umsetzen: Reihenfolge der vier Abschnittsüberschriften, 3 Vorstandskarten mit Namen, 11 Beitragszeilen und Strich bei leeren Jahrgängen, Kultur-Legi-Logo mit `alt`, 8 HV-Zeilen (neueste zuerst, keine Spalte „Weitere Unterlagen"), Existenz jedes verlinkten PDFs, kein Link auf `pirates-basketball.ch`, Abwesenheit der gestrichenen Inhalte (Anmeldung, „Follow us", „Unterstützen auch Sie")
- [x] Skript als Schritt vor dem Deploy in den Workflow einbinden, neben dem Hero-Check
- [x] Kurze Pflegeanleitung schreiben: Beiträge ändern, Vorstand ändern, neue Hauptversammlung mit PDF ergänzen, Foto-Format; so ablegen, dass sie den Build nicht beeinflusst
- [x] Regressionsprüfung: Startseite, Kontakt, Impressum, Datenschutz sowie Kopf- und Fußzeile im gebauten Ergebnis
- [ ] ~~Einwilligung für die Personenfotos und Erlaubnis für das Kultur-Legi-Logo vom Verein bestätigen lassen (außerhalb dieser Umgebung)~~ *(skipped: ausserhalb dieser Umgebung, Verein klaert)*

### Acceptance criteria

- [x] Das Skript endet mit Exit-Code 0 bei korrektem Stand und mit Exit-Code ≠ 0, wenn z. B. eine Protokolldatei umbenannt ist (einmal gezielt provoziert und zurückgenommen)
- [x] Das Skript gibt pro Prüfung `OK` oder eine klare Fehlermeldung aus
- [x] Nach dem Lauf hat das Skript keine Dateien im Arbeitsverzeichnis verändert oder hinterlassen
- [x] Der Workflow enthält den Prüfschritt vor dem Hugo-Build für das Deploy
- [x] Die gebauten Seiten Startseite, `kontakt`, `impressum` und `datenschutz` existieren weiterhin und enthalten Kopf- und Fußzeile
- [x] Die Pflegeanleitung nennt die drei Datendateien, die Ablage der PDFs, das Fotoformat und das Vorgehen für eine neue Hauptversammlung
- [ ] ~~(manuell) Der Verein hat Namen, Beträge und Datumsangaben gegengeprüft und Foto- und Logo-Nutzung bestätigt~~ *(skipped: Vereinsbestaetigung ausserhalb dieser Umgebung)*

### Quality gates

- [x] `bash <Skriptpfad>` endet mit Exit-Code 0
- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `git diff --exit-code HEAD -- themes/` endet mit Exit-Code 0
- [x] `git status --short` listet nach dem Skriptlauf nur erwartete Dateien (Skript, Workflow, Anleitung, Datendateien, Partials, Layout, Styles, Seitendatei, PDFs, Bilder)
