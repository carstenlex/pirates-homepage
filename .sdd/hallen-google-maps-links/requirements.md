## Problem Statement

Besucher der Pirates-Website sehen in der Trainingstabelle auf der Startseite und auf der Kontaktseite, in welchen Hallen trainiert wird, können die Hallen aber nicht direkt auf einer Karte finden. Wer zum ersten Mal zu einem Training kommt (Kinder, Eltern, neue Spielerinnen und Spieler), muss die Adresse von Hand in eine Karten-App kopieren. In der Tabelle fehlt die Strassenadresse sogar ganz. Ausserdem sind die Hallennamen uneinheitlich geschrieben («Seegarten», «Seegarten, Arbon», «Seegarten Turnhalle, Arbon»), und die Halle «Bergli» ist weder auf der Kontaktseite aufgeführt noch hat sie eine Adresse.

## Solution

Jede Trainingshalle wird mit einem einfachen Link zu Google Maps verknüpft. Auf der Kontaktseite wird die Strassenadresse jeder Halle zum Link. In der Trainingstabelle wird der Hallenname zum Link. Ein Klick öffnet Google Maps in einem neuen Tab (auf dem Handy startet die Maps-App) und zeigt die Adresse. Es gibt keine eingebettete Karte und keine Skripte von Google, daher fliessen beim blossen Seitenaufruf keine Daten an Google. Die Hallennamen werden auf der ganzen Seite einheitlich geschrieben, und die Halle «Bergli» (Römerstrasse 15, Arbon) wird als siebte Halle aufgenommen. Die Datenschutzerklärung erhält einen kurzen Hinweis auf die Maps-Links.

## User Stories

1. As a Besucher auf der Kontaktseite, I want die Strassenadresse jeder Halle anklicken zu können, so that ich die Halle ohne Abtippen in Google Maps sehe.
2. As a Besucher in der Trainingstabelle, I want den Hallennamen in der Spalte «Ort» anklicken zu können, so that ich vom Trainingstermin direkt zur Halle navigieren kann.
3. As a Elternteil mit Handy, I want, dass der Link die Maps-App öffnet, so that ich mich direkt zur Halle führen lassen kann.
4. As a Besucher, I want, dass sich der Link in einem neuen Tab öffnet, so that die Vereinsseite offen bleibt.
5. As a Besucher, I want, dass der Link als Link erkennbar ist, so that ich weiss, dass ich klicken kann.
6. As a Besucher, I want, dass jede Halle auf der ganzen Seite gleich heisst, so that ich die Halle in Tabelle und Kontaktseite wiedererkenne.
7. As a Besucher, I want, dass «Stacherholz (unten)» und «ABC-Sporthalle Stacherholz» auf verschiedene Punkte zeigen, so that ich nicht zur falschen Halle gehe.
8. As a Spieler der Freitagsgruppe, I want die Halle «Bergli» mit Adresse zu finden, so that ich weiss, wohin ich zum Training gehen muss.
9. As a Besucher, I want, dass die Kontaktseite alle sieben Hallen auflistet, so that ich alle Trainingsorte an einer Stelle sehe.
10. As a Besucher auf dem Handy, I want, dass die Karten der Trainingstabelle weiterhin gut lesbar bleiben, so that ich die Links bequem antippen kann.
11. As a Besucher, I want, dass die Vereinsadresse weiterhin reiner Text bleibt, so that sie mit dem Impressum übereinstimmt.
12. As a Datenschutzbewusster, I want zu wissen, dass erst der Klick auf einen Link Google Maps öffnet, so that ich entscheiden kann, ob ich klicke.
13. As a Datenschutzbewusster, I want, dass die Seite beim Aufruf keine Inhalte von Google nachlädt, so that keine Daten ohne mein Zutun an Google gehen.
14. As a Vereinsverantwortlicher, I want, die Adresse einer Halle an einer zentralen Stelle für die Tabelle zu pflegen, so that ich bei einer Änderung nicht 19 Tabellenzeilen anpassen muss.
15. As a Vereinsverantwortlicher, I want, eine neue Tabellenzeile nur mit einem Hallen-Schlüssel anzulegen, so that ich keine Adresse und keine URL abtippen muss.
16. As a Vereinsverantwortlicher, I want, die Kontaktseite einfach als Text zu bearbeiten, so that ich dafür keine Programmierkenntnisse brauche.
17. As a Vereinsverantwortlicher, I want, dass eine Halle ohne Eintrag den Bau nicht stillschweigend kaputt macht, so that Tippfehler im Schlüssel auffallen.

