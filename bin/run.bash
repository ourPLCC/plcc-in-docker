#!/bin/sh

set -eux

docker run -it --rm ourplcc/plcc-in-docker:build "$@"
