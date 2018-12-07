#!/bin/sh

#docker build --rm -t local/c7-systemd-httpd .

#docker stop httpd1
#docker rm httpd1

docker run -d --name httpd1 -ti --privileged=true \
           -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
           -v /mnt/share/m/Shared/html:/var/www/html \
           -p 10080:10080 -p 80:10080 \
           local/c7-systemd-httpd


#docker start httpd1
#docker attach httpd1



