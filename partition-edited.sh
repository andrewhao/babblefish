#!/bin/bash

ffmpeg -i edited/edited-batch-crying.wav -f segment -segment_time 5 -c copy crying/crying%05d.wav
ffmpeg -i edited/edited-batch-silence.wav -f segment -segment_time 5 -c copy silence/silence%05d.wav
