#!/usr/bin/env bash

set -euxo pipefail

python app/label_wav.py --graph=./graph.pb --labels=./conv_labels.txt --wav=$1
