## Problem Statement

Die Kopfzeile der Pirates-Website wirkt zu klein: Das Logo und der Schriftzug «Pirates Basketball» sind unauffällig. Im Menü steht ein «News»-Eintrag, obwohl die News derzeit nicht gepflegt werden sollen, und die News erscheinen zusätzlich auf der Startseite. Interessierte finden ausserdem nirgends eine Kontaktseite mit Ansprechperson, E-Mail und den Adressen der Trainingshallen, obwohl die «Über uns»-Seite sie dazu auffordert, Kontakt aufzunehmen.

## Solution

Die Kopfzeile wird überarbeitet: Logo und Schriftzug werden grösser dargestellt, der Menüpunkt «News» verschwindet vorerst, und ein neuer Menüpunkt «Kontakt» führt zu einer neuen Seite `/kontakt/`. Die News verschwinden auch von der Startseite, die Seite `/news/` und die Beiträge bleiben aber gebaut und per direkter Adresse erreichbar. Die Kontaktseite zeigt Vereinsadresse, E-Mail, die Ansprechperson (Präsident mit Telefonnummer) und die Trainingshallen, analog zur Kontaktseite der bisherigen Vereinswebsite. Die Strassenadressen der Hallen trägt der Verein später selbst ein.

## User Stories

1. Als Besucher möchte ich ein grösseres Logo in der Kopfzeile sehen, damit ich sofort erkenne, auf wessen Website ich bin.
2. Als Besucher möchte ich den Schriftzug «Pirates Basketball» besser lesen können, damit der Vereinsname auffällt.
3. Als Besucher am Handy möchte ich, dass Logo, Schriftzug und Menü-Knopf trotz grösserem Logo in einer Zeile Platz haben, damit die Kopfzeile nicht umbricht oder überläuft.
4. Als Besucher am Computer möchte ich im Menü die Einträge Home, Über uns und Kontakt sehen, damit ich schnell zu den wichtigen Informationen komme.
5. Als Besucher möchte ich keinen «News»-Eintrag im Menü sehen, damit ich nicht auf eine Seite geführt werde, die zurzeit nicht gepflegt wird.
6. Als Besucher möchte ich auf der Startseite keine News-Vorschau und keinen «Zeige Mehr»-Link sehen, damit die Startseite auf Trainingszeiten und Verein konzentriert bleibt.
7. Als Besucher möchte ich über den Menüpunkt «Kontakt» auf eine eigene Kontaktseite gelangen, damit ich den Verein erreichen kann.
8. Als Interessent möchte ich auf der Kontaktseite die Vereinsadresse sehen, damit ich weiss, wohin ich Post senden kann.
9. Als Interessent möchte ich auf der Kontaktseite eine E-Mail-Adresse anklicken können, damit sich mein Mailprogramm direkt öffnet.
10. Als Interessent möchte ich die Ansprechperson (Präsident) mit Name und Telefonnummer sehen, damit ich den Verein telefonisch erreichen kann.
11. Als Besucher am Handy möchte ich die Telefonnummer antippen können, damit ich direkt anrufen kann.
12. Als Interessent möchte ich auf der Kontaktseite alle Trainingshallen aufgelistet sehen, damit ich weiss, wo trainiert wird.
13. Als Interessent möchte ich zu jeder Halle die Strassenadresse finden, damit ich den Weg dorthin planen kann.
14. Als Vereinsverantwortlicher möchte ich die noch fehlenden Hallenadressen später einfach nachtragen können, damit die Seite vervollständigt werden kann, ohne sie neu aufzubauen.
15. Als Vereinsverantwortlicher möchte ich, dass die Hallenbezeichnungen mit den Orten in der Trainingszeiten-Tabelle übereinstimmen, damit Besucher die Halle aus der Tabelle auf der Kontaktseite wiederfinden.
16. Als Vereinsverantwortlicher möchte ich die News später mit minimalem Aufwand wieder einschalten können, damit nichts neu gebaut werden muss.
17. Als Vereinsverantwortlicher möchte ich, dass bestehende News-Beiträge nicht gelöscht werden, damit der Inhalt erhalten bleibt.
18. Als Vereinsverantwortlicher möchte ich, dass das Wasserzeichen, die Farben und die übrige Kopfzeilenleiste unverändert bleiben, damit das Erscheinungsbild konsistent bleibt.
19. Als Besucher möchte ich, dass die «Über uns»-Seite weiterhin erreichbar ist, damit ich mehr über den Verein erfahren kann.
20. Als Besucher möchte ich, dass Impressum und Datenschutz weiterhin in der Fusszeile erreichbar sind, damit die rechtlichen Angaben auffindbar bleiben.
21. Als Verantwortlicher möchte ich, dass die Kontaktdaten auf der Kontaktseite mit denen im Impressum übereinstimmen, damit keine widersprüchlichen Angaben veröffentlicht sind.

