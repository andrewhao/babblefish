#!/usr/bin/env bash

set -euxo pipefail

TRIMMED_OUTPUT_PATH=~/recordings-trimmed
ARCHIVE_PATH=~/recordings-archive
mkdir -p $TRIMMED_OUTPUT_PATH
mkdir -p $ARCHIVE_PATH
FILES=~/recordings/*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename "$f")
  sox "$f" "$TRIMMED_OUTPUT_PATH/$b" trim 0 10 rate 22050
  $(dirname $0)/label-wav.sh "$TRIMMED_OUTPUT_PATH/$b"
  # mv "$f" "$ARCHIVE_PATH/$b"
  rm "$f"
done
