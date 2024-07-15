#!/bin/bash
service mariadb start 

mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;"
mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" 
mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" 
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS' ;" 
mysql -e "FLUSH PRIVILEGES;" 


kill $(cat /var/run/mysqld/mysqld.pid)

mysqld