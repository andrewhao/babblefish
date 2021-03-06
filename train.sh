#!/usr/bin/env bash

set -euxo pipefail

python app/train.py --data_url= --data_dir=./data --wanted_words=white_noise,room_empty,crying,talking,headbanging --sample_rate=22050 --clip_duration_ms=10000 --how_many_training_steps=500,50 --train_dir=./training --background_volume=0.01
