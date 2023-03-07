#!/usr/bin/bash

echo ''
echo 'removing all service relevant files from the system...'
echo ''

sudo rm -rf /etc/pzomboidservice
sudo rm -f /usr/local/bin/pzserver-start
sudo rm -f /usr/local/bin/pzserver-stop
sudo rm -f /usr/local/bin/pzserver-cmd
sudo rm -f /etc/systemd/system/pzomboid.service
sudo rm -f /etc/systemd/system/pzomboid.socket

echo ''
echo "Don't forget to delete your created user pzuser"
echo 'done.'
echo ''
