#!/bin/sh

mkdir -p /etc/systemd/system/docker.service.d

{ 
  echo "[Service]" 
  echo "Environment=\"HTTP_PROXY=http://172.16.55.221:3128/\"" 
} >> /etc/systemd/system/docker.service.d/http-proxy.conf


systemctl show --property Environment docker
systemctl daemon-reload
systemctl restart docker
