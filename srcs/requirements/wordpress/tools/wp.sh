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

    wp plugin install wp-mail-smtp --activate --allow-root
    # wp option set wp_mail_smtp_mail_from mohaeddo03@gmail.com --allow-root
    # wp option set wp_mail_smtp_mail_from_name "med-doba" --allow-root
    # wp option set wp_mail_smtp_mailer smtp --allow-root
    # # wp option set wp_mail_smtp_host smtp.example.com
    # # wp option set wp_mail_smtp_port 587
    # wp option set wp_mail_smtp_encryption none --allow-root
    # wp option set wp_mail_smtp_authentication no --allow-root
    # # wp option set wp_mail_smtp_username your-smtp-username
    # # wp option set wp_mail_smtp_password your-smtp-password


    # Set WP Mail SMTP options
    wp option set wp_mail_smtp_mail_from mohaeddo03@gmail.com --allow-root
    wp option set wp_mail_smtp_mail_from_name "med-doba" --allow-root
    wp option set wp_mail_smtp_mailer other --allow-root
    wp option set wp_mail_smtp_host your-smtp-host --allow-root
    wp option set wp_mail_smtp_port your-smtp-port --allow-root
    wp option set wp_mail_smtp_encryption your-smtp-encryption --allow-root
    wp option set wp_mail_smtp_authentication no --allow-root
    # wp option set wp_mail_smtp_username your-smtp-username --allow-root
    # wp option set wp_mail_smtp_password your-smtp-password --allow-root

    # mailhog
    wp config set WPMS_ON true --allow-root
    wp config set WPMS_MAILER smtp --allow-root
    wp config set WPMS_SMTP_HOST mailhog --allow-root
    wp config set WPMS_SMTP_PORT 1025 --allow-root
    wp config set WPMS_SSL false --allow-root



    # mailhog
    # wp config set WPMS_ON true --allow-root
    # wp config set WPMS_MAILER smtp --allow-root
    # wp config set WPMS_SMTP_HOST mailhog --allow-root
    # wp config set WPMS_SMTP_PORT 1025 --allow-root
    # wp config set WPMS_SSL false --allow-root


# fi

#start the php-fpm servere
php-fpm7.3 -F