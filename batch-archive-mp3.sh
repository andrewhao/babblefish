#!/usr/bin/env bash

set -euxo pipefail

FILES=~/recordings-archive/*.wav
for f in $FILES
do
  ffmpeg -i "$f" -codec:a libmp3lame -qscale:a 6 "$f.mp3"
  rm "$f"
done
