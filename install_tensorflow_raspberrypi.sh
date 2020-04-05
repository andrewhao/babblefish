#!/usr/bin/env bash

set -euxo pipefail

. ./venv/bin/activate
wget https://github.com/lhelontra/tensorflow-on-arm/releases/download/v2.1.0/tensorflow-2.1.0-cp37-none-linux_armv7l.whl
pip3 install --upgrade setuptools
pip3 install tensorflow-2.1.0-cp37-none-linux_armv7l.whl