## User Acceptance Tests

1. Given die Kontaktseite, when ich den Abschnitt «Trainingshallen» ansehe, then stehen dort sieben Hallen (Säntishalle, Seegarten Turnhalle, Reben 4 Turnhalle, ABC-Sporthalle Stacherholz, Stacherholz (unten), Bergli, Turnhalle Freiestrasse) mit je einer Strassenadresse.
2. Given die Kontaktseite, when ich auf die Adresse «Thomas-Bornhauserstrasse 14» klicke, then öffnet sich in einem neuen Tab Google Maps mit der Suche «Thomas-Bornhauserstrasse 14, 9320 Arbon».
3. Given die Kontaktseite, when ich auf die Adresse «Römerstrasse 15» (Bergli) klicke, then öffnet sich Google Maps mit der Suche «Römerstrasse 15, 9320 Arbon».
4. Given die Kontaktseite, when ich auf die Adresse der Turnhalle Freiestrasse klicke, then sucht Google Maps nach «Freiestrasse 32, 8580 Amriswil».
5. Given die Kontaktseite, when ich die Links für «ABC-Sporthalle Stacherholz» (Stacherholzstrasse 38) und «Stacherholz (unten)» (Stacherholzstrasse 34) öffne, then zeigen sie auf zwei verschiedene Adressen.
6. Given die Kontaktseite, when ich die Vereinsadresse «Tennisstrasse 12, 9320 Arbon» ansehe, then ist sie kein Link.
7. Given die Trainingstabelle auf der Startseite am Computer, when ich in der Spalte «Ort» auf «Säntishalle, Arbon» klicke, then öffnet sich in einem neuen Tab Google Maps mit der Adresse der Säntishalle.
8. Given die Trainingstabelle, when ich alle Zeilen ansehe, then ist in jeder Zeile der Hallenname in der Spalte «Ort» ein Link, und die Namen lauten ausschliesslich: Säntishalle, Arbon; Seegarten Turnhalle, Arbon; Reben 4 Turnhalle, Arbon; ABC-Sporthalle Stacherholz, Arbon; Stacherholz (unten), Arbon; Bergli, Arbon; Turnhalle Freiestrasse, Amriswil.
9. Given die Trainingstabelle, when ich die Zeilen «Di 20:15 U22 Mädchen» und «Mi 18:30 U16 Jungs» ansehe, then steht dort «Seegarten Turnhalle, Arbon» (vorher «Seegarten» bzw. «Seegarten, Arbon»).
10. Given die Trainingstabelle, when ich die Zeile «Fr 17:30 U14 Jungs» ansehe, then steht dort «Bergli, Arbon» als Link auf «Römerstrasse 15, 9320 Arbon».
11. Given die Startseite am Handy (375 px), when ich die Trainingszeiten ansehe, then erscheinen sie weiterhin als Karten, der Hallenname ist als Link erkennbar und antippbar, und die Seite scrollt nicht seitlich.
12. Given die Trainingstabelle, when ich mit der Maus über einen Hallennamen fahre, then erkenne ich ihn als Link (Unterstreichung oder Linkfarbe).
13. Given die Datenschutzerklärung, when ich sie lese, then steht dort ein Hinweis, dass die Hallenadressen auf Google Maps verlinkt sind, dass erst der Klick Google Maps öffnet und dass dann die Datenschutzbestimmungen von Google gelten.
14. Given die Seiten Startseite und Kontakt, when ich die geladenen Ressourcen prüfe, then werden keine Skripte, Frames oder Schriften von Google geladen.
15. Given die Startseite, when ich Hero, Trainingstermine (Tag, Zeit, Team), Hinweistext «In den Schulferien finden keine offiziellen Trainings statt.», Fusszeile und Wasserzeichen ansehe, then sind sie unverändert.

