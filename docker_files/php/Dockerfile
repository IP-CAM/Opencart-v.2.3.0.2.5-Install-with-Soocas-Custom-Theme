#php
FROM php:7.4-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libzip-dev \
        libmcrypt-dev
RUN docker-php-ext-install -j$(nproc) iconv  \
        && docker-php-ext-configure gd --with-freetype --with-jpeg \
        && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install -j$(nproc) mysqli
RUN docker-php-ext-install -j$(nproc) zip

RUN pecl install mcrypt-1.0.3  \
    && docker-php-ext-enable mcrypt