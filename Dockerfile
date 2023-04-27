# 1 Set master image
FROM erpeso/alpine-php-webserver:latest

# 3 Install Additional dependencies
RUN apk update && apk add --no-cache \
build-base shadow vim curl \
php7 \
php7-fpm \
php7-common \
php7-pdo \
php7-pdo_mysql \
php7-mysqli \
php7-mcrypt \
php7-mbstring \
php7-xml \
php7-openssl \
php7-json \
php7-phar \
php7-zip \
php7-gd \
php7-dom \
php7-session \
php7-zlib

# 4 Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-enable pdo_mysql

# 5 Install PHP Composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 6 Remove Cache
RUN rm -rf /var/cache/apk/*

# 7 Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# 8 Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html


