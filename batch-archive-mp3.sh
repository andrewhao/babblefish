#!/usr/bin/env bash

FILES=~/recordings-trimmed/*.wav
for f in $FILES
do
  echo "ffmpeg start: $f"
  ffmpeg -i "$f" -codec:a libmp3lame -qscale:a 6 "$f.mp3"
  rm "$f"
done
