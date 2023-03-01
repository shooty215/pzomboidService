#!/usr/bin/bash

NAME_SAVEGAME=$1

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 0
fi

bash /opt/pzserver/pzserver-start /opt/pzserver $NAME_SAVEGAME

exit 1