## User Acceptance Tests

1. Given die Startseite am Computer (1280 px), when ich die Kopfzeile betrachte, then ist das Logo deutlich grösser als vorher (ca. 1.5-fach) und der Schriftzug «Pirates Basketball» etwas grösser (ca. 1.25-fach).
2. Given eine Handy-Ansicht (375 px), when ich die Kopfzeile betrachte, then stehen Logo, Schriftzug und Menü-Knopf in einer Zeile, ohne dass der Schriftzug überläuft und ohne seitliches Scrollen.
3. Given die Startseite am Computer, when ich das Menü betrachte, then sehe ich genau die Einträge Home, Über uns und Kontakt in dieser Reihenfolge und keinen Eintrag «News».
4. Given die Handy-Ansicht, when ich das Menü öffne, then sehe ich ebenfalls Home, Über uns und Kontakt, aber kein «News».
5. Given die Startseite, when ich nach unten scrolle, then sehe ich nach den Trainingszeiten keine News-Vorschau und keinen Link «Zeige Mehr».
6. Given ich öffne die Adresse `/news/` direkt, when die Seite lädt, then erscheint die News-Übersicht mit den bestehenden Beiträgen wie bisher.
7. Given ich klicke im Menü auf «Kontakt», when die Seite lädt, then gelange ich zu `/kontakt/` mit der Überschrift «Kontakt».
8. Given die Kontaktseite, when ich sie lese, then finde ich die Vereinsadresse «Basketball Oberthurgau Pirates, Tennisstrasse 12, 9320 Arbon».
9. Given die Kontaktseite, when ich auf die E-Mail-Adresse info@pirates-basketball.ch klicke, then öffnet sich ein neues E-Mail an diese Adresse.
10. Given die Kontaktseite, when ich den Abschnitt zur Ansprechperson lese, then steht dort «Carsten Lex, Präsident» mit der Mobilnummer 079 943 15 56.
11. Given die Kontaktseite am Handy, when ich auf die Telefonnummer tippe, then startet der Anruf an +41 79 943 15 56.
12. Given die Kontaktseite, when ich den Hallenabschnitt lese, then sehe ich die fünf Hallen Säntishalle (Arbon), Seegarten (Arbon), Reben 4 (Arbon), ABC-Sporthalle Stacherholz (Arbon) und Turnhalle Freiestrasse (Amriswil).
13. Given die Kontaktseite, when eine Strassenadresse noch nicht eingetragen ist, then ist dies deutlich als Platzhalter erkennbar und die Seite wird trotzdem korrekt dargestellt.
14. Given die fünf Seiten Start, Über uns, Kontakt, Impressum und Datenschutz, when ich sie am Computer und Handy durchsehe, then ist das Wasserzeichen weiterhin sichtbar und die Texte sind gut lesbar.
15. Given die Fusszeile jeder Seite, when ich sie betrachte, then sind die Links «Impressum» und «Datenschutz» weiterhin vorhanden.
16. Given die Seiten Start und Über uns, when ich die Trainingstabellen, den Hero und die Fusszeile betrachte, then sind diese unverändert gegenüber vorher.

## Definition of Done

