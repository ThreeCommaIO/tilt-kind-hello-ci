# Tilt + Kind + CircleCI + ctlptl w/ Local build support

This project connects multiple pieces of software together to get your Circle CI pipeline creating Kind clusters, deploying your kubernetes manifests and resources.

At ThreeComma we had use cases where we needed to spin up `kind` clusters either locally (make them long-running), or remote in our `CircleCI` pipeline quickly.

This example project has the structure for spinning up kind, integrating tilt, docker build, pushing to the local registry and supporting remote docker.

## Acknowledgements

- [ctlptl](https://github.com/tilt-dev/ctlptl) (handles creating clusters and local docker image registry support)
- [tilt](https://github.com/tilt-dev/tilt) (building the dockerfile and deploying kube resources)
- [kind](https://github.com/kubernetes-sigs/kind) (handles creating the kubernetes control plane)

## Authors

- [@chrisgoffinet](https://www.github.com/chrisgoffinet)
- [@timbrammer910](https://www.github.com/timbrammer910)

## Contributing

Contributions are always welcome!

## Usage

### Building locally using CircleCI local executor

```bash
circleci local execute --job build
```

### Building through CircleCI job remotely

```
Look at the CircleCI config (.circle/config.yml) for an example, just place that in your project and your build should kickoff.
```

## Feedback

If you have any feedback, please reach out to us at hello@threecomma.io
