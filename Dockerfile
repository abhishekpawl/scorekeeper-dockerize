ARG APACHE_VERSION
FROM httpd:$APACHE_VERSION
COPY . /usr/local/apache2/htdocs