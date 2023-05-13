#!/bin/bash

# # Initialize the MySQL data directory
# mysql_install_db --datadir=/var/lib/mysql

# Start the MariaDB server
# mysqld --user=mysql --console &
service mysql start

# Wait for the server to start
while ! mysqladmin ping -hlocalhost --silent; do
	sleep 1
done

# sed -i 's/^skip-networking/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

# mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('mysecretpassword')"

# Create the database
# mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE DATABASE ${DB_NAME};"

# create a new user with the username and password.
# mysql -e "CREATE USER 'med'@'%' IDENTIFIED BY 'password';"
mysql -e "SELECT User FROM mysql.user WHERE User='${DB_USER}';"
mysql -e "DROP USER IF EXISTS '${DB_USER}'@'%';"
mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"


# Grant all privileges to the user
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"

# To apply the changes, flush the privileges.
mysql -e "FLUSH PRIVILEGES;"

# sleep 1000000
sleep 5

# # service mysql start

# service mysql stop
kill $(cat /var/run/mysqld/mysqld.pid)

# service mysql status

mysqld
# exec $@
