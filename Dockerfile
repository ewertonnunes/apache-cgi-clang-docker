#Distro and Version used in this lab.
FROM ubuntu:20.04

## Owner
MAINTAINER underdog <underdog@ezton.net>

#No asking for timezone configuration.
ARG DEBIAN_FRONTEND=noninteractive

#ENV CONTAINER_TIMEZONE="America/Sao_Paulo"
#RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

## Steps to install Update Image and Install Apache WebServer and some util tools to debug and ts.
RUN apt-get update -qq && apt-get install -y apache2 && apt-get clean
RUN apt-get install -y wget curl net-tools
RUN a2enmod cgid
RUN a2enmod cgi

### All Envinroment variables need to review and checkout if useful.
ENV CONTENT_TYPE text/html
ENV CONTENT_LENGTH 30
ENV QUERY_STRING Ewer
ENV REQUEST_METHOD POST

## Apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html
ENV APACHE_CGI_DIR /usr/lib/cgi-bin

#Moving binaries and html files to webserver folders.
COPY bin/* /usr/lib/cgi-bin/
COPY *.html /var/www/html/
RUN chmod +x /usr/lib/cgi-bin/main.cgi
RUN chmod +x /usr/lib/cgi-bin/content.cgi
## Run apachectl as daemon on background.
CMD ["apachectl", "-D", "FOREGROUND"]

## Expose container service port 80.
EXPOSE 80
