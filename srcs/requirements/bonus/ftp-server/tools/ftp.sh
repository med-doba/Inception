#!/bin/bash

# Create a user
username="med-doba"
password="@leet1337"

#
service vsftpd start

sleep 10

# useradd -m -p $(openssl passwd -crypt "$password") "$username"
adduser $username --disabled-password

echo "$username:$password" | /usr/sbin/chpasswd &> /dev/null

echo "$username" | tee -a /etc/vsftpd.userlist &> /dev/null

# Give the user rights to the www files
www_directory="/var/www/html"

chown -R "$username":"$username" "$www_directory"
chmod -R 755 "$www_directory"

echo "User '$username' has been created and granted access to the www files."

echo "med-doba" >> /etc/vsftpd.userlist

service vsftpd stop

sleep 10

vsftpd "/etc/vsftpd.conf"
