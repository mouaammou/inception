#!/bin/bash
# Start the MariaDB service
service mariadb start

password="123"
database="test_me"
user="memouad"
user_pass="123"


# # Create the database if it doesn't exist
mysql -u root -p$password -e "CREATE DATABASE IF NOT EXISTS $database;"

# # Create the user if it doesn't exist
mysql -u root -p'123' -e "CREATE USER IF NOT EXISTS '$user'@'localhost' IDENTIFIED BY '$user_pass';"

# # Grant all privileges to the user
mysql -u root -p'123' -e "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'localhost' IDENTIFIED BY '$user_pass';"

# # Flush privileges to ensure all changes take effect
mysql -u root -p$password -e "FLUSH PRIVILEGES;"

# # Start MariaDB in safe mode
exec service mariadb restart;
