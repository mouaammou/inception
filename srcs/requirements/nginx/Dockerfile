FROM debian:bookworm

RUN apt-get update -y && apt-get install nginx -y && \
	apt-get install curl -y && \
 	apt-get install vim -y && \
	apt-get install zsh -y && \
	apt-get install git -y && \
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

RUN mkdir -p /etc/nginx/ssl

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MR/ST=IDF/L=Casa/O=42/OU=42/CN=mouaammo.42.fr/UID=mouaammo" \
	&& mkdir -p /var/run/nginx \
	&& ln -s /etc/nginx/sites-available/mouaammo.42.fr /etc/nginx/sites-enabled/

COPY conf/default.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]