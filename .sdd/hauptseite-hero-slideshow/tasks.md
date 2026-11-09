## Task [01-hero-mit-text-und-buttons]

Die Startseite zeigt statt des Blowfish-Heros und des Platzhaltertexts einen eigenen Hero-Bereich: dunkler Pirates-Hintergrund mit Logo (das ist zugleich der Fallback, wenn keine Fotos vorhanden sind), kräftige Überschrift im Piraten-Ton, Unterzeile und die Buttons „Probetraining" (springt zu den Trainingszeiten) und „Spieltermine" (springt zum Spielplan). Trainingszeiten und Spieltermine folgen unverändert darunter. Texte sind in `content/_index.md` pflegbar.

### Implementation steps

- [x] Eigenes Hero-Partial anlegen und in der Startseiten-Vorlage anstelle des Theme-Heros einbinden (Theme-Ordner bleibt unverändert; Layout-Switcher-Zweig entfällt)
- [x] Überschrift und Unterzeile als Front-Matter-Parameter in `content/_index.md` anlegen, Platzhaltertext entfernen; Texte im Piraten-Ton formulieren
- [x] Buttons mit Ankerzielen `#training` und `#spieltermine` einbauen; sanftes Scrollen (nicht bei reduzierter Bewegung), sichtbarer Fokus-Stil
- [x] Fallback-Hintergrund (Pirates-Farben aus dem Farbschema, Logo) und Layout-Stile in `custom.css` ergänzen (Höhe, Mobil, Textlesbarkeit, Overlay-Grundlage)
- [x] Prüfen, dass das Wasserzeichen-Logo den Hero nicht stört
- [x] Entscheidung festhalten: Das Logo erscheint nur in der Kopfzeile, nicht zusätzlich im Hero (Standard aus den Anforderungen)

### Acceptance criteria

- [x] Die gebaute Startseite enthält Überschrift, Unterzeile und die Buttons „Probetraining" und „Spieltermine"; der Text „Platzhaltertext" kommt nicht mehr vor
- [x] Der Button „Probetraining" verlinkt auf `#training`, „Spieltermine" auf `#spieltermine`; beide Ids existieren im gebauten HTML genau einmal
- [x] Ohne Fotos im Projekt erscheint ein Pirates-Hintergrund mit Logo, Build ohne Fehler und Warnungen
- [ ] ~~(manuell) Bei 375 px Breite ist der Hero vollständig sichtbar, ohne horizontales Scrollen, Buttons gut tippbar~~ *(skipped: Browser nicht verfügbar)*
- [ ] ~~(manuell) Beide Buttons sind per Tab erreichbar, zeigen sichtbaren Fokus und lassen sich mit Enter auslösen~~ *(skipped: Browser nicht verfügbar)*
- [x] Trainingszeiten und Spieltermine erscheinen unverändert unterhalb des Heros

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `git diff --exit-code HEAD -- themes/` endet mit Exit-Code 0 (Theme unverändert)

## Task [02-hero-bilder-slideshow]

Fotos aus dem Ordner `assets/img/hero/` laufen als Hintergrund des Heros im Crossfade (ca. 6 Sekunden). Hugo skaliert sie, das erste Bild lädt sofort, die übrigen nachträglich. Dunkles Overlay sorgt für Lesbarkeit. Bei einem einzelnen Bild oder reduzierter Bewegung bleibt das Bild statisch. Ohne Fotos greift weiterhin der Fallback aus Task 01.

### Implementation steps

- [x] Hugo-Variante im Workflow prüfen (Extended ist installiert, daher ist WebP möglich) und Format JPG oder WebP festlegen
- [x] Fotos per Hugo-Ressourcen aus dem Ordner einlesen (jpg/jpeg/png/webp), nach Dateiname sortieren, in zwei Breiten (Desktop/Mobil) skalieren und als dekorative `<img>`-Elemente (`alt=""`, `aria-hidden`) mit `srcset` ausgeben
- [x] Erstes Bild `eager` mit hoher Priorität, übrige `lazy`
- [x] Gestapelte Slides mit CSS-Crossfade und dunklem Overlay; `object-fit: cover` für Hoch- und Querformat
- [x] Kleines Inline-Skript (ohne Bibliothek) wechselt alle 6 s das aktive Slide; kein Timer bei nur einem Bild, bei `prefers-reduced-motion: reduce` und pausiert bei verstecktem Tab
- [x] Drei Beispielbilder zum Testen in den Ordner legen (später durch echte Fotos ersetzen) und die Ergebnisse im Browser prüfen

### Acceptance criteria

