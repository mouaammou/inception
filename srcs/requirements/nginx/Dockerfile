FROM debian:bullseye

RUN apt-get update -y && apt-get install nginx -y && \
	apt-get install openssl -y && \
 	apt-get install vim -y

RUN mkdir -p /etc/nginx/ssl

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MR/ST=IDF/L=Casa/O=42/OU=42/CN=mouaammo.42.fr/UID=mouaammo"

COPY conf/default.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]