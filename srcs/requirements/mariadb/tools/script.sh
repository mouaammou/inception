#!/bin/bash
service mariadb start 

echo "CREATE DATABASE IF NOT EXISTS $database ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$user'@'%' IDENTIFIED BY '$password' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$root_password' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld