#!/bin/bash

url="${URL}"
title="${TITLE}"
admin_user="${ADMIN_USER}"
admin_pass="${ADMIN_PASSWORD}"
admin_email="${ADMIN_EMAIL}"

dir=/var/www/html
mkdir -p $dir

cd /var/www/html
rm -rf *

# Download WordPress
wp core download --allow-root

# Create the configuration file of wordpress
cp wp-config-sample.php wp-config.php
rm wp-config-sample.php

# Give the 4th environmental variables for wordpress
wp config set DB_NAME ${DB_NAME} --type=constant --allow-root
wp config set DB_USER ${DB_USER} --type=constant --allow-root
wp config set DB_PASSWORD ${DB_PASSWORD} --type=constant --allow-root
wp config set DB_HOST ${DB_HOST} --type=constant --allow-root

sleep 12
wp core install --url=$url --title=$title --admin_user=$admin_user --admin_password=$admin_pass --admin_email=$admin_email --allow-root
wp user create ${USER_2} ${USER_2_EMAIL} --role=${USER_2_ROLE} --allow-root
wp user update ${USER_2} --user_pass=${USER_2_PASS} --allow-root

# bonus redis
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_CLIENT predis --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# mailhog
wp plugin install wp-mail-smtp --activate --allow-root
wp option update smtp_host mailhog --allow-root
wp option update smtp_port 1025 --allow-root
wp option update smtp_ssl false --allow-root
wp option update smtp_auto_tls false --allow-root
wp option update smtp_auth false --allow-root

#start the php-fpm servere
php-fpm7.3 -F
