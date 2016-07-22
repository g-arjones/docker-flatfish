#!/bin/bash

. settings.sh

docker build -t flatfish .

envsubst < Dockerfile.isolated > .Dockerfile.tmp
docker build -t flatfish:isolated \
                  -f .Dockerfile.tmp .

rm -rf .Dockerfile.tmp

