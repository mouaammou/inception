# service mariadb start;

# mysql -e "CREATE DATABASE IF NOT EXISTS root;"

# mysql -e "CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '123';"

# mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '123';"

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123';"

# mysql -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p'123' shutdown

# exec mysqld_safe

# Start the MariaDB service
# service mariadb start

# # Create the database if it doesn't exist
# mysql -u root -p'123' -e "CREATE DATABASE IF NOT EXISTS root;"

# # Create the user if it doesn't exist
# mysql -u root -p'123' -e "CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '123';"

# # Grant all privileges to the user
# mysql -u root -p'123' -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '123';"

# # Alter the user to ensure the password is set
# mysql -u root -p'123' -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123';"

# # Flush privileges to ensure all changes take effect
# mysql -u root -p'123' -e "FLUSH PRIVILEGES;"

# # Shut down the MariaDB server
# mysqladmin -u root -p'123' shutdown

# # Start MariaDB in safe mode
# exec mysqld_safe


# Start the MySQL service
service mariadb start 

# Create a SQL script to set up the database and user
db1_name="root"
db1_user="root"
db1_pwd="root"

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

