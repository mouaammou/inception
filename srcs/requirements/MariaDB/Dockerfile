FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install mariadb-server -y && \
	apt-get install curl -y && \
 	apt-get install vim -y && \
	apt-get install zsh -y && \
	apt-get install git -y && \
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /

CMD ["./script.sh"]