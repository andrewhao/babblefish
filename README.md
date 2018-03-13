# babblefish

## Getting data

Record on rpi with `arecord`, rsync it to `raw/` directory here.

## Batchify

Find the valid recordings and use `sox` to batch up

## Cleaning up data

Run `./amplify-raw.sh`

## Partitioning

Run `./partition-edited.sh` to cut up training set.

## Learning

Trying to run the training app directly pointed at this app.

Getting:

```
InvalidArgumentError (see above for traceback): Data too short when trying to read value
         [[Node: DecodeWav = DecodeWav[desired_channels=1, desired_samples=192000, _device="/job:localhost/replica:0/task:0/device:CPU:0"](ReadFile)]]
```

Seems like the WAV file partitions might be too short? Need exactly `SAMPLE_RATE*DURATION_MS` samples in WAV files!
