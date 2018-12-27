#!/bin/sh

#showmount -e 172.16.55.221

#docker run -d -p 5000:5000 \
#    --restart=always --name registry \
#    --mount type=volume,volume-opt=o=addr=172.16.55.221,volume-opt=device=:/mnt/share/p/Shared/registry,volume-opt=type=nfs,source=vol_registry,target=/var/lib/registry \
#    registry:2

#docker tag webdev/httpd:latest 172.16.3.16:5000/webdev_httpd
#docker push 172.16.3.16:5000/webdev_httpd
#docker image remove localhost:5000/webdev_httpd:latest

#docker container stop registry && docker container rm -v registry