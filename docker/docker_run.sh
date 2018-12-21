#!/bin/sh

#make new container with name webdev on base centos
docker run --name webdev  -t -i centos /bin/bash

#run container
docker start webdev

#connect to container
#docker attach webdev

#show into
#docker logs webdev

#push into hub.docker.com
#docker login
#docker tag mosvodokanal/webdev:latest mosvodokanal/webdev:latest
#docker push mosvodokanal/webdev:latest
