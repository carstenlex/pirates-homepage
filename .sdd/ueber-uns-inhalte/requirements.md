## Problem Statement

Die Seite „Über uns" besteht heute aus einem einzigen Werbetext. Wichtige Vereinsinformationen, die auf der alten Vereinsseite (pirates-basketball.ch) stehen, fehlen auf der neuen Seite: wer den Verein führt, wofür der Verein steht, was die Mitgliedschaft kostet, die Statuten und die Protokolle der Hauptversammlungen. Interessierte Eltern, Mitglieder und Behörden finden diese Angaben nicht, solange die alte Seite die einzige Quelle ist. Wird die alte Seite abgeschaltet, gehen sie ganz verloren.

## Solution

Die Seite „Über uns" wird zur Vereinsinformationsseite mit vier Abschnitten in dieser Reihenfolge:

1. **Vereinsführung:** drei Personen mit Foto, Name und Funktion.
2. **Wir stehen für:** die neun Grundsätze der Ethik-Charta im Sport, am Ende mit Download der Statuten.
3. **Mitgliedsbeiträge:** Einleitungstext und Tabelle der Beiträge je Team, mit eigener Spalte für den Kultur-Legi-Preis (mit Kultur-Legi-Logo).
4. **Hauptversammlungen:** Tabelle der Hauptversammlungen mit Download des jeweiligen Protokolls.

Der bisherige Einleitungstext, die Anmeldung und das Kontaktformular der alten Seite werden nicht übernommen. Alle Dokumente und Bilder liegen künftig auf der neuen Seite selbst und hängen nicht mehr an der alten. Der Vereinsverantwortliche pflegt Beiträge, Vorstand und Hauptversammlungen selbst, ohne Seitenlayout anfassen zu müssen.

## User Stories

1. Als Interessent möchte ich sehen, wer den Verein führt, damit ich weiß, wen ich ansprechen kann.
2. Als Interessent möchte ich zu jeder Person aus der Vereinsführung ein Foto sehen, damit der Verein persönlich wirkt.
3. Als Interessent möchte ich zu jeder Person Name und Funktion lesen, damit ich ihre Rolle verstehe.
4. Als Elternteil möchte ich die Grundsätze des Vereins lesen, damit ich weiß, welche Werte meinem Kind vermittelt werden.
5. Als Elternteil möchte ich alle neun Grundsätze der Ethik-Charta mit ihren Erläuterungen sehen, damit ich den Umgang mit Fairness, Respekt und Gewaltprävention einschätzen kann.
6. Als Mitglied möchte ich die Statuten als PDF herunterladen, damit ich Rechte und Pflichten nachlesen kann.
7. Als Behörde oder Sponsor möchte ich die Statuten leicht finden, damit ich den Verein prüfen kann.
8. Als Elternteil möchte ich die Mitgliedsbeiträge je Team übersichtlich sehen, damit ich die Kosten für mein Kind kenne.
9. Als Elternteil möchte ich anhand des Jahrgangs sehen, in welches Team mein Kind gehört, damit ich den passenden Beitrag finde.
10. Als Inhaber einer Kultur-Legi möchte ich den reduzierten Beitrag direkt neben dem normalen sehen, damit ich weiß, was ich zahle.
11. Als Inhaber einer Kultur-Legi möchte ich die Preisspalte am Kultur-Legi-Logo erkennen, damit ich sie sofort finde.
12. Als Elternteil möchte ich wissen, dass der Beitrag für eine Saison von Juli bis Juni gilt, damit ich die Laufzeit kenne.
13. Als Neumitglied möchte ich wissen, dass ich bei Eintritt ab Januar nur den halben Beitrag zahle, damit ich den Einstiegszeitpunkt planen kann.
14. Als Elternteil möchte ich wissen, dass die Rechnung per E-Mail kommt, damit ich auf die Post achte.
15. Als Mitglied möchte ich die Protokolle vergangener Hauptversammlungen herunterladen, damit ich Beschlüsse nachlesen kann.
16. Als Mitglied möchte ich die neueste Hauptversammlung zuoberst sehen, damit ich das aktuelle Protokoll sofort finde.
17. Als Mitglied möchte ich zu jeder Hauptversammlung Nummer und Datum bzw. Jahr sehen, damit ich das richtige Protokoll erkenne.
18. Als Nutzer eines Smartphones möchte ich alle Tabellen und Karten ohne seitliches Scrollen lesen, damit ich sie unterwegs nutzen kann.
19. Als Nutzer mit Screenreader möchte ich Tabellen mit korrekten Spaltenüberschriften und das Kultur-Legi-Logo mit Textalternative vorfinden, damit die Seite für mich verständlich ist.
20. Als Nutzer mit Tastatur möchte ich alle Download-Links per Tab erreichen und mit Enter auslösen, damit ich keine Maus brauche.
21. Als Vereinsverantwortlicher möchte ich eine neue Hauptversammlung durch eine neue Zeile in einer Datendatei hinzufügen, damit ich kein HTML bearbeiten muss.
22. Als Vereinsverantwortlicher möchte ich Beiträge in einer Datendatei ändern, damit Preisänderungen schnell gehen.
23. Als Vereinsverantwortlicher möchte ich Personen der Vereinsführung in einer Datendatei ändern, damit Vorstandswechsel einfach sind.
24. Als Vereinsverantwortlicher möchte ich, dass ein Tippfehler in den Daten (z. B. fehlende Protokolldatei) den Bau mit einer klaren Meldung abbricht, damit keine kaputten Links veröffentlicht werden.
25. Als Vereinsverantwortlicher möchte ich, dass alle Dokumente und Bilder im Projekt liegen, damit die Seite auch nach Abschaltung der alten Seite vollständig ist.
26. Als Vereinsverantwortlicher möchte ich, dass die Seite ohne Anmeldeformular und Kontaktformular auskommt, damit keine Daten erhoben werden.
27. Als Besucher möchte ich, dass die Seite weiterhin unter „Über uns" im Menü und unter der bisherigen Adresse erreichbar ist, damit bestehende Links funktionieren.
28. Als Besucher möchte ich, dass Kopf- und Fußzeile sowie der Stil der übrigen Seiten erhalten bleiben, damit die Seite einheitlich wirkt.

