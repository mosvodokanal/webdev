#!/bin/sh

#docker build \
#    --build-arg HTTP_PROXY=http://172.16.55.221:3128 \
#    --build-arg HTTPS_PROXY=http://172.16.55.221:3128 \
#    --rm -t local/httpd .

#docker tag local/httpd 172.16.3.16:5000/webdev_httpd
#docker push 172.16.3.16:5000/webdev_httpd

#docker stop httpd-test
#docker rm httpd-test

#docker run -d --name httpd-test -ti \
#           --mount type=volume,volume-opt=o=addr=172.16.55.221,volume-opt=device=:/mnt/share/p/Shared/html,volume-opt=type=nfs,source=vol_html,target=/var/www/html \
#           -p 10080:10080 -p 9009:9000 \
#           local/httpd \

# /bin/bash -c "rm -rf /run/httpd/* /tmp/httpd*; /usr/sbin/httpd -D FOREGROUND"

#docker start httpd-test
#docker exec -ti httpd-test /bin/bash

