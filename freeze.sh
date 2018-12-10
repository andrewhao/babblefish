#!/usr/bin/env bash

set -euxo pipefail

python app/freeze.py --start_checkpoint=./training/conv.ckpt-$CKPT_NUM --output_file=./graph.pb --clip_duration_ms=10000 --sample_rate=22050 --wanted_words=silence,room_empty,crying --data_dir=./data
