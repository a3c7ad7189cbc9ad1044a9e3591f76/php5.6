FROM php:5.6-fpm
RUN apt-get update \
    && apt-get install -y zlib1g-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libmemcached-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && printf "\n" | pecl install memcached \
    && docker-php-ext-enable memcached