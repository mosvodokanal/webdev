# Version: 0.0.4
FROM centos:7

ENV container docker

MAINTAINER Mosvodokanal <mvk-ais@yandex.ru>

# include repositories
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && yum install -y https://centos7.iuscommunity.org/ius-release.rpm \
 && yum install -y https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm

# normal updates
RUN yum update -y

# dependens for Microsoft PHP Drivers for SQL Server
RUN ACCEPT_EULA=Y yum install -y msodbcsql mssql-tools unixODBC-devel

# Install Tools
RUN yum install -y mc less curl git wget net-tools

# for development
RUN yum -y group install "Development Tools"

#Install PHP 7.2
RUN yum install -y php72u-bcmath php72u-cli php72u-common \
    php72u-dba php72u-devel php72u-intl php72u-json php72u-mbstring \
    php72u-mcrypt php72u-odbc php72u-pear \
    php72u-xml php72u-xmlrpc php72u-mysqlnd php72u-pecl-xdebug php72u-ldap 
RUN yum install -y pear pecl libuuid libuuid-devel

#Install httpd 2.4
RUN yum install -y httpd24u httpd24u-mod_xsendfile mod_php72u

# User
RUN groupadd --gid 1000 www-data && \
    useradd --no-log-init --no-create-home --shell /usr/sbin/nologin --uid 1000 --gid 1000 -G apache www-data

#Install Firebird 3.0.4
RUN yum install -y libtommath; \
    mkdir -p /usr/src; \
    cd /usr/src; \
    wget https://github.com/FirebirdSQL/firebird/releases/download/R3_0_4/Firebird-3.0.4.33054-0.amd64.tar.gz && \
    tar -xvzf Firebird-3.0.4.33054-0.amd64.tar.gz; \
    cd Firebird* && \
    ./install.sh -silent;

# download php source and build pdo drivers modules
RUN yum install -y freetds freetds-devel unixODBC unixODBC-devel; \
    export PHP_VERSION="`php -r \"echo phpversion();\"`"; \
    cd /usr/src; \
    wget -O php-src-php-$PHP_VERSION.tar.gz http://github.com/php/php-src/archive/php-$PHP_VERSION.tar.gz && \
    tar -xvzf php-src-php-$PHP_VERSION.tar.gz && \
    cd ./php-src-php-$PHP_VERSION/ext \
    && ( \
        cd ./pdo \
        && phpize \
        && ./configure \
        && make \
        && make install \
       ) \
    && ( \
        cd ./pdo_dblib \
        && phpize \
        && ./configure --with-libdir=lib64 \
        && make \
        && make install \
        && { \
             echo "extension=pdo_dblib.so"; \
           } > /etc/php.d/30-pdo_dblib.ini; \
       ) \
    && ( \
        cd ./pdo_firebird \
        && phpize \
        && ./configure \
        && make \
        && make install \
        && { \
             echo "extension=pdo_firebird.so"; \
           } > /etc/php.d/30-pdo_firebird.ini; \
       ) \
    && ( \
        cd ./pdo_mysql \
        && phpize \
        && ./configure \
        && make \
        && make install \
        && { \
             echo "extension=pdo_mysql.so"; \
           } > /etc/php.d/30-pdo_mysql.ini; \
       ) \
    && ( \
        cd ./interbase \
        && phpize \
        && ./configure \
        && make \
        && make install \
        && { \
             echo "extension=interbase.so"; \
           } > /etc/php.d/20-interbase.ini; \
       )

#Build pecl modules
RUN yum install -y libmemcached libmemcached-devel zlib-devel \
    && { echo "/usr" | pecl install memcached; } \
    && { \
         echo "extension=memcached.so"; \
       } > /etc/php.d/40-memcached.ini 

RUN { yes "" | pecl install uuid; } \
    && { \
         echo "extension=uuid.so"; \
       } > /etc/php.d/40-uuid.ini 

# Microsoft PHP Drivers for SQL Server
RUN { pecl install sqlsrv; } \
    && { \
         echo "extension=sqlsrv.so"; \
       } > /etc/php.d/20-sqlsrv.ini \
    && { pecl install pdo_sqlsrv; } \
    && { \
         echo "extension=pdo_sqlsrv.so"; \
       } > /etc/php.d/30-pdo_sqlsrv.ini 

# Setting xdebug
RUN { \
	echo "zend_extension = xdebug.so"; \
	echo "xdebug.remote_enable = 1"; \
	echo "xdebug.remote_connect_back = 1"; \
	echo "xdebug.remote_port = 9000"; \
	echo "xdebug.var_display_max_data = 2048"; \
	echo "xdebug.var_display_max_depth = 128"; \
	echo "xdebug.max_nesting_level = 500"; \
	echo "xdebug.remote_log = /tmp/xdebug.log"; \
    } > /etc/php.d/15-xdebug.ini 

#Install pear modules
RUN pear install XML_Serializer-0.21.0 \
 && pear install MIME_Type-1.4.1;

# Cache cleaning
RUN yum clean all

# Setting
VOLUME [ "/var/www/html" ]

RUN cd /etc && rm -f localtime && ln -s /usr/share/zoneinfo/Europe/Moscow localtime
RUN ln -s /var/www/html/phpodata /usr/share/php/phpodata
RUN ln -s /var/www/html/adodb5 /usr/share/php/adodb5

# HTTP setting
COPY ./conf/vhost.conf /etc/httpd/conf.d/vhost.conf

# PHP setting
COPY ./conf/php.ini /etc/php.ini

# FreeTDS setting
COPY ./conf/freetds.conf /usr/local/etc/freetds.conf

#
EXPOSE 1080 1081 9000 10080 10082 10084 10889 10900

ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]

