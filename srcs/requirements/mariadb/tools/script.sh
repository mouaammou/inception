#!/bin/bash
service mariadb start 

echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

# Execute the SQL script using MySQL client with root user and password
mysql -u root -p'12345' < db1.sql

# Stop the MySQL service
kill $(cat /var/run/mysqld/mysqld.pid)

# Start MySQL in safe mode
mysqld_safe