- Alle User Acceptance Tests sind bestanden.
- Die Seite baut ohne Fehler und ohne Warnungen.
- Kopfzeile, Menü und Kontaktseite sind am Computer (1280 px) und am Handy (375 px) im Browser geprüft.
- Auf dem Handy gibt es kein seitliches Scrollen auf Start, Über uns, Kontakt, Impressum und Datenschutz.
- Die Kontaktseite enthält Vereinsadresse, E-Mail, Ansprechperson mit Telefonnummer und alle fünf Hallen; offene Hallenadressen sind klar als Platzhalter markiert.
- News sind aus Menü und Startseite entfernt, `/news/` und die Beiträge sind weiterhin vorhanden.
- Das Theme-Verzeichnis ist unverändert.
- Keine Regression bei Wasserzeichen, Trainingszeiten, Über uns, Impressum und Datenschutz.

## Out of Scope

- Kontaktformular oder Backend.
- Landkarten, Einbettung von Kartendiensten oder Anfahrtsbeschreibungen.
- Social-Media-Links («Follow us»-Bereich der alten Seite).
- Die Posten «Vize-Präsident*in / Finanzen» (vakant) und weitere Funktionsträger.
- Die Hallen «Dreifachturnhalle Stacherholz» und «Turnhalle Stacherholz (unten)» der alten Seite.
- Ein Wechsel des Kopfzeilen-Layouts (z. B. fixiert oder Hybrid) oder eine neue Farbgebung.
- Das endgültige Eintragen der Strassenadressen der Hallen (macht der Verein später).
- Löschen oder Umschreiben der News-Beiträge sowie das Wiedereinschalten der News.

## Further Notes

- Die Faktoren für Logo (ca. 1.5) und Schriftzug (ca. 1.25) sind Startwerte und sollen sich nach der Sichtprüfung mit je einer Zahl anpassen lassen.
- Die Hallennamen sollen sich an den Bezeichnungen in der Trainingszeiten-Tabelle orientieren; diese sind dort nicht ganz einheitlich geschrieben («Seegarten Turnhalle», «ABC-Sporthalle» / «ABC Sporthalle Stacherholz»). Offen: ob die Tabelle bei dieser Gelegenheit vereinheitlicht werden soll.
- Die Telefonnummer wird bewusst öffentlich gezeigt (Entscheidung des Vereins); der Datenschutzhinweis nennt bereits die Vereinsadresse.
- Die Reihenfolge der Menüpunkte (Home, Über uns, Kontakt) ist ein Vorschlag, nicht ausdrücklich bestätigt.

---

## Technical Annex
> Written against codebase as of: 2026-11-08 (commit 553ced3)

### Architectural Decisions

Feature-Slug: `header-rework-kontakt`. Hugo-Seite mit Blowfish-Theme (nicht verändern, Anpassungen nur im Projekt). Basispfad `/pirates-homepage/`, Sprache `de`.

**Menü (`hugo.toml`)**
- Eintrag `[[menu.main]] name = "News"` (weight 30) entfernen bzw. auskommentieren (mit Hinweis, dass er vorübergehend ausgeblendet ist).
- Neuen Eintrag `[[menu.main]] name = "Kontakt"`, `pageRef = "kontakt"`, `weight = 30` ergänzen. Die Reihenfolge ist damit Home (10), Über uns (20), Kontakt (30). Footer-Menü unverändert.

**News von der Startseite**
- In `layouts/index.html` den Block `<section>{{ partial "recent-articles/main.html" . }}</section>` entfernen oder per Konfiguration abschalten. Bevorzugt: die Zeilen im Template auskommentieren (Hugo-Kommentar `{{/* … */}}`), damit das Wiedereinschalten eine Änderung an einer Stelle ist. Die Parameter `params.homepage.showRecent`, `showRecentItems`, `showMoreLink`, `showMoreLinkDest` in `hugo.toml` können unverändert bleiben (greifen im Hero-Layout nicht, da das Projekt-Template `recent-articles` selbst einbindet; beim Umsetzen prüfen, dass der Hero-Partial nicht ebenfalls News ausgibt).
- `content/news/` bleibt unverändert; keine `draft`- oder `build`-Optionen setzen (Variante A: Seite bleibt gebaut).

