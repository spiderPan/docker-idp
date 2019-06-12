FROM php:7.3-apache
RUN apt-get update && docker-php-ext-install mysqli pdo_mysql

RUN apt-get install wget
RUN wget https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64
RUN chmod +x mhsendmail_linux_amd64
RUN mv mhsendmail_linux_amd64 /usr/bin/mhsendmail
RUN echo 'sendmail_path = "/usr/bin/mhsendmail --smtp-addr=email:1025"' > /usr/local/etc/php/php.ini