## User Acceptance Tests

1. Given die Seite „Über uns" ist geöffnet, when ich von oben nach unten lese, then erscheinen die Abschnitte in der Reihenfolge Vereinsführung, Wir stehen für, Mitgliedsbeiträge, Hauptversammlungen.
2. Given die Seite ist geöffnet, when ich den ersten Abschnitt ansehe, then sehe ich drei Karten mit Foto, Name und Funktion: Carsten Lex (Präsident), Hürriyet Celiksap (Finanzen), Claudio Cioce (J+S Coach), und keinen Text „Verantwortlich für folgende Themen".
3. Given die Seite ist bei 375 px Breite geöffnet, when ich zur Vereinsführung scrolle, then stehen die Karten untereinander und die Seite scrollt nicht seitlich.
4. Given die Seite ist bei Desktop-Breite geöffnet, when ich die Vereinsführung ansehe, then stehen die drei Karten nebeneinander, mit gleich großen Fotos ohne Verzerrung.
5. Given die Seite ist geöffnet, when ich „Wir stehen für" lese, then sind neun Grundsätze mit Titel und Erläuterung im Wortlaut der alten Seite sichtbar.
6. Given ich bin am Ende von „Wir stehen für", when ich den Link „Statuten" auslöse, then lädt sich ein lesbares PDF herunter oder öffnet sich.
7. Given die Seite ist geöffnet, when ich den Abschnitt Mitgliedsbeiträge ansehe, then steht über der Tabelle ein Einleitungstext mit Saison Juli bis Juni, halbem Beitrag ab Januar und Rechnung per E-Mail.
8. Given die Beitragstabelle ist sichtbar, when ich die Zeilen prüfe, then gibt es 11 Zeilen (U6, U8, U10, U12, U14, U16, U18, U22, Damen, Herren, Just-for-Fun) mit den Beträgen der alten Seite, z. B. U6 CHF 154 / Kultur-Legi CHF 104 und Herren CHF 452 / Kultur-Legi CHF 302.
9. Given die Beitragstabelle ist sichtbar, when ich die Spalte Jahrgänge bei Damen, Herren und Just-for-Fun ansehe, then steht dort ein Strich „–" und keine leere Zelle.
10. Given die Beitragstabelle ist sichtbar, when ich die Kopfzelle der Kultur-Legi-Spalte ansehe, then zeigt sie das Kultur-Legi-Logo mit der Textalternative „Kultur-Legi".
11. Given die Seite ist bei 375 px Breite geöffnet, when ich die Beitragstabelle ansehe, then sind alle Werte lesbar und zuordenbar, ohne dass die Seite seitlich scrollt.
12. Given die Seite ist geöffnet, when ich den Abschnitt Hauptversammlungen ansehe, then zeigt die Tabelle die Spalten HV, Datum und Protokoll, keine Spalte „Weitere Unterlagen".
13. Given die Hauptversammlungstabelle ist sichtbar, when ich die Reihenfolge prüfe, then steht die 9. HV (2026) oben und die 2. HV (08.05.2019) unten.
14. Given die Hauptversammlungstabelle ist sichtbar, when ich die Datumsspalte bei 2022 bis 2026 ansehe, then steht nur das Jahr; bei 2019, 2020 und 2021 das volle Datum.
15. Given die Hauptversammlungstabelle ist sichtbar, when ich bei jeder der acht Zeilen das Protokoll auslöse, then öffnet bzw. lädt sich das jeweils richtige PDF.
16. Given ich benutze nur die Tastatur, when ich mit Tab durch die Seite gehe, then erreiche ich Statuten-Link und alle Protokoll-Links mit sichtbarem Fokus und kann sie mit Enter auslösen.
17. Given die Seite ist geöffnet, when ich nach Anmeldung, Kontaktformular, „Basketball in Arbon, Amriswil und Umgebung", „Unterstützen auch Sie die Jugendarbeit", Links oder „Follow us" suche, then finde ich nichts davon.
18. Given alle Links der Seite, when ich sie prüfe, then verweist keiner auf pirates-basketball.ch.
19. Given eine Zeile in der Hauptversammlungsdatei verweist auf ein nicht vorhandenes Protokoll, when die Seite gebaut wird, then bricht der Bau mit einer Meldung ab, die die Zeile nennt.
20. Given ich ergänze in der Hauptversammlungsdatei eine Zeile samt PDF, when die Seite neu gebaut wird, then erscheint die neue HV ohne weitere Änderung an der richtigen Stelle der Tabelle.
21. Given die Menüleiste, when ich „Über uns" auswähle, then lande ich auf der Adresse `/about/`.
22. Given die Seiten Startseite, Kontakt, Impressum und Datenschutz, when ich sie nach der Änderung öffne, then sind sie unverändert.

