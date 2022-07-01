FROM php:8.0-fpm-alpine

# Необязательная строка с указанием автора образа
# LABEL maintainer=""

# RUN выполняет идущую за ней команду в контексте нашего образа.
# Для установки модулей используем команду docker-php-ext-install.

RUN apk --no-cache add imagemagick imagemagick-dev build-base autoconf make \
&& pecl install imagick \
&& docker-php-ext-enable imagick

RUN apk update && apk add --no-cache \
        libzip-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        libwebp-dev \
        freetype-dev \
	libmcrypt-dev \
        php8-cli \      
        && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp \
        && docker-php-ext-install pdo_mysql mysqli zip sockets bcmath exif \
        && docker-php-ext-install -j$(nproc) gd

# install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clean
RUN rm -rf /var/cache/apk/* \
        && rm -rf /var/lib/apt/lists/* \
        && docker-php-source delete

# Добавим свой .ini, можем в нем определять свои значения конфига
ADD php.ini /usr/local/etc/php-8.0/conf.d/php.ini
# ADD opcache.ini /usr/local/etc/php-8.0/conf.d/opcache.ini

# Указываем рабочую директорию для PHP
WORKDIR /var/www

# Запускаем контейнер
# Из документации: The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, 
# or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.
EXPOSE 9000
CMD php-fpm
