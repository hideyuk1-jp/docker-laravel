ARG PHP_VERSION=${PHP_VERSION}
FROM php:${PHP_VERSION}-fpm
COPY php.ini /usr/local/etc/php/

RUN apt-get update \
    && apt-get install -y libzip-dev default-mysql-client \
    && apt-get install -y unzip \
    && docker-php-ext-install zip pdo_mysql
RUN apt-get install -y \
    curl \
    gnupg
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g

#Compose install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /composer

ENV PATH $PATH:/composer/vendor/bin
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html

RUN composer global require "laravel/installer"