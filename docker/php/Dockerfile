ARG PHP_VERSION=${PHP_VERSION}
FROM php:${PHP_VERSION}-fpm
COPY php.ini /usr/local/etc/php/

ARG NODE_VERSION=${NODE_VERSION}
RUN apt-get update && \
    apt-get install -y libzip-dev default-mysql-client && \
    apt-get install -y unzip && \
    docker-php-ext-install zip pdo_mysql && \
    apt-get install -y \
    curl \
    vim \
    gnupg && \
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    npm install npm@latest -g

#Compose install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');"

ENV COMPOSER_ALLOW_SUPERUSER 1 \
    COMPOSER_HOME /composer \
    PATH $PATH:/composer/vendor/bin

RUN mv composer.phar /usr/local/bin/composer

ARG CONTAINER_SRC_ROOT=${CONTAINER_SRC_ROOT}
WORKDIR ${CONTAINER_SRC_ROOT}

RUN composer global require "laravel/installer"