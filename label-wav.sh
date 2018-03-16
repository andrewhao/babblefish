#!/usr/bin/env bash

set -euxo pipefail

python app/label_wav_and_upload_to_server.py --graph=./graph.pb --labels=./conv_labels.txt --wav=$1
