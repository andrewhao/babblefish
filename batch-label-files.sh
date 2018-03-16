#!/usr/bin/env bash

set -euxo pipefail

FILES=~/recordings-trimmed/2018-03-16-05*.wav
for f in $FILES
do
  echo "Processing $f..."
  python app/label_wav.py --graph=./graph.pb --labels=./conv_labels.txt --wav=$f
done
