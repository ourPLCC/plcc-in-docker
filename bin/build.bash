#!/bin/sh

set -eux

docker build -t ourplcc/plcc-in-docker:build ./plcc-in-docker
