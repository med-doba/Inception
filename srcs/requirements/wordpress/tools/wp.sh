#!/bin/bash

dir=/var/www/html
mkdir -p $dir

cd /var/www/html
rm -rf *

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

    # mailhog
    wp plugin install wp-mail-smtp --activate --allow-root
    #
    # wp option update smtp_transport smtp --allow-root

    #     wp option update smtp_host mailhog --allow-root
    #     wp option update smtp_port 1025 --allow-root
    # wp option update smtp_host <mailhog_ip_address> --allow-root
    wp option update smtp_host mailhog --allow-root
    wp option update smtp_port 1025 --allow-root
    wp option update smtp_ssl false --allow-root
    wp option update smtp_auto_tls false --allow-root
    wp option update smtp_auth false --allow-root


    #

    # # wp option update smtp_host "$mailhog_ip" --allow-root
    # wp option update smtp_port 1025 --allow-root
    # # wp option update smtp_ssl ssl --allow-root
    # #
    # wp option update wp_mail_smtp lite_from_email 'mohaeddo03@gmail.com' --allow-root
    # wp option update wp_mail_smtp lite_from_name '42inception' --allow-root
    # # wp option update wp_mail_smtp lite_return_path true --allow-root
    # wp option update wp_mail_smtp lite_mailer 'smtp' --allow-root
    # # wp option update wp_mail_smtp lite_smtp_host 'mailhog' --allow-root
    # # wp option update wp_mail_smtp lite_encryption 'tls' --allow-root
    # wp option update wp_mail_smtp lite_smtp_port '1025' --allow-root
    # wp option update wp_mail_smtp lite_authentication 'false' --allow-root
    # # wp option update wp_mail_smtp lite_backup_connection 'none' --allow-root

#start the php-fpm servere
php-fpm7.3 -F