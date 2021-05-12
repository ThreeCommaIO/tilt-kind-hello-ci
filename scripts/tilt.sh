#!/bin/bash

set -ex

# cd to the root of the repo.
cd $(dirname $(dirname $0))

tilt ci --file Tiltfile
tilt down --file Tiltfile