## Definition of Done

- Alle User Acceptance Tests bestehen.
- Auf der Kontaktseite und in der Trainingstabelle sind alle Hallen mit Google Maps verlinkt; der Link öffnet sich in einem neuen Tab.
- Die Hallennamen sind auf beiden Seiten einheitlich geschrieben, und «Bergli» ist enthalten.
- Die Datenschutzerklärung enthält den Hinweis auf die Maps-Links, und das Datum «Stand» ist aktualisiert.
- Der Build läuft ohne Fehler und ohne Warnungen.
- Die Darstellung am Computer (1280 px) und am Handy (375 px) ist im Browser geprüft.
- Keine Regression bei Menü, Hero, Wasserzeichen, Fusszeile, Impressum und News-Seiten.
- Das Theme ist nicht verändert.

## Out of Scope

- Eingebettete Karten (iframe) oder Google-APIs.
- Ein Link für die Vereinsadresse.
- Anzeige der Strassenadresse in der Trainingstabelle.
- Routenplanung, Wegbeschreibungen oder Parkplatzinformationen.
- Andere Kartendienste (OpenStreetMap, Apple Karten).
- Änderungen an Tag, Zeit und Team der Trainingstermine.
- Ein Shortcode oder eine Datendatei für die Kontaktseite (dort bleiben es direkte Markdown-Links).

## Further Notes

- Die Adressen stehen an zwei Stellen (Kontaktseite und Hallen-Datei) und müssen bei einer Änderung beide angepasst werden. Das wurde bewusst in Kauf genommen.
- Die Datenschutzerklärung sagt bisher, dass keine Inhalte von Drittanbietern eingebunden werden. Das bleibt richtig, weil nur verlinkt wird. Der neue Hinweis ergänzt dies.
- Beim Vorgänger-Feature hat das Theme einen Markdown-Link mit `tel:` zu `#ZgotmplZ` umgeschrieben. Bei `https://`-Links ist das nicht zu erwarten, sollte aber im Build geprüft werden.
- Die Postleitzahlen (Arbon 9320, Amriswil 8580) stehen nur in den Links, nicht im sichtbaren Text.
- Die Browser-Prüfungen waren in den bisherigen Features nicht automatisierbar und müssen von Hand erfolgen.

---

## Technical Annex
> Written against codebase as of: 2026-11-08 (commit ca07d05)

### Architectural Decisions

