#!/bin/bash

version=$1

if [ -z "$version" ]; then
  echo "Defaulting to version 'latest'"
  version="latest"
fi

docker stop kazoo-aio
docker rm -f kazoo-aio

docker network create private
docker network create public

mkdir /var/lib/docker-mounts/kazoo-aio

docker run -d \
   --name kazoo-aio \
   --volume=/var/lib/docker-mounts/kazoo-aio:/srv/db \
   --hostname kazoo-aio.test.com \
   --privileged \
   2600hz/kazoo-aio:$version

