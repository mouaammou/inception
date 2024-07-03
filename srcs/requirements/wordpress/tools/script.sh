#	!/bin/bash

sleep 10

mkdir /run/php/

wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install  \
	--url=$DOMAIN_NAME --title=INCEPTION \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root --path='/var/www/wordpress'

wp user create  \
	$WP_USER $WP_USER_EMAIL --role=author \
	--user_pass=$WP_USER_PASSWORD --allow-root --path='/var/www/wordpress'

/usr/sbin/php-fpm -F