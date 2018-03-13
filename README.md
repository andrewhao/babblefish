# babblefish

### Chop up file into time segments:

    $ ffmpeg -i file.wav -f segment -segment_time 30 -c copy parts/output%09d.wav

### Amplify audio files:

    $ sox infile.wav outfile.wav vol 3 dB
