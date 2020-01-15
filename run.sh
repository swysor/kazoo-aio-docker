#!/bin/bash

version=$1

if [ -z "$version" ]; then
  echo "Defaulting to version 'latest'"
  version="latest"
fi

docker stop kazoo-aio
docker rm -f kazoo-aio


mkdir /var/lib/docker-mounts/kazoo-data

docker run -d \
   --name kazoo-aio \
   --network host \
   --add-host kazoo-aio.test.com:127.0.0.1 \
   --volume=/var/lib/docker-mounts/kazoo-data:/srv/db \
   --hostname kazoo-aio.test.com \
   --privileged \
   2600hz/kazoo-aio:$version

