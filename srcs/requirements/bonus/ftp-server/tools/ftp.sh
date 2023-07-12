#!/bin/bash

# Create a user
username="med-doba"
password="@leet1337"

#
service vsftpd start

sleep 10

useradd -m -p $(openssl passwd -crypt "$password") "$username"

# Give the user rights to the www files
www_directory="/var/www/html"

chown -R "$username":"$username" "$www_directory"
chmod -R 755 "$www_directory"

echo "User '$username' has been created and granted access to the www files."

service vsftpd stop

sleep 10

vsftpd "/etc/vsftpd.conf"
