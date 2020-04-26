#!/usr/bin/env bash

shopt -s globstar
set -euxo pipefail

mkdir -p tmp
rm -f tmp/*

LABELS=(white_noise room_empty crying headbanging talking)

echo "Starting processing for $LABELS"

for label in "${LABELS[@]}"
do
  mkdir -p "data/$label"
  rm -f "data/$label/*.wav"
  sox "$label/**/*.wav" "tmp/batch-$label.wav"
  ffmpeg -i "tmp/batch-$label.wav" -f segment -segment_time 10.1 -c copy "tmp/$label%05d.wav"

  FILES=tmp/$label*.wav
  for f in $FILES
  do
    echo "Processing $f..."
    b=$(basename $f)
    sox $f "data/$label/$b" trim 0 10 rate 22050
    rm $f
  done
  rm data/$label/$(ls -t data/$label | head -n1)
done

rm tmp/batch-*.wav

echo "Done!"
