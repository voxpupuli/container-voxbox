# Vox Pupuli Test Box

[![CI](https://github.com/voxpupuli/container-voxbox/actions/workflows/ci.yaml/badge.svg)](https://github.com/voxpupuli/container-voxbox/actions/workflows/ci.yaml)
[![License](https://img.shields.io/github/license/voxpupuli/container-voxbox.svg)](https://github.com/voxpupuli/container-voxbox/blob/main/LICENSE)
[![Sponsored by betadots GmbH](https://img.shields.io/badge/Sponsored%20by-betadots%20GmbH-blue.svg)](https://www.betadots.de)

## Introduction

This container should be used to test voxpupuli puppet modules. It has the voxpupuli-test, -acceptance, -release gems and all dependencies installed.

## Example usage

```shell
cd puppet-k8s
docker run -it --rm -v $(pwd):/repo voxpupuli/voxbox # rake -T
docker run -it --rm -v $(pwd):/repo voxpupuli/voxbox spec # rake spec
docker run -it --rm -v $(pwd):/repo --entrypoint bash voxpupuli/voxbox # get shell
```

## Version Schema

The version schema has the following layout:

```text
<puppet.major>.<puppet.minor>.<puppet.patch>-v<container.major>.<container.minor>.<container.patch>
<puppet.major>-v<container.major>.<container.minor>.<container.patch>
<puppet.major>
latest
```

Example usage:

```shell
docker pull ghcr.io/voxpupuli/voxbox:8.5.1-v1.2.3
docker pull ghcr.io/voxpupuli/voxbox:8-v1.2.3
docker pull ghcr.io/voxpupuli/voxbox:8
docker pull ghcr.io/voxpupuli/voxbox:latest
```

| Name | Description |
| --- | --- |
| puppet.major | Describes the contained major Puppet version (7 or 8) |
| puppet.minor | Describes the contained minor Puppet version |
| puppet.patch | Describes the contained patchlevel Puppet version |
| container.major | Describes breaking changes without backward compatibility |
| container.minor | Describes new features or refactoring with backward compatibility |
| container.patch | Describes if minor changes or bugfixes have been implemented |

## How to release?

see [RELEASE.md](RELEASE.md)

## How to contribute?

see [CONTRIBUTING.md](CONTRIBUTING.md)
