FROM debian:bookworm

RUN apt-get update -y && apt-get install nginx -y
RUN apt-get install curl -y && apt-get install vim -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MR/ST=IDF/L=Casa/O=42/OU=42/CN=mouaammo.42.fr/UID=mouaammo"
RUN mkdir -p /var/run/nginx && echo '0.0.0.0 mouaammo.42.fr' >> /etc/hosts/

COPY conf/default.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]