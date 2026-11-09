#!/usr/bin/env bash
# Build-Pruefung fuer die Seite "Ueber uns": baut in ein temporaeres Verzeichnis und prueft public-HTML von /about/.
# Veraendert keine Dateien im Arbeitsverzeichnis.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1
OUT="$(mktemp -d)"
trap 'rm -rf "$OUT"' EXIT
FAIL=0

ok()   { echo "OK     $1"; }
fail() { echo "FEHLER $1"; FAIL=1; }
check() { # name, condition-exit-code
  if [ "$2" -eq 0 ]; then ok "$1"; else fail "$1"; fi
}

LOG="$(hugo --gc --minify --destination "$OUT" 2>&1)"; RC=$?
check "Build ohne Fehler" "$RC"
if [ "$RC" -ne 0 ]; then echo "$LOG" | tail -15; exit 1; fi
echo "$LOG" | grep -q WARN; [ $? -ne 0 ]; check "Build ohne Warnungen" $?

HTML="$OUT/about/index.html"
[ -f "$HTML" ] || { fail "about/index.html fehlt"; exit 1; }
# Ein Tag pro Zeile, damit grep zeilenweise arbeiten kann
T="$OUT/about.lines"
sed 's/></>\n</g' "$HTML" > "$T"

# Reihenfolge der vier Abschnittsueberschriften
ORDER=$(grep -nE '<h2[^>]*>(Vereinsführung|Wir stehen für|Mitgliedsbeiträge|Hauptversammlungen)' "$T" \
  | sed -E 's/.*>(Vereinsführung|Wir stehen für|Mitgliedsbeiträge|Hauptversammlungen).*/\1/' | tr '\n' '|')
[ "$ORDER" = "Vereinsführung|Wir stehen für|Mitgliedsbeiträge|Hauptversammlungen|" ]
check "Reihenfolge der vier Abschnitte" $?

# Vorstand
[ "$(grep -c 'class=vorstand-card' "$T")" -eq 3 ]; check "3 Vorstandskarten" $?
for n in "Carsten Lex" "Hürriyet Celiksap" "Claudio Cioce"; do
  grep -q "class=vorstand-name>$n<" "$T"; check "Vorstand: $n" $?
done
[ "$(grep -c 'class=vorstand-foto' "$T")" -eq 3 ] && ! grep 'class=vorstand-foto' "$T" | grep -vq 'alt='
check "3 Fotos mit alt" $?

# Beitraege: Bereich zwischen Titel und Hauptversammlungen
BEI="$OUT/bei.lines"
awk '/id=beitraege-titel/{f=1} /id=hv-titel|id=hauptversammlungen-titel/{f=0} f' "$T" > "$BEI"
[ -s "$BEI" ] || awk '/id=beitraege-titel/{f=1} f' "$T" > "$BEI"
[ "$(grep -c 'scope=row' "$BEI")" -eq 11 ]; check "11 Beitragszeilen" $?
[ "$(grep -c 'data-label=Jahrgänge>–<' "$BEI")" -eq 3 ]; check "Strich bei 3 leeren Jahrgaengen" $?
grep -q 'class=beitraege-logo[^>]*alt=Kultur-Legi' "$BEI"; check "Kultur-Legi-Logo mit alt" $?

# Hauptversammlungen
HV="$OUT/hv.lines"
awk '/>Hauptversammlungen</{f=1} f' "$T" > "$HV"
[ "$(grep -c 'scope=row' "$HV")" -eq 8 ]; check "8 HV-Zeilen" $?
grep -q 'Weitere Unterlagen' "$T"; [ $? -ne 0 ]; check "keine Spalte Weitere Unterlagen" $?
FIRST=$(grep -m1 -oE 'hv-[0-9]+-[0-9]{4}-protokoll\.pdf' "$HV")
LAST=$(grep -oE 'hv-[0-9]+-[0-9]{4}-protokoll\.pdf' "$HV" | tail -1)
[ "$FIRST" = "hv-09-2026-protokoll.pdf" ] && [ "$LAST" = "hv-02-2019-protokoll.pdf" ]
check "HV-Reihenfolge neueste zuerst" $?

# Links auf PDFs existieren und sind PDFs; kein Link auf alte Seite
BASEPATH=$(grep -oE 'rel=canonical href=https?://[^/]+(/[^ >]*)?/about/' "$T" | sed -E 's#.*href=https?://[^/]+##; s#/about/$##')
PDFS=$(grep -oE 'href=[^ >]*\.pdf' "$T" | sed 's/^href=//; s/^"//; s/"$//' | sort -u)
PE=0
[ -n "$PDFS" ] || PE=1
for p in $PDFS; do
  rel="${p#"$BASEPATH"}"
  f="$OUT$rel"
  if [ ! -f "$f" ] || [ "$(head -c 4 "$f")" != "%PDF" ]; then echo "       PDF fehlt oder ungueltig: $p"; PE=1; fi
done
check "alle PDF-Links existieren und sind PDFs ($(echo "$PDFS" | grep -c .) Stueck)" "$PE"
grep -q 'pirates-basketball\.ch' "$HTML"; [ $? -ne 0 ]; check "kein Link auf pirates-basketball.ch" $?

# Gestrichene Inhalte
for s in "Anmeldung" "Kontaktformular" "Follow us" "Unterstützen auch Sie" "Basketball in Arbon, Amriswil" "Verantwortlich für folgende Themen"; do
  grep -qi "$s" "$HTML"; [ $? -ne 0 ]; check "nicht vorhanden: $s" $?
done

# Regression uebrige Seiten
for p in kontakt impressum datenschutz; do
  f="$OUT/$p/index.html"
  [ -f "$f" ] && grep -q '<header' "$f" && grep -q '<footer' "$f"; check "Seite $p mit Kopf- und Fusszeile" $?
done
f="$OUT/index.html"
[ -f "$f" ] && grep -q '<header' "$f" && grep -q '<footer' "$f"; check "Startseite mit Kopf- und Fusszeile" $?
grep -q '<header' "$HTML" && grep -q '<footer' "$HTML"; check "Ueber uns mit Kopf- und Fusszeile" $?
exit $FAIL
