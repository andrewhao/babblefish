#!/usr/bin/env bash

set -euxo pipefail

python app/train.py --data_url= --data_dir=./data --wanted_words=silence,crying --sample_rate=22050 --clip_duration_ms=5000 --how_many_training_steps=1000,200 --train_dir=./training