## Definition of Done

- Alle User Acceptance Tests sind bestanden.
- Die Wortlaute von „Wir stehen für" und dem Beitragstext stimmen mit der alten Seite überein.
- Beträge, Namen und Datumsangaben wurden vom Vereinsverantwortlichen gegengeprüft.
- Alle Dokumente und Bilder liegen im Projekt; es gibt keinen Link zur alten Vereinsseite.
- Die Seite ist bei 375 px Breite ohne seitliches Scrollen bedienbar und per Tastatur nutzbar.
- Der Bau endet ohne Fehler und ohne Warnungen.
- Kein Rückschritt bei Startseite, Kontakt, Impressum, Datenschutz, Kopf- und Fußzeile.
- Die Einwilligung der drei Personen für die Veröffentlichung ihrer Fotos ist geklärt.
- Eine kurze Pflegeanleitung für Beiträge, Vorstand und Hauptversammlungen liegt vor.

## Out of Scope

- Anmeldung, Anmeldeformular und Kontaktformular.
- Der Einleitungsblock „Basketball in Arbon, Amriswil und Umgebung" und der bisherige Werbetext.
- „Unterstützen auch Sie die Jugendarbeit", Linkliste (Swiss Basketball, ProBasket u. a.) und „Follow us".
- Jahresbericht, Bilanz, Erfolgsrechnung und Budget der HV 2019.
- Leitbild, Trainerseite, Teams, Galerie, Anfahrt und Sponsoren der alten Seite.
- Ergänzung der Tagesdaten der HV 2022 bis 2026; sie werden vom Vereinsverantwortlichen später nachgetragen.
- Abschaltung oder Umleitung der alten Vereinsseite.
- Rechtsprüfung der Kultur-Legi-Logo-Nutzung.

