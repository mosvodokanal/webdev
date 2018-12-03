# Version: 0.0.2
FROM centos:7

MAINTAINER Mosvodokanal <mvk-ais@yandex.ru>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://centos7.iuscommunity.org/ius-release.rpm


# normal updates
RUN yum update -y

# for development
RUN yum -y group install "Development Tools"

# any tools
RUN yum install -y mc less at curl crontabs git wget

RUN yum install -y httpd24u

RUN yum install -y php72u-bcmath php72u-cli php72u-common php72u-dba php72u-devel php72u-intl php72u-json php72u-mbstring php72u-mcrypt php72u-odbc php72u-pdo php72u-pdo-dblib php72u-pear php72u-pecl-xdebug php72u-xml php72u-xmlrpc php72u-mysqlnd php72u-pecl-xdebug mod_php72u php72u-ldap 
RUN yum install -y pear pecl

#install firebird
RUN yum install -y libtommath; \
    mkdir -p /usr/src; \
    cd /usr/src; \
    wget https://github.com/FirebirdSQL/firebird/releases/download/R3_0_4/Firebird-3.0.4.33054-0.amd64.tar.gz && \
    tar -xvzf Firebird-3.0.4.33054-0.amd64.tar.gz; \
    cd Firebird* && \
    ./install.sh -silent;

# download php source and build pdo_firebird module
RUN export PHP_VERSION="`php -r \"echo phpversion();\"`"; \
    cd /usr/src; \
    wget -O php-src-php-$PHP_VERSION.tar.gz http://github.com/php/php-src/archive/php-$PHP_VERSION.tar.gz && \
    tar -xvzf php-src-php-$PHP_VERSION.tar.gz; \
    cd ./php-src-php-$PHP_VERSION/ext/pdo_firebird; \
    phpize; \
    ./configure; \
    make; \
    make install; 


EXPOSE 80
EXPOSE 10080
EXPOSE 10081
