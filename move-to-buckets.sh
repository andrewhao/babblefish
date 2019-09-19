#!/usr/bin/env bash

FILES=~/recordings-trimmed/*.mp3
OUTDIR=~/recordings-bucketed

for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  dir=$OUTDIR/$(echo "$b" | cut -d' ' -f1)
  mkdir -p $dir
  mv "$f" $dir
done

