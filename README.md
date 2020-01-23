### All in one kazoo container

Basically a vm runs an all in one container with the full kazoo stack in one vm using systemd as the entrypoint

#### Setup:

##### execute the configure script

```
./configure.sh {hostname} {local_ip} {public_ip}

```

##### execute the build script

```
./build.sh

```

##### run the container

```
./run.sh

```

