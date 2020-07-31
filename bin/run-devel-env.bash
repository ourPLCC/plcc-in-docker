#!/bin/bash

docker-compose -f ./devel-env/docker-compose.yml build
docker-compose -f ./devel-env/docker-compose.yml run --rm devel-env
