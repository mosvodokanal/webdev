#!/bin/sh

#need install nfs client on all nodes
#yum install nfs-utils

docker volume create \
    --driver local \
    --opt type=nfs \
    --opt o=addr=172.16.55.221,rw \
    --opt device=:/mnt/share/p/Shared/html \
    mynfs

docker run --name nfs-test -it -v mynfs:/foo alpine sh

docker container rm nfs-test
docker volume rm mynfs
