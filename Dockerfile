# Version: 0.0.1
FROM centos:7

MAINTAINER Alex Safonov <sf78@yandex.ru>

RUN yum update -y

RUN yum install -y httpd

EXPOSE 80
EXPOSE 10080
