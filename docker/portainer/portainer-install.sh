#!/bin/sh

docker run --name portainer -d --privileged \
	--restart always \
	-p 9009:9000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /opt/portainer:/data \
	portainer/portainer

#docker ps

