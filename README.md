# ![](https://gravatar.com/avatar/11d3bc4c3163e3d238d558d5c9d98efe?s=64) aptible/ubuntu

[![Docker Repository on Quay.io](https://quay.io/repository/aptible/ubuntu/status)](https://quay.io/repository/aptible/ubuntu)

Ubuntu base image with custom Aptible patches and Dockerfile building tools.

## Installation and Usage

    docker pull quay.io/aptible/ubuntu
    docker run -i -t quay.io/aptible/ubuntu

## Available Tags

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

Copyright (c) 2014 [Aptible](https://www.aptible.com) and contributors.

[<img src="https://s.gravatar.com/avatar/f7790b867ae619ae0496460aa28c5861?s=60" style="border-radius: 50%;" alt="@fancyremarker" />](https://github.com/fancyremarker)
