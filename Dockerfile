FROM php:7.4.3-fpm-alpine3.11
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql


WORKDIR /var/www
RUN rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#COPY . /var/www
RUN chown -R www-data:www-data /var/www
RUN ln -s public html

EXPOSE 9000
ENTRYPOINT ["php-fpm"]

