#!/bin/bash

echo "Processing crying files..."
mkdir -p data/crying/tmp

ffmpeg -i edited/edited-batch-crying.wav -f segment -segment_time 5.1 -c copy data/crying/tmp/crying%05d.wav

FILES=data/crying/tmp/*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/crying/$b trim 0 5
done
rm -r data/crying/tmp

echo "Processing silence files..."
mkdir -p data/silence/tmp

ffmpeg -i edited/edited-batch-silence.wav -f segment -segment_time 5.1 -c copy data/silence/tmp/silence%05d.wav

FILES=data/silence/tmp/*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/silence/$b trim 0 5
done
rm -r data/silence/tmp

