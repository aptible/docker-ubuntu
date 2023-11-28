# ![](https://gravatar.com/avatar/11d3bc4c3163e3d238d558d5c9d98efe?s=64) aptible/ubuntu

[![Docker Repository on Quay.io](https://quay.io/repository/aptible/ubuntu/status)](https://quay.io/repository/aptible/ubuntu)
[![Build Status](https://travis-ci.org/aptible/docker-ubuntu.svg?branch=master)](https://travis-ci.org/aptible/docker-ubuntu)

Ubuntu base image with custom Aptible patches and Dockerfile building tools.

## Intended Use

This image is used internally by Aptible. We do not recommend that customers
use this repo, and instead recommend the Official Docker Ubuntu image:
https://hub.docker.com/_/ubuntu

Please see our [FAQ](https://www.aptible.com/documentation/deploy/tutorials/faq/aptible-base-images.html)
for further information.

## Installation and Usage

    docker pull quay.io/aptible/ubuntu
    docker run -i -t quay.io/aptible/ubuntu

## Available Tags

* `22.04`: Ubuntu 20.04 (LTS)
* `20.04`: Ubuntu 20.04 (LTS)
* `18.04`: Ubuntu 18.04 (LTS)
* `16.04`: Ubuntu 16.04 (LTS)
* `latest`: Ubuntu 14.04 (LTS)
* `14.04`: Ubuntu 14.04 (LTS)
* `12.04`: Ubuntu 12.04 (LTS)

## Included Tools/Patches

* `bats`: The [Bats](https://github.com/sstephenson/bats) Bash Automated Testing System
* `git`: Git Version Control System.
* All Ubuntu LTS security updates (but not non-critical updates).

## Tests

Tests are run as part of the `Dockerfile` build. To execute them separately within a container, run:

    bats test

## Deployment

To push the Docker image to Quay, run the following command:

    make release

## Copyright and License

MIT License, see [LICENSE](LICENSE.md) for details.

Copyright (c) 2019 [Aptible](https://www.aptible.com) and contributors.
