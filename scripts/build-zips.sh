#!/bin/sh
# Build one zip per skill in dist/, for upload in claude.ai (Settings > Capabilities > Skills).
set -e
cd "$(dirname "$0")/../skills"
mkdir -p ../dist && rm -f ../dist/*.zip
for s in */; do s="${s%/}"; zip -qr "../dist/$s.zip" "$s" -x '*.DS_Store' '*__pycache__*'; echo "dist/$s.zip"; done
