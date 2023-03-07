#!/usr/bin/bash

. /home/pzuser/etc/server.conf

SAVEGAME_NAME_CREATE=$1

if [ $SAVEGAME_NAME == "" ]; then
    echo "Savegame's name not stated, exiting script!"
    exit 1
fi

if [ $APP_DIR == "" ]; then
    echo "Application's folder not stated, exiting script!"
    exit 1
fi

cd $APP_DIR
bash start-server.sh -servername $SAVEGAME_NAME_CREATE


exit 0