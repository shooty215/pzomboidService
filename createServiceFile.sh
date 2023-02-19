#!/usr/bin/bash
PZUSER=$1
PATH=$2
NAME=$3

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

EOL
"

echo $SERVICE_FILE_SCRIPT > pzomboid.service

if [ $SERVICE_FILE_SCRIPT == echo pzomboid.service ]; then
    echo "service file was created successfully."
else
    echo "service file creation unsuccessfull."
fi

SOCKET_FILE_SCRIPT="
[Unit]
BindsTo=pzomboid.service

[Socket]
ListenFIFO=/home/$PZUSER/pzomboid.control
FileDescriptorName=control
RemoveOnStop=true
SocketMode=0660
SocketUser=$PZUSER

EOL
"

echo $SOCKET_FILE_SCRIPT > pzomboid.socket

if [ $SOCKET_FILE_SCRIPT == echo pzomboid.socket ]; then
    echo "socket file was created successfully."
else
    echo "socket file creation unsuccessfull."
fi

CONFIG_FILE_SCRIPT='
{
    "FLAG": 1,
    "PZUSER": "${PZUSER}",
    "PATH": "/home/$PZUSER/",
    "NAME": "servertest-mods",
    "RAM_MIN": 1024,
    "RAM_MAX": 2816,
    "UDP": 16261,
    "UDP_Direct": 16262
}

EOL
'

echo $CONFIG_FILE_SCRIPT > pzServiceConfig.json

if [ $CONFIG_FILE_SCRIPT == echo pzServiceConfig.json ]; then
    echo "config file was created successfully."
else
    echo "config file creation unsuccessfull."
fi