- **Neue Datei `data/hallen.yaml`:** Map von Schlüssel zu Halle. Felder: `name` (Anzeigename ohne Ort), `ort`, `strasse`, `plz`. Schlüssel: `saentishalle`, `seegarten`, `reben4`, `abc-stacherholz`, `stacherholz-unten`, `bergli`, `freiestrasse`. Beispiel: `bergli: { name: "Bergli", strasse: "Römerstrasse 15", plz: "9320", ort: "Arbon" }`.
- **`data/trainingszeiten.yaml`:** Das Feld `ort` jeder Zeile wird durch `halle: <schluessel>` ersetzt. Die übrigen Felder und der Hinweistext bleiben.
- **`layouts/partials/trainingszeiten.html`:** In der Spalte «Ort» wird `hugo.Data.hallen` über den Schlüssel aufgelöst und ein `<a>` mit `href` = `https://www.google.com/maps/search/?api=1&query=<strasse>, <plz> <ort>` (per `urlquery`/`querify` kodiert), `target="_blank"`, `rel="noreferrer"` und Text «<name>, <ort>» ausgegeben. Fehlt der Schlüssel in `hallen.yaml`, bricht der Build mit `errorf` und einer klaren Meldung ab (Story 17). Das Attribut `data-label="Ort"` bleibt, weil die Handy-Karten es per CSS nutzen.
- **`assets/css/custom.css`:** Nur falls das Theme Links in der Tabelle nicht erkennbar darstellt, eine kleine Regel (z. B. `text-decoration: underline` oder Linkfarbe über eine bestehende Theme-Variable). Keine festen Hex-Werte. Keine Theme-Änderung.
- **`content/kontakt.md`:** Der Abschnitt «Trainingshallen» bekommt «Bergli, Arbon: Römerstrasse 15» als siebten Eintrag. Jede Strassenadresse wird zu einem Markdown-Link mit URL derselben Form (Leerzeichen als `+`, Komma als `%2C`). Das Theme (`render-link.html`) setzt `target="_blank" rel="noreferrer"` für `https:`-Links bereits selbst (`externalLinkForceNewTab` standardmässig `true`). Der Eintrag «Stacherholz (unten)» heisst so auf beiden Seiten.
- **`content/datenschutz.md`:** Neuer Abschnitt `###` (z. B. «Links zu Google Maps») mit dem Hinweis. Zuerst prüfen, ob schon ein Abschnitt zu externen Links existiert (nach aktuellem Stand nicht). Der Satz «es werden keine Inhalte von Drittanbietern eingebunden» bleibt. «Stand:» auf das Änderungsdatum setzen.
- **Zuordnung der bisherigen Freitexte:** «Säntishalle, Arbon» → `saentishalle`; «Seegarten», «Seegarten, Arbon», «Seegarten Turnhalle, Arbon» → `seegarten`; «Reben 4 Turnhalle, Arbon» → `reben4`; «ABC-Sporthalle Stacherholz, Arbon» und «ABC Sporthalle Stacherholz, Arbon» → `abc-stacherholz`; «Untere Stacherholz, Arbon» → `stacherholz-unten`; «Bergli» → `bergli`; «Turnhalle Freiestrasse, Amriswil» → `freiestrasse`.
- **Adressen:** Säntishalle: Thomas-Bornhauserstrasse 14; Seegarten: Romanshornerstrasse 84; Reben 4: Rebenstrasse 4; ABC-Sporthalle: Stacherholzstrasse 38; Stacherholz (unten): Stacherholzstrasse 34; Bergli: Römerstrasse 15 (alle 9320 Arbon); Freiestrasse: Freiestrasse 32, 8580 Amriswil.
- Keine Änderung an `themes/`, `hugo.toml`, `layouts/index.html` und der Vereinsadresse.

### Automated Testing Decisions

- Das Projekt hat keine Testsuite. Geprüft wird wie bisher über den Hugo-Build und `grep`-Prüfungen gegen einen unminifizierten Build (`hugo --gc --cleanDestinationDir`), plus `hugo --gc --minify > build.log` (Exit 0, keine Warnungen).
- Gute Prüfungen testen nur die erzeugte Ausgabe: Anzahl der `google.com/maps/search`-Links je Seite (`grep -o … | wc -l`; Kontaktseite 7, Startseite 19), `target="_blank"` an jedem davon, Fehlen der alten Freitexte («Untere Stacherholz», «ABC Sporthalle»), Vorhandensein von «Bergli», Anzahl verschiedener Link-Ziele auf der Kontaktseite (7).
- Der Fehlerfall bei unbekanntem Hallen-Schlüssel wird von Hand geprüft: temporär einen falschen Schlüssel eintragen, der Build muss abbrechen.
- Das Verhalten im Browser (Darstellung am Computer und Handy, Antippen, kein seitliches Scrollen) wird von Hand geprüft.
- Vorbild: die Prüfbefehle der Features `trainingstabelle-startseite` und `header-rework-kontakt`.
