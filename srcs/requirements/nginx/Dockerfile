FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx -y
RUN apt-get install curl -y && apt-get install vim -y

RUN mkdir -p /etc/nginx/ssl