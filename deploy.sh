#!/usr/bin/bash

echo 'deploying all service relevant files...'
echo 'copying servers executable'
cp -f pzserver.sh /usr/local/bin/pzserver
echo 'copying service file'
cp -f pzomboid.service /etc/systemd/system/
echo 'copying socket file'
cp -f pzomboid.socket /etc/systemd/system/
echo "creating folder for and copying service's config file"
mkdir /etc/systemd/system/pzomboid.service.d
cp -f override /etc/systemd/system/pzomboid.service.d/

echo 'done. Setting permissions...'
chmod 664 /etc/systemd/system/pzomboid.service
chmod 664 /etc/systemd/system/pzomboid.socket

echo 'done. reloading systemctl daemon...'
systemctl daemon-reload
echo 'done. make sure to check the config file:'
echo '/etc/systemd/system/pzomboid.service.d'
echo 'and take a look at the README.md in the repository BEFORE running the service!'