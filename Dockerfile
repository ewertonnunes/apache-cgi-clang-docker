FROM ubuntu:20.04

MAINTAINER underdog <underdog@ezton.net>

ARG DEBIAN_FRONTEND=noninteractive

#ENV CONTAINER_TIMEZONE="America/Sao_Paulo"
#RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt-get update -qq && apt-get install -y apache2 && apt-get clean
RUN apt-get install -y wget curl net-tools
RUN a2enmod cgid
RUN a2enmod cgi

ENV CONTENT_TYPE
ENV CONTENT_LENGTH
ENV QUERY_STRING
ENV REQUEST_METHOD

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html
ENV APACHE_CGI_DIR /usr/lib/cgi-bin

COPY bin/* /usr/lib/cgi-bin/
COPY *.html /var/www/html/
# COPY imagens /var/www/html/imagens
# COPY covid /var/www/html/covid
# COPY *.html /var/www/html/
# COPY *.css /var/www/html/
RUN chmod +x /usr/lib/cgi-bin/example
RUN chmod +x /usr/lib/cgi-bin/main

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80
