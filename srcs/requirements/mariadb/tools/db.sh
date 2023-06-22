#!/bin/bash

DB_NAME_=$DB_NAME
DB_USER_=$DB_USER
DB_PASSWORD_=$DB_PASSWORD
DB_HOST_=$DB_HOST

service mysql start

while ! mysqladmin ping -hlocalhost --silent; do
	sleep 1
done

if ! mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "SELECT 1;" 2>/dev/null; then
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
fi

if ! mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "USE $DB_NAME_;" 2>/dev/null; then
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE $DB_NAME_;"
fi

mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "SELECT User FROM mysql.user WHERE User='$DB_USER_';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DROP USER IF EXISTS '$DB_USER_'@'%';"

mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '$DB_USER_'@'%' IDENTIFIED BY '$DB_PASSWORD_';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON $DB_NAME_.* TO '$DB_USER_'@'%' WITH GRANT OPTION;"

mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

sleep 5

kill $(cat /var/run/mysqld/mysqld.pid)

sleep 5

mysqld
