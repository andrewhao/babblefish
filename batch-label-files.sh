#!/usr/bin/env bash

set -euxo pipefail

FILES=~/recordings-trimmed/*.wav
for f in $FILES
do
  echo "Processing $f..."
  ./label_wav $f
done
