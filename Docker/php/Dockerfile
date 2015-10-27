FROM php:5.6-apache
ENV DOCKER_USER_ID 501 
ENV DOCKER_USER_GID 20

ENV BOOT2DOCKER_ID 1000
ENV BOOT2DOCKER_GID 50

RUN usermod -u ${BOOT2DOCKER_ID} www-data && \
    usermod -G staff www-data && \
    usermod -G staff mysql

RUN groupmod -g $(($BOOT2DOCKER_GID + 10000)) $(getent group $BOOT2DOCKER_GID | cut -d: -f1)
RUN groupmod -g ${BOOT2DOCKER_GID} staff

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libmcrypt-dev \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libssl-dev \
    mysql-client \
    php5-mysql \
    php5-xdebug \
    wget \
    git \
    && docker-php-ext-install iconv mcrypt curl xml mysql mysqli pdo pdo_mysql phar soap
RUN a2enmod rewrite
RUN rm /etc/apache2/apache2.conf
RUN rm /etc/apache2/sites-available/000-default.conf
COPY configs/php.ini /usr/local/etc/php/php.ini
COPY configs/apache2.conf /etc/apache2/apache2.conf
COPY configs/sites/* /etc/apache2/sites-available/
RUN mkdir -p /var/lib/php5/sessions
RUN chmod ugo+rw /var/lib/php5/sessions
RUN wget http://xdebug.org/files/xdebug-2.3.3.tgz
RUN tar -xvzf xdebug-2.3.3.tgz
RUN cd xdebug-2.3.3; phpize; ./configure; make; cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20100525;
