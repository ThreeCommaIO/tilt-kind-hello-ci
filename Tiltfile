# -*- mode: Python -*-

# For more on Extensions, see: https://docs.tilt.dev/extensions.html
load('ext://restart_process', 'docker_build_with_restart')

# only needed if we arent using a CI that builds the docker image
docker_build(
  'helloworld',
  '.',
  entrypoint=['/go/bin/app'],
  dockerfile='Dockerfile',
)

k8s_yaml('deployment.yaml')
k8s_resource('helloworld', port_forwards=8080)