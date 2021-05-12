#!/bin/bash
# creatre the kind cluster
set -ex

if [[ $CIRCLE_SHELL_ENV == *"localbuild"* ]]; then
  export DOCKER_HOST=unix:///var/run/docker.sock
fi

ctlptl apply -f registry.yaml
ctlptl apply -f cluster.yaml
