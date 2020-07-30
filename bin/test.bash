#!/bin/sh

set -eux

docker run -it --rm ourplcc/plcc-in-docker:build python3 --version
docker run -it --rm ourplcc/plcc-in-docker:build java -version
docker run -it --rm ourplcc/plcc-in-docker:build javac -version
docker run -it --rm ourplcc/plcc-in-docker:build bash --version
