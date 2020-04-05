#!/usr/bin/env bash

set -euxo pipefail
INPUT_FILE=$1
OUTPUT_FILE="tmp/sample.wav"

mkdir -p tmp

echo "Processing $INPUT_FILE..."
sox "$INPUT_FILE" "$OUTPUT_FILE" trim 0 10 rate 22050

echo "Classifying $OUTPUT_FILE..."
python $(dirname $0)/app/label_wav_and_upload_to_server.py --graph=$(dirname $0)/graph.pb --labels=$(dirname $0)/conv_labels.txt --wav="$OUTPUT_FILE"
