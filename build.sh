#!/usr/bin/env sh
# Baut index.html (eigenständige Seite) aus src/studienplaner.html.
# src/studienplaner.html ist zugleich die Quelle der claude.ai-Version und hat darum kein eigenes <html>-Gerüst.
set -e
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="de">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<meta name="apple-mobile-web-app-capable" content="yes">\n<meta name="theme-color" content="#1f3fbf">\n'
  printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}</style>\n'
  printf '</head>\n<body>\n'
  cat src/studienplaner.html
  printf '\n</body>\n</html>\n'
} > index.html
echo "index.html gebaut"
