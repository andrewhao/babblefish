#!/usr/bin/env bash

set -euxo pipefail

python $(dirname $0)/app/label_wav_and_upload_to_server.py --graph=$(dirname $0)/graph.pb --labels=$(dirname $0)/conv_labels.txt --wav="$1"
