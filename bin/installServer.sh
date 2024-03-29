#!/bin/bash

APP_DIR_INSTALL=$1

if [ $APP_DIR_INSTALL == "" ]; then
    echo "No application directory stated, falling back to default: /opt/pzserver"
    echo "Saves will be located at ~/Zomboid/"
    APP_DIR_INSTALL="/opt/pzserver/"
fi

echo $'\ninstalling server at: '$APP_DIR_INSTALL$'\n'


cd ~
/usr/games/steamcmd +force_install_dir $APP_DIR_INSTALL +login anonymous +app_update 380870 validate +quit

exit 0