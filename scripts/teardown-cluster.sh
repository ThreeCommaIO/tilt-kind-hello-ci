#!/bin/bash
# delete the cluster on cleanup
set -ex

if [[ $CIRCLE_SHELL_ENV == *"localbuild"* ]]; then
  echo "Skipping teardown, local circleci build"
else
  ctlptl delete --ignore-not-found -f registry.yaml
  ctlptl delete --ignore-not-found -f cluster.yaml
fi
