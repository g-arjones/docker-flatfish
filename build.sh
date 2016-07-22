#!/bin/bash

. settings.sh

printf "Building docker images. This may take serveral hours... "

sudo docker build -t flatfish . > /dev/null

envsubst < Dockerfile.isolated > .Dockerfile.tmp
sudo docker build -t flatfish:isolated \
                  -f .Dockerfile.tmp . > /dev/null

rm -rf .Dockerfile.tmp
printf "DONE.\n"

