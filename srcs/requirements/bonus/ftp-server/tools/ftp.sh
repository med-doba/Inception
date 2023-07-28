#!/bin/bash

username="$ftp_user"
password="$ftp_pass"

service vsftpd start
sleep 10

adduser --disabled-password --gecos "" "$username"
echo "$username:$password" | /usr/sbin/chpasswd &> /dev/null
echo "$username" | tee -a /etc/vsftpd.userlist &> /dev/null

www_directory="/var/www/html"
chown -R "$username":"$username" "$www_directory"
chmod -R 755 "$www_directory"

echo "User '$username' has been created and granted access to the www files."

service vsftpd stop
sleep 10

vsftpd "/etc/vsftpd.conf"
