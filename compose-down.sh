#!/bin/sh

docker-compose down
docker volume rm mariadb_db_data
docker volume rm mariadb_db_dump
