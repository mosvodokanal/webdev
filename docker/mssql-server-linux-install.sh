#!/bin/sh

docker run -e "ACCEPT_EULA=Y" -e 'MSSQL_SA_PASSWORD=Masterkey1' \
     -p 1433:1433 --name sql1 \
     -v /var/opt/mssql:/var/opt/mssql \
     -d microsoft/mssql-server-linux:2017-GA
     
