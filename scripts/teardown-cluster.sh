#!/bin/bash
# delete the cluster on cleanup
set -ex

cat <<EOF | ctlptl delete -f -
apiVersion: ctlptl.dev/v1alpha1
kind: Cluster
product: kind
registry: ctlptl-registry
---
apiVersion: ctlptl.dev/v1alpha1
kind: Registry
name: ctlptl-registry
EOF
