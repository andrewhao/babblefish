# babblefish

## File structure

```
app/       - TF training scripts
crying/    - raw crying sample WAVs from source device
silence/   - raw silence sample WAVs from source device
data/
  crying/  - normalized WAVs for crying label
  silence/  - normalized WAVs for silence label
```

## Getting data

Record on rpi with `arecord`, rsync it to `raw/` directory here.

## Batchify

Find the valid recordings and use `sox` to batch up

## Cleaning up data

The `process-raw-labeled-wav.sh` script will:

1. Take raw samples in `crying/` and `silence/` folders
1. Batch them up and splice them evenly into 5-second segments
1. Amplify 45dB, downsample to 22050
1. Store in `data/<LABEL>` directory.

## Learning

Trying to run the training app directly pointed at this app.

Getting:

```
InvalidArgumentError (see above for traceback): Data too short when trying to read value
         [[Node: DecodeWav = DecodeWav[desired_channels=1, desired_samples=192000, _device="/job:localhost/replica:0/task:0/device:CPU:0"](ReadFile)]]
```

Seems like the WAV file partitions might be too short? Need exactly `SAMPLE_RATE*DURATION_MS` samples in WAV files!

## Training

```
python app/train.py --data_url= --data_dir=/Users/andrewhao/workspace/babblefish/data --wanted_words=silence,crying --sample_rate=48000 --clip_duration_ms=5000 --start_checkpoint=/tmp/speech_commands_train/conv.ckpt-1300 --how_many_training_steps=1400,300
```

### Freeze

```
python app/freeze.py --start_checkpoint=/tmp/speech_commands_train/conv.ckpt-1700 --output_file=./graph.pb --clip_duration_ms=5000 --sample_rate=48000 --how_many_training_steps=1400,300 --wanted_words=silence,crying --data_dir=/Users/andrewhao/workspace/babblefish/data
```

### Label

```
python app/label_wav.py --graph=./graph.pb --labels=./conv_labels.txt --wav=data/crying/crying00021.wav
```
