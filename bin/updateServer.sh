#!/bin/bash

. /home/pzuser/etc/server.conf

if [ $APP_DIR == "" ]; then
    echo "No application directory stated, falling back to default: /opt/pzserver/"
    $APP_DIR="/opt/pzserver/"
fi

echo $'\nupdating server in: '$APP_DIR$'\n'

cd ~
steamcmd +force_install_dir $APP_DIR +login anonymous +app_update 380870 validate +quit

exit 0