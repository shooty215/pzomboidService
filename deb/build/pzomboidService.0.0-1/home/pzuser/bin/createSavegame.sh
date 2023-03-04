#!/usr/bin/bash

NAME_SAVEGAME=$1
APP_DIR=$2

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 1
fi

if [ $APP_DIR == "" ]; then
    echo "Application's folder not stated, exiting script!"
    exit 1
fi

cd $APP_DIR
bash start-server.sh -servername $NAME_SAVEGAME


exit 0