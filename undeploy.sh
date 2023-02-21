#!/usr/bin/bash

echo 'removing all service relevant files from the system...'

rm -rf /home/pzuser/pzomboid.control
rm -f /usr/local/bin/pzserver
rm -f /etc/systemd/system/pzomboid.service
rm -f /etc/systemd/system/pzomboid.socket

echo "Don't forget to delete your created user pzuser"
echo 'done.'