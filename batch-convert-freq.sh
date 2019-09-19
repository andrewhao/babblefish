#!/usr/bin/env bash

shopt -s globstar
set -euxo pipefail

FILES=white_noise/*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox "$f" "$f.processed.wav" rate 22050
  rm "$f"
done

