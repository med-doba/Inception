#!/bin/bash

# Start the MariaDB server
service mysql start

# Wait for the server to start
while ! mysqladmin ping -hlocalhost --silent; do
	sleep 1
done

# Create the database
mysql -e "CREATE DATABASE ${DB_NAME};"

# create a new user with the username and password.
mysql -e "SELECT User FROM mysql.user WHERE User='${DB_USER}';"
mysql -e "DROP USER IF EXISTS '${DB_USER}'@'%';"
mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant all privileges to the user
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"

# To apply the changes, flush the privileges.
mysql -e "FLUSH PRIVILEGES;"

# sleep
sleep 5

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
