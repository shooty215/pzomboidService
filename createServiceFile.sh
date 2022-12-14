#!/usr/bin/bash
PZUSER=$1
PATH=$2

SERVICE_FILE_SCRIPT="
[Unit]
Description=Handles Project Zomboid Server Application
Wants=syslog.target network.target network-online.target

[Service]
Type=simple
User=$PZUSER
Group=$PZUSER
WorkingDirectory=$PATH
ExecStart=/usr/local/bin/pzserver
Sockets=pzomboid.socket
StandardInput=socket
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
"

echo $SERVICE_FILE_SCRIPT > pzomboid.service

if [ $SERVICE_FILE_SCRIPT == echo pzomboid.service ]; then
    echo "service file was created successfully."
else
    echo "service file creation unsuccessfull."
fi