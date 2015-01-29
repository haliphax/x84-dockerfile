#!/usr/bin/env bash
PWD=$(pwd)
cd $(dirname ${BASH_SOURCE[0]})
MYPWD=$(pwd)
IMAGE=$1
[ -z "$IMAGE" ] && IMAGE=haliphax/x84:latest
sudo docker build -t $IMAGE .
cd $PWD
