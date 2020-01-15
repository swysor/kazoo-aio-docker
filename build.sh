#!/bin/bash

version=$1

if [ -z "$version" ]; then
  echo "Defaulting to version 'latest'"
  version="latest"
fi

docker build \
    -f Dockerfile \
    --add-host kazoo-aio.test.com:127.0.0.1 \
    -t 2600hz/kazoo-aio:$version .
