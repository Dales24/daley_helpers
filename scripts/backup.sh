#!/usr/bin/env bash
# Timestamped tar.gz backup of a directory. Mock helper.
# usage: ./backup.sh <source_dir> [dest_dir]
set -euo pipefail

SRC="${1:?usage: backup.sh <source_dir> [dest_dir]}"
DEST="${2:-$HOME/backups}"

if [[ ! -d "$SRC" ]]; then
  echo "error: source '$SRC' is not a directory" >&2
  exit 1
fi

mkdir -p "$DEST"
STAMP="$(date +%Y%m%d-%H%M%S)"
NAME="$(basename "$SRC")-$STAMP.tar.gz"

tar -czf "$DEST/$NAME" -C "$(dirname "$SRC")" "$(basename "$SRC")"
echo "backup written: $DEST/$NAME"