**Kopfzeile: Grösse von Logo und Titel**
- Das Theme-Partial `themes/blowfish/layouts/partials/header/basic.html` gibt das Logo als `<img class="logo max-h-20 max-w-20 …" width=½ height=½>` aus und den Titel als `<a class="text-base font-medium truncate …">`. Beides nicht im Theme ändern.
- In `assets/css/custom.css` einen eigenen, kommentierten Block ergänzen, der über CSS-Variablen skaliert, z. B. `--header-logo-scale: 1.5` und `--header-title-scale: 1.25`. Das Logo-`max-h-20`/`max-w-20` (5rem) wird mit höherer Spezifität überschrieben (`header .main-menu img.logo { max-height: calc(5rem * var(--header-logo-scale)); max-width: calc(5rem * var(--header-logo-scale)); }`), der Titel über `header .main-menu a.truncate { font-size: calc(1rem * var(--header-title-scale)); }`. Keine festen Hex-Werte. Falls die Spezifität nicht reicht, alternativ ein Projekt-Override von `partials/header/basic.html` (Kopie in `layouts/partials/header/`) — nur als Rückfallebene.
- Handy: Das Bild hat `width`/`height`-Attribute (halbe Originalgrösse); die Skalierung muss auf schmalen Bildschirmen so begrenzt sein (z. B. Media-Query unter `md`, Titel `min-w-0`/`truncate` bleibt), dass Logo, Titel und Menü-Knopf in einer Zeile bleiben und kein seitliches Scrollen entsteht.
- Das halbtransparente Schwarz der Leiste und das Wasserzeichen (`body::before`) bleiben unberührt.

**Neue Seite `content/kontakt.md`**
- Front Matter analog zu `about.md`/`impressum.md`: `title: "Kontakt"`, `url: /kontakt/`.
- Inhalt: Abschnitt «Vereinsadresse» (Basketball Oberthurgau Pirates, Tennisstrasse 12, 9320 Arbon), E-Mail als `mailto:`-Link (info@pirates-basketball.ch, identisch mit Impressum), Abschnitt «Ansprechperson» (Carsten Lex, Präsident, Mobil 079 943 15 56 als `tel:+41799431556`-Link), Abschnitt «Trainingshallen» mit den fünf Hallen: Säntishalle, Seegarten Turnhalle, Reben 4 Turnhalle, ABC-Sporthalle Stacherholz (alle Arbon) und Turnhalle Freiestrasse (Amriswil), jeweils mit sichtbarem Platzhalter für die Strassenadresse (z. B. «Adresse folgt»).
- Optional: Hallenliste aus `data/trainingszeiten.yaml` ableiten, damit Namen konsistent bleiben. Entscheidung: zunächst statisch im Markdown (einfach, Adressen werden von Hand ergänzt); eine Datendatei `data/hallen.yaml` nur, falls später gewünscht.

**Nicht ändern**: `themes/`, `content/news/`, `layouts/partials/extend-head.html` (Wasserzeichen), `layouts/partials/trainingszeiten.html`, Footer-Menü.

### Automated Testing Decisions

- Das Projekt hat keine automatisierte Testsuite. Verifikation erfolgt über den Hugo-Build und Prüfbefehle gegen die Ausgabe in `public/`.
- Gute Prüfungen testen nur sichtbares Verhalten (gebautes HTML/CSS), nicht die Implementierung.
- Prüfungen (Build ohne Minify für `grep`, Minify-Build als Gate):
  - `hugo --gc --minify` endet mit Exit-Code 0 und ohne Warnungen (`grep -ci warn` = 0).
  - `public/kontakt/index.html` existiert und enthält `mailto:info@pirates-basketball.ch` und `tel:+41799431556`.
  - Die Menüs im gebauten HTML (z. B. `public/index.html`) enthalten Links zu `/pirates-homepage/about/` und `/pirates-homepage/kontakt/`, aber keinen Link zu `/pirates-homepage/news/` ausserhalb von `public/news/`.
  - `public/index.html` enthält keinen News-Block («Zeige Mehr» und «Neue Beiträge» fehlen); `public/news/index.html` existiert weiterhin.
  - `git status --porcelain themes/` liefert keine Ausgabe.
  - Im neuen CSS keine Hex-Farbwerte.
- Manuelle Prüfung im Browser (`hugo server`) bei 375 px und 1280 px für Grösse, Zeilenumbruch und Lesbarkeit (nicht automatisierbar). Vorbild: die Prüfungen des Features `pirates-logo-watermark`.
