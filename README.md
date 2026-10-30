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
