#!/usr/bin/bash

cp -f pzserver.sh /usr/local/bin/pzserver
cp -f pzomboid.service /etc/systemd/system/
cp -f pzomboid.socket /etc/systemd/system/

mkdir /etc/systemd/system/pzomboid.service.d
cp -f override.conf /etc/systemd/system/pzomboid.service.d/

chmod 664 /etc/systemd/system/pzomboid.service
systemctl daemon-reload
