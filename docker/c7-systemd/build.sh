#!/bin/sh

docker build --rm -t local/c7-systemd .

#docker tag local/c7-systemd 172.16.3.16:5000/c7-systemd
#docker push 172.16.3.16:5000/c7-systemd

#docker stop c7
#docker rm c7

#docker run --name c7 -ti \
#        -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
#        local/c7-systemd /bin/bash

#docker start c7
#docker attach c7
