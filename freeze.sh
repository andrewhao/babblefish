#!/usr/bin/env bash

set -euxo pipefail

python app/freeze.py --start_checkpoint=./training/conv.ckpt-1200 --output_file=./graph.pb --clip_duration_ms=5000 --sample_rate=22050 --wanted_words=silence,crying --data_dir=./data