## Further Notes

- Quelle der Inhalte ist https://www.pirates-basketball.ch/de/contact/default/index?schema=contact. Die Wortlaute von „Wir stehen für" und dem Beitragstext wurden in der Planung nur sinngemäß erfasst und müssen bei der Umsetzung im Original nachgelesen werden.
- Auf der alten Seite gibt es keine eigene Erklärung zur Kultur-Legi; die zweite Preisspalte heißt dort „Beitrag in CHF für Kultur-Legi" und wird als Kultur-Legi-Preis gelesen.
- Auf der alten Seite hat die 9. HV nur das Jahr 2026, die HV 2022 bis 2025 ebenfalls nur das Jahr.
- Offene Frage: Die drei Porträtfotos stammen von der Trainerseite der alten Seite. Ob sie für einen Quadratausschnitt taugen, zeigt sich erst beim Zuschneiden.
- Offene Frage: Das Kultur-Legi-Logo liegt unter `assets/img/kulturlegi.png`; ob der Verein es verwenden darf, klärt der Verein.

---

## Technical Annex
> Written against codebase as of: 2026-11-09 (commit 6a5c06e)

### Architectural Decisions

- **Seite:** `content/about.md` bleibt (`url: /about/`, Titel „Über uns", `showDate: false`). Der Fließtext wird entfernt. Die Seite enthält nur noch die vier Abschnitte. Der Menüeintrag in `hugo.toml` (`pageRef = "about"`) bleibt unverändert.
- **Reihenfolge in der Seite:** Vereinsführung, Wir stehen für (Markdown in `about.md`, mit Statuten-Link am Ende), Mitgliedsbeiträge, Hauptversammlungen. Die datengetriebenen Abschnitte werden über Partials eingebunden. Da das Blowfish-Theme-Layout `single.html` nicht verändert werden soll (Theme-Ordner bleibt unberührt), wird entweder ein Projekt-Layout `layouts/_default/single.html` ergänzt, das nur für `about` greift (z. B. über `layout: ueber-uns` im Front Matter und `layouts/_default/ueber-uns.html`), oder die Partials werden über Shortcodes im Markdown eingebunden. Empfehlung: eigenes Layout `layouts/_default/ueber-uns.html` mit Front Matter `layout: ueber-uns`, weil die Reihenfolge der Abschnitte (Daten – Markdown – Daten – Daten) damit fest und übersichtlich bleibt. Offen: „Wir stehen für" bleibt in `about.md`, daher Layout mit `.Content` an der zweiten Stelle bzw. Aufteilung per Shortcodes `vorstand`, `beitraege`, `hauptversammlungen`. Die Entscheidung trifft die Aufgabenplanung nach Blick in das Theme-`single.html`.
- **Datendateien** (Prior Art: `data/trainingszeiten.yaml`, `data/hallen.yaml`):
  - `data/vorstand.yaml`: Liste mit `name`, `funktion`, `foto` (Pfad unter `assets/img/vorstand/`).
  - `data/beitraege.yaml`: `einleitung` (Text), `kulturlegi_logo` (Pfad), `zeilen` mit `team`, `jahrgaenge` (optional, leer ergibt „–"), `beitrag`, `beitrag_kulturlegi`.
  - `data/hauptversammlungen.yaml`: Liste mit `nummer`, `datum` (Text: Jahr oder volles Datum), `protokoll` (Dateiname unter `static/dokumente/`), in Pflegereihenfolge neueste zuerst.
- **Partials:** `layouts/partials/vorstand.html`, `layouts/partials/beitraege.html`, `layouts/partials/hauptversammlungen.html`, nach dem Muster von `layouts/partials/trainingszeiten.html` (Tabelle mit `role`-Attributen und `data-label` für die mobile Darstellung; Fehler per `errorf` bei ungültigen Daten).
- **Validierung zur Bauzeit:** `hauptversammlungen.html` prüft pro Zeile mit `fileExists`, dass die Protokolldatei existiert, und bricht sonst mit `errorf` und Zeilenbezug ab. Gleiches für `foto` in `vorstand.html` (über `resources.Get`) und das Logo.
- **Dateien:** PDFs unter `static/dokumente/` (`statuten-2026.pdf`, `hv-<nummer>-protokoll.pdf` o. ä.), damit sie unter stabilen URLs ausgeliefert werden. Fotos der Vereinsführung unter `assets/img/vorstand/`, einheitlich quadratisch (ca. 400 × 400 px), per Hugo-Ressourcen (`.Fill`) bereitgestellt. Das Logo liegt bereits in `assets/img/kulturlegi.png` (162 × 60 px).
- **Download-Links:** Statuten und Protokolle als einfache Links auf die PDFs mit `download`-Attribut bzw. `target="_blank" rel="noopener"`; kein Skript nötig.
- **Styles:** Neue Klassen in `assets/css/custom.css`, angelehnt an `.trainingszeiten-*` (Pirates-Farben, mobile Kartendarstellung der Tabellen unter ca. 640 px, sichtbarer Fokus). Vorstandskarten per CSS-Grid (3 Spalten Desktop, 1 Spalte Mobil).
- **Barrierefreiheit:** `<th scope="col">`, Logo als `<img alt="Kultur-Legi">` in der Kopfzelle, Fotos mit `alt` aus dem Namen, Links mit sprechendem Text („Protokoll 9. HV 2026 herunterladen" o. ä.).
- **Nicht ändern:** `themes/` bleibt unverändert; Wasserzeichen und Hero der Startseite bleiben unberührt.
- **Quelle der Dateien:** Statuten-PDF, neun Protokolle und drei Porträts werden von den auf der alten Seite genannten Adressen heruntergeladen. Die Protokoll-Datei der 8. HV (2025) heißt dort `protokollhv2025.pdf`, die der 9. HV (2026) `hv-protokollpriates2026.pdf`; die lokalen Dateinamen werden vereinheitlicht.

### Automated Testing Decisions

- Ein gutes Test prüft nur das gebaute Ergebnis (HTML und ausgelieferte Dateien), nicht die Vorlagen selbst.
- Prior Art: `scripts/check-hero.sh` baut die Seite in ein temporäres Verzeichnis und prüft `public`-HTML mit `grep`; der Workflow `.github/workflows/hugo.yml` ruft es vor dem Deploy auf.
- Neues Skript `scripts/check-ueber-uns.sh` (Bash, Integrationstest auf Build-Ebene), eingebunden in den Workflow neben dem Hero-Check. Es prüft im gebauten `about/index.html`:
  - die Reihenfolge der vier Abschnittsüberschriften,
  - genau 3 Vorstandskarten mit den erwarteten Namen,
  - 11 Zeilen in der Beitragstabelle und den Strich bei leeren Jahrgängen,
  - das Kultur-Legi-Logo mit `alt`,
  - 8 Zeilen in der HV-Tabelle, neueste zuerst, und keine Spalte „Weitere Unterlagen",
  - dass jeder `href` auf ein PDF im Ergebnis existiert (`public/dokumente/...`) und kein Link auf `pirates-basketball.ch` zeigt,
  - Abwesenheit der gestrichenen Inhalte (Anmeldung, „Follow us" u. a.).
- Negativtest: Das Skript wird einmal gezielt provoziert (Protokolldatei umbenannt), sodass der Bau fehlschlägt, und danach zurückgenommen.
- Keine Unit-Tests für Partials; die manuellen Prüfungen (375 px, Tastaturbedienung, Lesbarkeit) bleiben manuell.
