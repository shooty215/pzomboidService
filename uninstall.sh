#!/usr/bin/bash

# delete binary and service files, not touching the actual pzomboid server files
# service's binaries should be used to back up savegames and delete them AND the server files
sudo rm -rf /home/pzuser/src/
sudo rm -f /opt/pzserver/pzserver-start
sudo rm -f /opt/pzserver/pzserver-stop
sudo rm -f /usr/local/bin/pzserver-cmd
sudo rm -f /etc/systemd/system/pzomboid.service
sudo rm -f /etc/systemd/system/pzomboid.socket