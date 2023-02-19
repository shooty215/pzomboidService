#!/usr/bin/bash

echo 'removing all service relevant files from the system...'
sudo deluser pzuser

rm -rf /home/pzuser/interface
rm -rf /home/pzuser/pzServiceConfig.json
rm -f /usr/local/bin/pzserver
rm -f /etc/systemd/system/pzomboid.service
rm -f /etc/systemd/system/pzomboid.socket
rm -rf /etc/systemd/system/pzomboid.service.d
echo 'done.'