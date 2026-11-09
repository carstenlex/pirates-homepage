# Pflege der Seite "Ueber uns"

Alle Inhalte stehen in Datendateien unter `data/`. Layout und HTML muessen nicht angefasst werden.

## Beitraege aendern
Datei `data/beitraege.yaml`: Einleitungstext (`einleitung`) und je Team eine Zeile in `zeilen` (`team`, `jahrgaenge`, `beitrag`, `beitrag_kulturlegi`). Leere `jahrgaenge` ergeben einen Strich.

## Vorstand aendern
Datei `data/vorstand.yaml`: je Person `name`, `funktion`, `foto`. Das Foto liegt unter `assets/img/vorstand/`, quadratisch (ca. 400 x 400 px, JPG), Gesicht mittig. Wird zugeschnitten, aber nicht verzerrt.

## Neue Hauptversammlung
1. Protokoll-PDF unter `static/dokumente/` ablegen, Name `hv-<nummer>-<jahr>-protokoll.pdf` (z. B. `hv-10-2027-protokoll.pdf`).
2. In `data/hauptversammlungen.yaml` oben eine Zeile ergaenzen (neueste zuerst): `{ nummer: 10, datum: "2027", protokoll: hv-10-2027-protokoll.pdf }`. Datum ist ein Jahr oder ein volles Datum (`TT.MM.JJJJ`).

Fehlt die PDF-Datei oder das Foto, bricht der Bau mit einer Meldung ab, die die Zeile bzw. Person nennt.

## Pruefen
`bash scripts/check-ueber-uns.sh` baut die Seite in ein temporaeres Verzeichnis und prueft sie. Das Skript laeuft auch im GitHub-Workflow vor dem Deploy.
