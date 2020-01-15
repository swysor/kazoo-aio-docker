#!/bin/bash

version=$1

if [ -z "$version" ]; then
  echo "Defaulting to version 'latest'"
  version="latest"
fi

docker build \
    -f Dockerfile \
    -t 2600hz/kazoo-aio:$version .
