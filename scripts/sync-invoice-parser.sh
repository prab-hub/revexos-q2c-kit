#!/bin/sh
# Copy the invoice-parser skill from its own repo so both plugins ship the same files.
# Usage: scripts/sync-invoice-parser.sh [path to revexos-invoice-parser repo]
set -e
SRC="${1:-$(dirname "$0")/../../revexos-invoice-parser}/skills/revexos-invoice-parser"
DEST="$(dirname "$0")/../skills/revexos-invoice-parser"
[ -f "$SRC/SKILL.md" ] || { echo "not found: $SRC" >&2; exit 1; }
rm -rf "$DEST" && mkdir -p "$DEST" && cp -R "$SRC/." "$DEST/"
find "$DEST" -name .DS_Store -delete
echo "synced $SRC -> $DEST"
