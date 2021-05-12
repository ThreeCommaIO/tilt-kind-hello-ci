#!/bin/bash
# creatre the kind cluster
set -ex

if [[ $CIRCLE_SHELL_ENV == *"localbuild"* ]]; then
  export DOCKER_HOST=unix:///var/run/docker.sock
  # does a local kind cluster already exist?
  kind export kubeconfig || true

  if ctlptl get cluster kind-kind; then
    PORT=$(kubectl config view --minify | grep server | cut -f 2- -d ":" | tr -d " " | awk '{split($0,a,":"); print a[3]}')
    ctlptl socat connect-remote-docker "$PORT"
  fi
fi

ctlptl apply -f registry.yaml
ctlptl apply -f cluster.yaml
