#!/bin/bash
sleep 10

mkdir /run/php/

mv wp-config-sample.php wp-config.php && wp config set SERVER_PORT 3306 --allow-root

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

# wp core install --url=example.com --title=Example --admin_user=admin --admin_password=admin_password --admin_email=admin@example.com --dbhost=mariadb:3306 --dbuser=root --dbpass=root_password --dbname=wordpress --path='/var/www/wordpress'


wp user create  \
	$WP_USER $WP_USER_EMAIL --role=author \
	--user_pass=$WP_USER_PASSWORD --allow-root --path='/var/www/wordpress'

sed -e 's#;clear_env = no#clear_env = no#' /etc/php/8.2/fpm/pool.d/www.conf
sed -e 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf

/usr/sbin/php-fpm8.2 -F