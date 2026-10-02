FROM php:8.3-apache

RUN docker-php-ext-install pdo_mysql \
    && a2enmod headers

COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf
COPY config/ /var/www/config/
COPY public/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html /var/www/config \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

EXPOSE 80
