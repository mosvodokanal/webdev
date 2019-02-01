#!/bin/sh

docker build \
    --build-arg HTTP_PROXY=http://172.16.55.221:3128 \
    --build-arg HTTPS_PROXY=http://172.16.55.221:3128 \
    --rm -t local/webdev_httpd .

#docker tag local/httpd local/webdev_httpd
#docker tag local/webdev_httpd 172.16.3.16:5000/webdev_httpd
#docker image remove 172.16.3.16:5000/webdev_httpd:latest
#docker push 172.16.3.16:5000/webdev_httpd


docker stop webdev-test
docker rm webdev-test
docker volume rm vol_webdev

docker run -d --name webdev-test -ti \
           --mount type=volume,volume-opt=o=addr=172.16.55.221,volume-opt=device=:/mnt/share/p/Shared/html,volume-opt=type=nfs,source=vol_webdev,target=/var/www/html \
           -p 1081:1081 \
           -p 10080:10080 -p 10082:10082 -p 10084:10084 \
           -p 10889:10889 -p 10900:10900 \
           local/webdev_httpd \

#docker start webdev-test
docker exec -ti webdev-test /bin/bash

