#!/usr/bin/env bash
# Build-Smoke-Test fuer den Startseiten-Hero: baut mit 3, 1 und 0 Fotos und prueft public/index.html.
# Der Inhalt von assets/img/hero/ (ausser README.md) wird gesichert und am Ende wiederhergestellt.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1
HERO=assets/img/hero
FIXTURE=scripts/fixtures/test.jpg
STASH="$(mktemp -d)"
OUT="$(mktemp -d)"
FAIL=0

for f in "$HERO"/*; do
  [ -e "$f" ] || continue
  [ "$(basename "$f")" = "README.md" ] && continue
  mv "$f" "$STASH/"
done
restore() {
  for f in "$HERO"/*; do
    [ -e "$f" ] || continue
    [ "$(basename "$f")" = "README.md" ] && continue
    rm -f "$f"
  done
  for f in "$STASH"/*; do
    [ -e "$f" ] || continue
    mv "$f" "$HERO/"
  done
  rm -rf "$STASH" "$OUT"
}
trap restore EXIT

run_case() { # name count
  local name="$1" n="$2" html errs=""
  for i in $(seq 1 "$n"); do cp "$FIXTURE" "$HERO/0$i-test.jpg"; done
  rm -rf "$OUT"/*
  local log; log="$(hugo --gc --minify --destination "$OUT" 2>&1)"
  if [ $? -ne 0 ]; then errs="$errs Build fehlgeschlagen;"; fi
  if echo "$log" | grep -q WARN; then errs="$errs Build-Warnungen;"; fi
  html="$OUT/index.html"
  if [ ! -f "$html" ]; then errs="$errs index.html fehlt;"; else
    local slides eager lazy
    slides=$(grep -oE 'class="?hero-slideshow__slide[" ]' "$html" | wc -l)
    eager=$(grep -o 'loading=eager' "$html" | wc -l)
    lazy=$(grep -o 'loading=lazy' "$html" | wc -l)
    [ "$slides" -eq "$n" ] || errs="$errs Slides=$slides erwartet $n;"
    if [ "$n" -gt 0 ]; then
      [ "$eager" -eq 1 ] || errs="$errs eager=$eager erwartet 1;"
      [ "$lazy" -eq $((n-1)) ] || errs="$errs lazy=$lazy erwartet $((n-1));"
      grep -q 'fetchpriority=high' "$html" || errs="$errs fetchpriority fehlt;"
    else
      grep -q 'hero-slideshow__logo' "$html" || errs="$errs Fallback-Logo fehlt;"
    fi
    if [ "$n" -gt 1 ]; then grep -q 'setInterval' "$html" || errs="$errs Timer-Skript fehlt;"
    else grep -q 'setInterval' "$html" && errs="$errs Timer-Skript unerwartet;"; fi
    for id in training spieltermine; do
      c=$(grep -oE "id=\"?$id[\" >]" "$html" | wc -l)
      [ "$c" -eq 1 ] || errs="$errs Id $id kommt ${c}x vor;"
      grep -qE "href=\"?#$id[\" >]" "$html" || errs="$errs Link #$id fehlt;"
    done
    grep -q 'Platzhaltertext' "$html" && errs="$errs Platzhaltertext vorhanden;"
  fi
  for p in about kontakt impressum datenschutz; do
    f="$OUT/$p/index.html"
    if [ ! -f "$f" ]; then errs="$errs Seite $p fehlt;"; else
      grep -q '<header' "$f" || errs="$errs $p ohne Kopfzeile;"
      grep -q '<footer' "$f" || errs="$errs $p ohne Fusszeile;"
    fi
  done
  for f in "$HERO"/0*-test.jpg; do [ -e "$f" ] && rm -f "$f"; done
  if [ -z "$errs" ]; then echo "OK    $name"; else echo "FEHLER $name:$errs"; FAIL=1; fi
}

run_case "3 Bilder" 3
run_case "1 Bild" 1
run_case "0 Bilder (nur README)" 0
exit $FAIL
