#!/bin/bash

# Stop the MariaDB server
service mysql stop

# Initialize the MySQL data directory
mysql_install_db --user=mysql --datadir=/var/lib/mysql
CREATE USER 'root'@localhost IDENTIFIED BY 'mypassword';
GRANT USAGE ON *.* TO 'root'@localhost IDENTIFIED BY 'mypassword';

# Start the MariaDB server
service mysql start
