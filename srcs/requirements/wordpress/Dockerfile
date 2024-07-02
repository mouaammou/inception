FROM debian:bookworm

RUN apt-get update -y && \
	apt-get install curl -y && \
 	apt-get install vim -y && \
	apt-get install wget -y && \
	apt-get install -y php php-fpm php-mysql


RUN wget https://wordpress.org/wordpress-6.5.4.tar.gz -P /var/www && \
	cd /var/www && tar -xzf wordpress-6.5.4.tar.gz && rm wordpress-6.5.4.tar.gz && \
	chown -R root:root /var/www/wordpress
