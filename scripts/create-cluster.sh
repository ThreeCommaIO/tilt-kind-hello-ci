#!/bin/bash
# creatre the kind cluster
set -ex

if [[ $CIRCLE_SHELL_ENV == *"localbuild"* ]]; then
  export DOCKER_HOST=unix:///var/run/docker.sock
fi

if ! ctlptl get cluster kind-kind; then
  ctlptl apply -f registry.yaml
  ctlptl apply -f cluster.yaml
else
  kind export kubeconfig
  PORT=$(kubectl config view --minify | grep server | cut -f 2- -d ":" | tr -d " " | awk '{split($0,a,":"); print a[3]}')
  ctlptl socat connect-remote-docker "$PORT"
fi
