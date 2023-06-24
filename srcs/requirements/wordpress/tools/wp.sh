#!/bin/bash

dir=/var/www/html
mkdir -p $dir

cd /var/www/html
rm -rf *

# if [ -d "$dir" ]; then
    # Download WordPress and move it to the HTML directory
    wp core download --allow-root

    # #Create the configuration file of wordpress
    cp wp-config-sample.php wp-config.php

    # #Give the 4th environmental variables for wordpress
    wp config set DB_NAME ${DB_NAME} --type=constant --allow-root
    wp config set DB_USER ${DB_USER} --type=constant --allow-root
    wp config set DB_PASSWORD ${DB_PASSWORD} --type=constant --allow-root
    wp config set DB_HOST ${DB_HOST} --type=constant --allow-root

    wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root
    wp user create ${USER_2} ${USER_2_EMAIL} --role=$USER_2_ROLE --allow-root

    # bonus redis
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    # wp config set WP_REDIS_PASSWORD @med-redis --allow-root
    wp config set WP_REDIS_CLIENT predis --allow-root

    wp plugin install redis-cache --activate --allow-root
    # wp plugin i redis-cache --activate --allow-root
    wp redis enable --allow-root

# fi

#start the php-fpm servere
php-fpm7.3 -F