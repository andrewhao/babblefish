#!/usr/bin/env bash

shopt -s globstar
set -euxo pipefail

mkdir -p tmp
mkdir -p data/crying
mkdir -p data/silence
mkdir -p data/room_empty

rm -f tmp/*
rm -f data/crying/*.wav
rm -f data/silence/*.wav
rm -f data/room_empty/*.wav

sox crying/**/*.wav tmp/batch-crying.wav
sox silence/**/*.wav tmp/batch-silence.wav
sox room_empty/**/*.wav tmp/batch-room_empty.wav

ffmpeg -i tmp/batch-crying.wav -f segment -segment_time 5.1 -c copy tmp/crying%05d.wav
ffmpeg -i tmp/batch-silence.wav -f segment -segment_time 5.1 -c copy tmp/silence%05d.wav
ffmpeg -i tmp/batch-room_empty.wav -f segment -segment_time 5.1 -c copy tmp/room_empty%05d.wav

rm tmp/batch-*.wav

FILES=tmp/crying*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/crying/$b trim 0 5 vol 45 dB rate 22050
done
rm data/crying/$(ls -t data/crying | head -n1)

FILES=tmp/silence*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/silence/$b trim 0 5 vol 45 dB rate 22050
done
rm data/silence/$(ls -t data/silence | head -n1)

FILES=tmp/room_empty*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/room_empty/$b trim 0 5 vol 45 dB rate 22050
done
rm data/room_empty/$(ls -t data/room_empty | head -n1)
