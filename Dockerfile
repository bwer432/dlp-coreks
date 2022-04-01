FROM php:8.0.1-apache
COPY index.php /var/www/html/
ENV GREETING="Hello from"
RUN chmod a+rx index.php
