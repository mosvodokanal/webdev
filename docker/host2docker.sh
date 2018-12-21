#!/bin/sh

#copy ssh key to host
#ssh-keygen
#ssh-copy-id root@172.16.3.17

#Create machines using an existing VM/Host with SSH.
#docker-machine create \
#    --driver generic \
#    --generic-ip-address=172.16.3.17 \
#    --generic-ssh-key ~/.ssh/id_rsa \
#    webdev-node2