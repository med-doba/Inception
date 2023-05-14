#!/bin/bash

# Download WordPress and move it to the HTML directory
cd /var/www/html
wp core download --allow-root
#Create the configuration file of wordpress
cp wp-config-sample.php wp-config.php
# wp config create --allow-root

#Give the 4th environmental variables for wordpress
sed -i "s/database_name_here/${DB_NAME}/g" /var/www/html/wp-config.php
sed -i "s/username_here/${DB_USER}/g" /var/www/html/wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/g" /var/www/html/wp-config.php
sed -i "s/localhost/${DB_HOST}/g" /var/www/html/wp-config.php
# wp core config --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --allow-root
wp core install --url=localhost --title=42inception --admin_user=med-doba --admin_password=@med-doba --admin_email=mohaeddo03@gmail.com --allow-root
wp user create bondagani mohaeddo18@gmail.com --role=subscriber --allow-root
# wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root

#start the php-fpm servere
php-fpm7.3 -F











# `This script assumes that you have defined the four required environment variables ($WORDPRESS_DB_NAME, $WORDPRESS_DB_USER, $WORDPRESS_DB_PASSWORD, and $WORDPRESS_DB_HOST) before running the script.

# The script first downloads the latest version of WordPress from the official website and extracts it. It then creates a wp-config.php file by copying the sample configuration file, and moves all WordPress files to the HTML directory (/var/www/html/ in this example) using rsync.

# Finally, the script uses sed to replace the placeholders in the wp-config.php file with the actual values of the environment variables. This ensures that WordPress is configured to use the correct database credentials and hostname.

# Note that this script assumes that you have appropriate permissions to modify files in the HTML directory and use sudo. You may need to modify the script to match the exact path of the HTML directory on your system.`

# `This line:

# bash

# cp wordpress/wp-config-sample.php wordpress/wp-config.php

# is used to create a new wp-config.php configuration file for WordPress based on the wp-config-sample.php file that is included in the WordPress download package.

# The wp-config-sample.php file contains a basic set of configuration settings for connecting to the WordPress database, but it does not include the actual database credentials or other settings specific to your WordPress installation.

# By copying the wp-config-sample.php file to wp-config.php, you can create a new configuration file with the correct filename and basic structure. You can then edit the wp-config.php file to include the actual database credentials and other configuration settings specific to your WordPress installatio`


# "User
# is this come before or after set the env for wp
# ChatGPT

# In the script you mentioned earlier, the line:

# bash

# cp wordpress/wp-config-sample.php wordpress/wp-config.php

# is executed before setting the environmental variables for WordPress, which are:

# arduino

# export DB_NAME=my_database_name
# export DB_USER=my_database_user
# export DB_PASSWORD=my_database_password
# export DB_HOST=my_database_host

# This is because the wp-config.php file needs to be created first before it can be edited with the correct database credentials and other configuration settings.

# After setting the environmental variables, you can then edit the wp-config.php file to include the actual values for those variables."