## Problem Statement

Die Startseite der Pirates Basketball zeigt nur einen nüchternen Platzhaltertext („Willkommen bei den Pirates Basketball! … (Platzhaltertext)“). Besucher (Interessierte, Eltern, neue Spieler, Fans) bekommen keinen Eindruck vom Verein und keine klare Handlungsaufforderung. Es gibt kein Bild, keine Stimmung und keinen schnellen Weg zum Probetraining.

## Solution

Die Startseite bekommt einen auffälligen Kopfbereich („Hero"). Im Hintergrund wechseln sich 3–10 Fotos des Vereins sanft per Überblendung ab (alle ca. 6 Sekunden). Darüber stehen eine kurze, kräftige Überschrift und eine einladende Unterzeile im Piraten-Ton (Deutsch, Du-Form, mit Augenzwinkern) sowie zwei Schaltflächen: „Probetraining" (springt zu den Trainingszeiten) und „Spieltermine" (springt zum Spielplan). Die Fotos werden vom Verein einfach durch Ablegen in einen Ordner gepflegt. Trainingszeiten und Spieltermine bleiben unverändert darunter.

## User Stories

1. Als Interessierter, der die Seite zum ersten Mal besucht, möchte ich sofort ein starkes Bild und eine klare Aussage sehen, damit ich verstehe, worum es bei den Pirates geht.
2. Als potenzieller neuer Spieler möchte ich einen auffälligen „Probetraining"-Button sehen, damit ich ohne Suchen zum Einstieg finde.
3. Als potenzieller neuer Spieler möchte ich per Klick auf „Probetraining" direkt zu den Trainingszeiten gelangen, damit ich weiß, wann und wo ich vorbeikommen kann.
4. Als Fan möchte ich per Klick auf „Spieltermine" direkt zum Spielplan springen, damit ich die nächsten Spiele finde.
5. Als Besucher möchte ich, dass die Hintergrundbilder sanft ineinander überblenden, damit die Seite lebendig wirkt, ohne unruhig zu sein.
6. Als Besucher möchte ich, dass Überschrift und Buttons auf jedem Bild gut lesbar sind, damit ich nichts übersehe.
7. Als Besucher auf dem Smartphone möchte ich, dass der Kopfbereich gut aussieht und bedienbar ist, damit ich unterwegs alle Informationen erreiche.
8. Als Besucher mit Bewegungsempfindlichkeit (reduzierte Bewegung im System aktiviert) möchte ich nur ein ruhiges, stehendes Bild sehen, damit mir nicht unwohl wird.
9. Als Besucher mit langsamer Verbindung möchte ich, dass die Seite schnell erscheint, damit ich nicht auf große Bilder warten muss.
10. Als Besucher mit Screenreader möchte ich, dass dekorative Hintergrundbilder ignoriert und Überschrift sowie Buttons korrekt vorgelesen werden, damit die Seite zugänglich ist.
11. Als Vereinsverantwortlicher möchte ich neue Fotos einfach in einen Ordner legen, damit sie automatisch in der Slideshow erscheinen, ohne Konfiguration anzufassen.
12. Als Vereinsverantwortlicher möchte ich Fotos einfach entfernen können, damit veraltete Bilder verschwinden.
13. Als Vereinsverantwortlicher möchte ich, dass die Seite auch ohne Fotos ordentlich aussieht (Pirates-Hintergrund mit Logo), damit nie eine kaputte Startseite online geht.
14. Als Vereinsverantwortlicher möchte ich, dass 3 bis 10 Fotos gut funktionieren, damit ich flexibel bleibe.
15. Als Vereinsverantwortlicher möchte ich, dass auch bei nur einem Foto kein Wechsel oder Flackern entsteht, damit die Seite stabil bleibt.
16. Als Vereinsverantwortlicher möchte ich, dass Fotos in verschiedenen Formaten (Hoch-/Querformat) sauber zugeschnitten dargestellt werden, damit nichts verzerrt aussieht.
17. Als Besucher möchte ich, dass die Überschrift im Piraten-Ton formuliert ist, damit der Verein sympathisch und unverwechselbar wirkt.
18. Als Besucher möchte ich, dass Trainingszeiten und Spieltermine weiterhin unter dem Kopfbereich stehen, damit ich beim Scrollen alles Gewohnte finde.
19. Als Vereinsverantwortlicher möchte ich, dass das Pirates-Logo im dunklen Farbschema weiterhin sichtbar bleibt, damit die Markenidentität erhalten bleibt.
20. Als Tastaturnutzer möchte ich die Buttons per Tab erreichen und mit Enter auslösen können, damit ich die Seite ohne Maus bedienen kann.

## User Acceptance Tests

1. Given die Startseite wird geöffnet und im Fotoordner liegen mehrere Bilder, when die Seite geladen ist, then sieht man ein Hintergrundbild mit dunklem Overlay, eine Überschrift, eine Unterzeile und die Buttons „Probetraining" und „Spieltermine".
2. Given die Startseite ist geöffnet, when ca. 6 Sekunden vergehen, then blendet das Bild sanft in das nächste Foto über, ohne Sprung oder weißes Aufblitzen.
3. Given die Slideshow hat das letzte Foto erreicht, when weitere 6 Sekunden vergehen, then beginnt sie wieder mit dem ersten Foto.
4. Given ein beliebiges Foto ist sichtbar, when man Überschrift und Buttons betrachtet, then sind sie gut lesbar (auch bei sehr hellen Fotos).
5. Given die Startseite ist geöffnet, when man auf „Probetraining" klickt, then scrollt die Seite zum Abschnitt der Trainingszeiten.
6. Given die Startseite ist geöffnet, when man auf „Spieltermine" klickt, then scrollt die Seite zum Abschnitt der Spieltermine.
7. Given im System ist „Bewegung reduzieren" aktiviert, when die Startseite geöffnet wird, then zeigt sie dauerhaft nur das erste Foto, ohne Überblendung.
8. Given im Fotoordner liegt genau ein Bild, when die Startseite geöffnet wird, then wird dieses Bild statisch angezeigt, ohne Wechsel oder Flackern.
9. Given ein neues Foto wird in den Fotoordner gelegt und die Seite neu gebaut, when die Startseite geöffnet wird, then erscheint das neue Foto in der Slideshow.
10. Given ein Foto wird aus dem Fotoordner entfernt und die Seite neu gebaut, when die Startseite geöffnet wird, then erscheint es nicht mehr.
11. Given der Fotoordner enthält keine Bilder, when die Seite gebaut und geöffnet wird, then erscheint ein einfarbiger Pirates-Hintergrund mit Logo, und der Bau schlägt nicht fehl.
12. Given ein Smartphone-Bildschirm (ca. 375 px Breite), when die Startseite geöffnet wird, then ist der Kopfbereich vollständig sichtbar, nichts ist abgeschnitten, es gibt kein horizontales Scrollen, und die Buttons sind gut tippbar.
13. Given ein Foto im Hochformat und eines im Querformat, when sie angezeigt werden, then füllen beide den Bereich ohne Verzerrung.
14. Given die Startseite wird auf einer gedrosselten Verbindung geladen, when die Seite erscheint, then ist das erste Bild und der Text schnell sichtbar, während weitere Bilder nachgeladen werden.
15. Given man bedient die Seite nur mit der Tastatur, when man mit Tab durch die Seite geht, then erhalten beide Buttons sichtbar den Fokus und lassen sich mit Enter auslösen.
16. Given die Startseite ist geöffnet, when man nach unten scrollt, then folgen unverändert die Trainingszeiten und die Spieltermine.
17. Given der alte Platzhaltertext „(Platzhaltertext)", when die Startseite geöffnet wird, then ist er nirgends mehr zu sehen.

## Definition of Done

- Alle User Acceptance Tests bestehen.
- Der Seitenbau (Hugo) läuft ohne Fehler und Warnungen durch, mit Fotos und ohne Fotos im Ordner.
- Trainingszeiten, Spieltermine, Kopfzeile, Fußzeile und Unterseiten funktionieren unverändert (keine Regression).
- Die Seite ist auf Smartphone- und Desktop-Breite geprüft.
- Text ist auf allen Slideshow-Bildern lesbar (ausreichender Kontrast durch Overlay).
- Die Seite funktioniert bei aktivierter Einstellung „Bewegung reduzieren" ohne Animation.
- Kurze Anleitung zur Fotopflege (Ordner, empfohlene Formate und Größen) ist dokumentiert.
- Überschrift und Unterzeile sind vom Verein inhaltlich abgenommen.

## Out of Scope

- Wiedereinschalten der News auf der Startseite.
- Änderungen an Trainingszeiten, Spielterminen oder deren Datenquellen.
- Manuelle Steuerung der Slideshow (Pfeile, Punkte, Pause-Button) und Swipe-Gesten.
- Pro-Bild-Texte, Bildunterschriften oder konfigurierbare Reihenfolge der Bilder.
- Ken-Burns-/Zoom-Effekte.
- Mehrsprachigkeit (nur Deutsch).
- Beschaffung oder Bearbeitung der Fotos selbst (liefert der Verein).
- Ein Kontaktformular oder Anmeldeformular für das Probetraining.

## Further Notes

- Die endgültige Formulierung von Überschrift und Unterzeile wird bei der Umsetzung vorgeschlagen, Richtung z. B. „Entern. Punkten. Gewinnen." und kann anschließend vom Verein angepasst werden.
- Fotos mit erkennbaren Personen (insbesondere Minderjährigen) brauchen eine Einwilligung zur Veröffentlichung. Das liegt in der Verantwortung des Vereins.
- Die Reihenfolge der Fotos ergibt sich aus dem Dateinamen (alphabetisch). Wer eine bestimmte Reihenfolge will, nummeriert die Dateien.
- Offene Frage: Soll das Logo im Hero zusätzlich sichtbar sein, oder reicht das Logo in der Kopfzeile? Standard: nur Kopfzeile.

---

## Technical Annex
> Written against codebase as of: 2026-11-09 (commit 5b1925e)

### Architectural Decisions

- **Startseiten-Layout:** `layouts/index.html` bindet aktuell über `home/<layout>.html` das Blowfish-Hero (`hugo.toml`: `params.homepage.layout = "hero"`) ein, danach `trainingszeiten.html` und `spieltermine.html`. Das Blowfish-Hero-Partial wird durch ein eigenes Partial `layouts/partials/hero-slideshow.html` ersetzt, das in `layouts/index.html` an Stelle des Theme-Partials aufgerufen wird. Der Theme-Ordner `themes/blowfish` bleibt unverändert.
- **Inhalt:** Überschrift und Unterzeile kommen aus Front Matter bzw. Body von `content/_index.md` (Platzhaltertext entfernen), damit Texte ohne Template-Änderung editierbar sind. Beispiel-Parameter: `heroHeadline`, `heroSubline`. Button-Beschriftungen/Ziele stehen im Partial.
- **Bildquelle:** Seiten-Ressourcen via `resources.Match "img/hero/*.{jpg,jpeg,png,webp}"` (Global Resources, Ordner `assets/img/hero/`), sortiert nach Dateiname. Pro Bild `.Resize`/`.Fill` auf z. B. 1920 px (Desktop) und 800 px (Mobil) als `srcset`/`image-set`, Format WebP oder JPG mit Qualität ca. 75. Bilder werden als `<img>`-Elemente mit `alt=""` und `aria-hidden="true"` ausgegeben (dekorativ), `object-fit: cover`.
- **Ladeverhalten:** Das erste Bild mit `loading="eager"` und `fetchpriority="high"`, alle weiteren `loading="lazy"`.
- **Slideshow-Mechanik:** Reines CSS-Crossfade mit gestapelten, absolut positionierten Slides (opacity-Transition ca. 1,2 s). Ein kleines Inline-Skript (<30 Zeilen, ohne Bibliothek) setzt alle 6000 ms eine Klasse `is-active` auf das nächste Slide. Bei nur einem Bild wird kein Timer gestartet. Bei `@media (prefers-reduced-motion: reduce)` wird kein Timer gestartet und die Transition deaktiviert; nur das erste Bild bleibt sichtbar. Timer pausiert bei `document.hidden` (visibilitychange).
- **Fallback ohne Bilder:** Wenn `resources.Match` leer ist, rendert das Partial einen CSS-Hintergrund in den Pirates-Farben (aus `assets/css/schemes/pirates.css`) und das Logo (`img/logo-pirates-white-clear.png`); der Build darf nicht fehlschlagen und keine Warnung erzeugen.
- **Lesbarkeit:** Overlay per `linear-gradient`/`rgba` über den Slides (z. B. ~50–60 % Schwarz), Text in Weiß mit leichtem `text-shadow`.
- **Buttons:** Zwei Anker-Links: `#training` (Id existiert bereits in `data/trainingszeiten.yaml`, erste Tabelle) und `#spieltermine` (existiert in `layouts/partials/spieltermine.html`). Sanftes Scrollen via `scroll-behavior: smooth` (nicht bei reduced motion). Sichtbarer `:focus-visible`-Stil.
- **Styling:** Neue Regeln in `assets/css/custom.css` (Klassen mit Präfix `hero-slideshow`). Höhe z. B. `min-height: 70vh` (Desktop) und `60svh` (Mobil). Das Wasserzeichen-Logo (`--watermark-url`, `extend-head.html`) darf den Hero nicht stören (Hero liegt darüber/ist deckend).
- **Konfiguration:** `params.homepage.layout` in `hugo.toml` kann bleiben; das Partial wird in `layouts/index.html` direkt statt via `home/<layout>` eingebunden. Der `layoutSwitcher`-Zweig entfällt.
- **Build/Deployment:** Das tägliche GitHub-Actions-Build (`.github/workflows/hugo.yml`) braucht keine Änderung. Hugo Extended ist nur nötig, falls WebP-Encoding gewählt wird. Vorher prüfen, welche Hugo-Variante im Workflow verwendet wird, sonst bei JPG bleiben.
- **Doku:** Kurze Anleitung zur Fotopflege (z. B. `assets/img/hero/README.md`, ausgeschlossen vom Match, empfohlen: Querformat, ≥1920 px Breite, ≤ 500 KB je Datei vor der Verarbeitung).

### Automated Testing Decisions

- Gute Tests prüfen nur äußeres Verhalten: erzeugtes HTML der Startseite, nicht interne Template-Details.
- Im Repo existiert kein Test-Framework; die Verifikation erfolgt als **Build-Smoke-Tests per Skript** (Hugo-Build + Prüfung des erzeugten `public/index.html`):
  - Build mit 3 Testbildern: Anzahl der Slides = 3, erstes Bild `eager`, übrige `lazy`, Anker-Links `#training` und `#spieltermine` zeigen auf vorhandene Ids.
  - Build mit 1 Bild: genau 1 Slide, kein Timer-Skript nötig.
  - Build mit 0 Bildern: Build erfolgreich, Fallback-Markup vorhanden.
  - Platzhaltertext „(Platzhaltertext)" kommt nicht mehr vor.
- Das Skript wird als reines Shell-/PowerShell-Skript im Repo abgelegt und optional im GitHub-Actions-Workflow als Schritt vor dem Deploy ausgeführt.
- Visuelles Verhalten (Crossfade, Lesbarkeit, Mobilansicht, reduced motion) wird **manuell** anhand der User Acceptance Tests im Browser geprüft; automatisierte UI-/E2E-Tests sind für diesen kleinen statischen Auftritt unverhältnismäßig.
- Vorbilder: keine vorhandenen Tests; der bestehende Fehlerschutz in `trainingszeiten.html` (`errorf` bei unbekanntem Hallen-Schlüssel) zeigt den Stil „Build bricht bei ungültigen Daten ab", der hier bewusst nicht für fehlende Bilder angewandt wird (Fallback statt Fehler).
