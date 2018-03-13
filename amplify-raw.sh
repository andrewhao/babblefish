#!/bin/bash

FILES=raw/*.wav
for f in $FILES
do
  echo "Processing $f..."
  b=$(basename $f)
  echo "$b"
  sox $f edited/edited-$b vol 45 dB
done
