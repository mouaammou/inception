FROM debian:bookworm

RUN apt-get update -y && \
 	apt-get install vim -y && \
	apt-get install wget -y && \
	apt-get install -y php8.2 php8.2-fpm php-mysql

COPY tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]
