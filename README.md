# Pirates Basketball – Homepage

Statische Homepage der Pirates Basketball, gebaut mit [Hugo](https://gohugo.io/) und dem Theme [Blowfish](https://github.com/nunocoracao/blowfish). Jeder Push auf `main` veröffentlicht die Seite automatisch auf GitHub Pages:

<https://carstenlex.github.io/pirates-homepage/>

## Einmalige Einrichtung (manuell)

1. Auf GitHub ein **öffentliches** Repository `carstenlex/pirates-homepage` anlegen (GitHub Pages ist im Free-Plan nur für öffentliche Repositories verfügbar).
2. Lokal den Remote hinzufügen und pushen:
   ```
   git remote add origin https://github.com/carstenlex/pirates-homepage.git
   git push -u origin main
   ```
3. Im Repository unter **Settings → Pages → Build and deployment → Source** den Wert **GitHub Actions** wählen.

Es werden keine Secrets benötigt.

## Lokale Vorschau

Das Theme ist ein Git-Submodule. Beim Klonen daher:

```
git clone --recurse-submodules https://github.com/carstenlex/pirates-homepage.git
```

(Bei einem bereits geklonten Repository: `git submodule update --init`.)

Hugo **extended** in der festgelegten Version installieren (siehe unten), dann:

```
hugo server
```

Die Seite ist unter <http://localhost:1313/pirates-homepage/> erreichbar.

## Neuen News-Beitrag hinzufügen

```
hugo new content news/mein-beitrag.md
```

In der erzeugten Datei `draft: true` auf `draft: false` ändern (oder die Zeile entfernen), Titel und Text ergänzen und auf `main` mergen. Der Beitrag erscheint automatisch in der News-Liste (neueste zuerst). Weitere Änderungen an der Konfiguration sind nicht nötig.

Titel und Beschreibung der Seite stehen zentral in `hugo.toml`.

## Impressum und Datenschutz

Die Texte stehen in `content/impressum.md` und `content/datenschutz.md` (das Datum in der Zeile „Stand“ von Hand anpassen). Die Links im Seitenfuss kommen aus den Einträgen `[[menu.footer]]` in `hugo.toml`. Das Hauptmenü bleibt davon unberührt. Die Texte sind Entwürfe und müssen vom Verein geprüft werden. Wird die Seite um Funktionen erweitert (Analytics, Formulare, eingebettete Medien), muss die Datenschutzerklärung angepasst werden.

## Trainingszeiten pflegen

Die Trainingszeiten auf der Startseite stehen in `data/trainingszeiten.yaml`. Das Layout muss dafür nicht angepasst werden. Aufbau:

```yaml
tabellen:
  - titel: "Trainingszeiten Saison 2026/2027"
    id: training            # optional: Anker, erreichbar über /#training
    zeilen:
      - { tag: "Mo", zeit: "17:00–18:30", team: "U12 mit Olivier", halle: saentishalle }
  - titel: "Amriswil – Trainingszeiten"
    zeilen: [...]
    hinweis: "In den Schulferien finden keine offiziellen Trainings statt."   # optional: Absatz unter der Tabelle
```

- **Zeile ändern oder hinzufügen:** Eintrag in `zeilen` anpassen bzw. ergänzen (Felder `tag`, `zeit`, `team`, `halle`). Zeiten mit Halbgeviertstrich schreiben (`17:00–18:30`). Die Reihenfolge der Datei ist die Reihenfolge auf der Seite.
- **Halle:** `halle` ist der Schlüssel eines Eintrags in `data/hallen.yaml` (siehe „Hallen pflegen"), nicht der Klartext. Die Spalte „Ort" mit Name, Ort und Google-Maps-Link wird daraus erzeugt. Ein unbekannter Schlüssel lässt den Build mit einer Fehlermeldung fehlschlagen.
- **Neue Saison:** `titel` anpassen (z. B. „Trainingszeiten Saison 2027/2028") und die `zeilen` ersetzen. `id` nur bei der ersten Tabelle setzen, damit der Anker `/#training` erhalten bleibt.
- **Hinweis:** `hinweis` ist optional. Ohne das Feld wird kein Absatz ausgegeben.
- Auf dem Handy (unter 640 px) werden die Zeilen automatisch als Karten dargestellt.

**Layout-Override:** Die Startseite wird über `layouts/index.html` (Kopie von `themes/blowfish/layouts/index.html` plus Aufrufe der Partials unter `layouts/partials/`: Hero-Slideshow, Spieltermine, Trainingszeiten usw.) zusammengesetzt. Bei jedem Update des Themes Blowfish muss `layouts/index.html` mit dem Original im Theme verglichen und Änderungen müssen übernommen werden.

## Hallen pflegen

Alle Hallen stehen in `data/hallen.yaml`. Jede Halle hat einen Schlüssel, unter dem sie in den Trainingszeiten verwendet wird:

```yaml
saentishalle:
  { name: "Säntishalle", strasse: "Thomas-Bornhauserstrasse 14", plz: "9320", ort: "Arbon" }
```

- **Neue Halle:** Eintrag mit eindeutigem Schlüssel (Kleinbuchstaben, Bindestriche) und den Feldern `name`, `strasse`, `plz`, `ort` ergänzen und den Schlüssel in `data/trainingszeiten.yaml` als `halle:` verwenden.
- **Adresse ändern:** nur hier ändern. Die Änderung gilt automatisch für alle Trainings dieser Halle, auch der Maps-Link wird aus der Adresse gebildet.
- Eine nicht mehr verwendete Halle kann gelöscht werden. Wird eine Halle gelöscht, die noch in den Trainingszeiten steht, bricht der Build ab.

## Hauptversammlungen pflegen

Die Liste der Hauptversammlungen (Seite „Über uns") steht in `data/hauptversammlungen.yaml`, neueste zuerst:

```yaml
zeilen:
  - { nummer: 9, datum: "2026", protokoll: hv-09-2026-protokoll.pdf }
```

- **Neue HV:** Zeile **oben** ergänzen (`nummer`, `datum`, `protokoll`) und das Protokoll als PDF unter `static/dokumente/` mit genau diesem Dateinamen ablegen (Schema `hv-NN-JJJJ-protokoll.pdf`).
- **Datum:** als Text, entweder nur das Jahr (`"2026"`) oder vollständig (`"30.06.2021"`).
- Fehlt die PDF-Datei, bricht der Build mit einer Fehlermeldung ab, damit keine toten Download-Links veröffentlicht werden.

## Bilder auf der Startseite (Hero-Slideshow)

Der Kopfbereich der Startseite zeigt eine Foto-Slideshow als Hintergrund. Die Fotos liegen in `assets/img/hero/` (Details in `assets/img/hero/README.md`).

- **Hinzufügen/Entfernen:** Foto (`.jpg`, `.jpeg`, `.png`, `.webp`) in den Ordner legen bzw. löschen, committen und pushen. Eine Konfiguration ist nicht nötig.
- **Reihenfolge:** alphabetisch nach Dateiname. Für eine feste Reihenfolge nummerieren, z. B. `01-halle.jpg`, `02-team.jpg`.
- **Format:** Querformat, mindestens 1920 px breit, möglichst unter 500 KB. Hugo erzeugt automatisch die Varianten 800 px und 1920 px.
- **Verhalten:** Die Bilder wechseln automatisch. Bei nur einem Foto bleibt es statisch, ohne Fotos erscheint der Pirates-Hintergrund mit Logo. Bei der Browser-Einstellung „Bewegung reduzieren" wird nicht gewechselt.
- **Texte und Buttons:** Überschrift und Unterzeile stehen in `content/_index.md` (`heroHeadline`, `heroSubline`). Die Buttons „Probetraining" und „Spieltermine" springen zu den Abschnitten weiter unten. Das Layout ist `layouts/partials/hero-slideshow.html`.
- **Datenschutz:** Bei erkennbaren Personen, besonders Minderjährigen, muss eine Einwilligung zur Veröffentlichung vorliegen.

## Nächste Spiele auf der Startseite

Der Abschnitt „Nächste Spiele" wird aus einem öffentlichen Google-Kalender erzeugt. Die Termine werden **beim Build** abgerufen (Partial `layouts/partials/spieltermine.html`), nicht im Browser.

- **Spiel eintragen:** Im Google-Kalender des Vereins einen Termin anlegen. Der Titel erscheint in der Spalte „Spiel", der Ort wird mit Google-Maps-Link angezeigt. Ganztägige Termine erscheinen als „ganztägig", mehrtägige mit Datumsbereich.
- **Angezeigt werden** alle Termine ab heute für die nächsten zwei Monate, nach Datum sortiert.
- **Aktualisierung:** Die Seite wird täglich um 05:00 UTC automatisch neu gebaut (`schedule` in `.github/workflows/hugo.yml`). Neue Kalendereinträge erscheinen also spätestens am nächsten Tag. Sofort: im Repository unter **Actions** den Workflow manuell starten (falls dort „Run workflow" fehlt, genügt ein beliebiger Push auf `main`).
- **Kalender:** Die Adresse des ICS-Feeds steht in `hugo.toml` unter `spielterminFeed`. Der Kalender muss öffentlich freigegeben sein. Für einen anderen Kalender die URL dort ersetzen (öffentliche Adresse im iCal-Format, Endung `basic.ics`).
- **Fehlerfälle:** Ist der Kalender nicht erreichbar, erscheint „Die Spieltermine sind zurzeit nicht verfügbar", der Build läuft aber durch (Warnung im Log). Ohne Termine steht dort „Zurzeit sind keine Spiele eingetragen".
- **Test:** Mit dem Parameter `spielterminHeute` in `hugo.toml` (z. B. `"2026-09-01"`) lässt sich ein anderes „Heute" simulieren. Danach wieder entfernen.

## Hugo-Version

**Hugo extended 0.167.0** – festgelegt an genau einer Stelle: `HUGO_VERSION` in `.github/workflows/hugo.yml`. Lokal dieselbe Version verwenden, z. B. unter Windows:

```
winget install Hugo.Hugo.Extended --version 0.167.0
```

Das Theme Blowfish v3.9.0 unterstützt Hugo 0.164.0–0.167.0. Beim Update von Hugo oder Blowfish beides gemeinsam anheben und die Version hier sowie im Workflow anpassen.

## Hinweise

- Pull Requests werden nur gebaut und geprüft, nicht veröffentlicht. Ein fehlgeschlagener Build lässt die Live-Seite unverändert.
- Die Ordner `.claude/`, `.sdd/` sowie `README-SDD.md` sind Entwicklungsdateien. Sie liegen im Repository, werden aber von Hugo nicht veröffentlicht.
- Linkprüfung lokal (Build mit Basis-URL `/`, da die echte URL einen Unterpfad hat):
  ```
  hugo --gc --minify --baseURL "/" --destination ../pubcheck
  lychee --offline --root-dir "$PWD/../pubcheck" "../pubcheck/**/*.html"
  ```