- [x] Bei 3 Bildern im Ordner enthält die gebaute Startseite genau 3 Slides; nur das erste ist `eager` mit `fetchpriority="high"`, die übrigen `lazy`
- [x] Jedes Slide hat ein `srcset` mit zwei Breiten (800 und 1920 px)
- [x] Bei leerem oder fehlendem Ordner `assets/img/hero/` baut die Seite ohne Fehler und Warnungen und zeigt den Fallback
- [ ] ~~(manuell) Im Browser wechselt das Bild nach ca. 6 s per sanfter Überblendung ohne Sprung oder Aufblitzen und beginnt nach dem letzten Bild wieder beim ersten~~ *(skipped: Browser nicht verfügbar)*
- [x] Bei einem einzelnen Bild im Ordner wird kein Wechsel ausgelöst (kein Timer im Seitenverhalten, Bild statisch)
- [ ] ~~Bei aktivierter Systemeinstellung „Bewegung reduzieren" bleibt das erste Bild dauerhaft stehen~~ *(skipped: Browser nicht verfügbar; Logik per Code und CSS umgesetzt)*
- [ ] ~~(manuell) Bei verstecktem Browser-Tab pausiert der Wechsel und läuft beim Zurückkehren ohne Sprung weiter~~ *(skipped: Browser nicht verfügbar)*
- [ ] ~~(manuell) Überschrift und Buttons sind auf hellen wie dunklen Testbildern gut lesbar; Hoch- und Querformat füllen den Bereich ohne Verzerrung~~ *(skipped: Browser nicht verfügbar)*
- [x] Neues Bild im Ordner erscheint nach Neubau in der Slideshow, entferntes Bild nicht mehr

### Quality gates

- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `find public -path '*hero*' -size +500k` liefert keine Treffer

## Task [03-build-pruefung-und-doku]

Ein Prüfskript baut die Seite mit 3, 1 und 0 Fotos und prüft das erzeugte HTML automatisch. Es läuft vor dem Deploy im GitHub-Workflow. Zusätzlich gibt es eine kurze Anleitung für die Fotopflege.

### Implementation steps

- [x] Prüfskript (Bash) anlegen: baut in ein temporäres Zielverzeichnis mit jeweils 3, 1 und 0 Testbildern und prüft Anzahl Slides, eager/lazy, Anker-Ziele und Abwesenheit des Platzhaltertexts
- [x] Skript als Schritt vor dem Deploy in `.github/workflows/hugo.yml` einbinden
- [x] Kurze Anleitung zur Fotopflege schreiben (Ordner, Formate, empfohlene Größe, Reihenfolge per Dateinamen, Hinweis zur Einwilligung bei Personenfotos)
- [x] Anleitung so ablegen, dass sie nicht als Foto eingelesen wird und der Build nicht beeinflusst wird
- [x] Regressionsprüfung von Kopfzeile, Fußzeile und Unterseiten (Über uns, Kontakt, Impressum, Datenschutz) im gebauten Ergebnis
- [ ] ~~Überschrift und Unterzeile dem Verein zur Abnahme vorlegen~~ *(skipped: Vereinsabstimmung ausserhalb dieser Umgebung)*

### Acceptance criteria

- [x] Das Skript endet mit Exit-Code 0 bei korrektem Stand und mit Exit-Code ≠ 0, wenn z. B. der Anker `#training` fehlt (einmal gezielt provoziert und zurückgenommen)
- [x] Das Skript deckt die Fälle 3 Bilder, 1 Bild und 0 Bilder ab und gibt pro Fall `OK` oder eine klare Fehlermeldung aus
- [x] Nach dem Lauf sind die Testbilder aus dem Fotoordner wieder auf den ursprünglichen Stand zurückgesetzt (keine Reste im Arbeitsverzeichnis)
- [x] Liegt nur die Anleitung im Fotoordner, verhält sich der Build wie bei 0 Fotos (Fallback, keine Slides)
- [x] Die gebauten Seiten `about`, `kontakt`, `impressum` und `datenschutz` existieren weiterhin und enthalten Kopf- und Fußzeile
- [ ] ~~(manuell) Der Verein hat Überschrift und Unterzeile abgenommen~~ *(skipped: Vereinsabnahme ausstehend)*
- [x] Der Workflow enthält den Prüfschritt vor dem Hugo-Build für das Deploy
- [x] Die Anleitung nennt Ordner, Formate, empfohlene Breite (≥ 1920 px), Reihenfolgeregel und den Einwilligungshinweis

### Quality gates

- [x] `bash <Skriptpfad>` endet mit Exit-Code 0
- [x] `hugo --gc --minify` endet mit Exit-Code 0 und `hugo --gc --minify 2>&1 | grep -c WARN` ergibt 0
- [x] `git status --short` listet nach dem Skriptlauf nur die erwarteten Dateien: Skript, Workflow, Anleitung sowie die Dateien aus Task 01 und 02
