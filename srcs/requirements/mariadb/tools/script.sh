#!/bin/bash



service mariadb start 

password="123"
database="test_me"
user="memouad"
# user_pass="123"

echo "CREATE DATABASE IF NOT EXISTS $database ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$user'@'%' IDENTIFIED BY '$password' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# #!/bin/bash
# # Start the MariaDB service
# service mariadb start

# password="123"
# database="test_me"
# user="memouad"
# user_pass="123"


# # # Create the database if it doesn't exist
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$password'";
# mysql -u root -p$password -e "CREATE DATABASE IF NOT EXISTS $database;"

# mysql -u root -p$password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$password' ;"
# # # Create the user if it doesn't exist
# mysql -u root -p'123' -e "CREATE USER IF NOT EXISTS '$user'@'localhost' IDENTIFIED BY '$user_pass';"

# # # Grant all privileges to the user
# mysql -u root -p'123' -e "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'localhost' IDENTIFIED BY '$user_pass';"

# # # Flush privileges to ensure all changes take effect
# mysql -u root -p$password -e "FLUSH PRIVILEGES;"

# kill $(cat /var/run/mysqld/mysqld.pid)

# # # Start MariaDB in safe mode
# mysqld_safe
