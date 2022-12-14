#!/usr/bin/bash

PZUSER=grep -o '"PZUSER": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'
PATH=grep -o '"PATH": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'

echo 'creating service file from properties json...'
sudo bash createServiceFile.sh $PZUSER $PATH

echo 'deploying all service relevant files...'
echo 'copying servers executable to /usr/local/bin/'
cp -f pzserver.sh /usr/local/bin/pzserver
echo 'copying service file to /etc/systemd/system/'
cp -f pzomboid.service /etc/systemd/system/
echo 'copying socket file to /etc/systemd/system/'
cp -f pzomboid.socket /etc/systemd/system/
echo 'creating full unit file instead of snippet'
sudo systemctl edit pzomboid.service --force --full
echo 'copying service config file to /etc/systemd/system/pzomboid.service.d/'
cp -f pzServiceConfig.json /etc/systemd/system/pzomboid.service.d/


echo 'done. Setting permissions...'
chmod 664 /etc/systemd/system/pzomboid.service
chmod 664 /etc/systemd/system/pzomboid.socket

echo 'done. reloading systemctl daemon...'
sudo systemctl daemon-reload
echo 'done. make sure to check the config file:'
echo '/etc/systemd/system/pzomboid.service.d/'
echo 'and take a look at the README.md in the repository BEFORE running the service!'