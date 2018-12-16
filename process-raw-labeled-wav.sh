#!/usr/bin/env bash

shopt -s globstar
set -euxo pipefail

mkdir -p tmp
mkdir -p data/crying
mkdir -p data/white_noise
mkdir -p data/room_empty

rm -f tmp/*
rm -f data/crying/*.wav
rm -f data/white_noise/*.wav
rm -f data/room_empty/*.wav

sox crying/**/*.wav tmp/batch-crying.wav
sox white_noise/**/*.wav tmp/batch-white_noise.wav
sox room_empty/**/*.wav tmp/batch-room_empty.wav

ffmpeg -i tmp/batch-crying.wav -f segment -segment_time 10.1 -c copy tmp/crying%05d.wav
ffmpeg -i tmp/batch-white_noise.wav -f segment -segment_time 10.1 -c copy tmp/white_noise%05d.wav
ffmpeg -i tmp/batch-room_empty.wav -f segment -segment_time 10.1 -c copy tmp/room_empty%05d.wav

rm tmp/batch-*.wav

FILES=tmp/crying*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/crying/$b trim 0 10 rate 22050
done
rm data/crying/$(ls -t data/crying | head -n1)

FILES=tmp/white_noise*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/white_noise/$b trim 0 10 rate 22050
done
rm data/white_noise/$(ls -t data/white_noise | head -n1)

FILES=tmp/room_empty*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  sox $f data/room_empty/$b trim 0 10 rate 22050
done
rm data/room_empty/$(ls -t data/room_empty | head -n1)
