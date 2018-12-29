#!/bin/sh

./compose-down.sh

docker-compose build && docker-compose up -d
