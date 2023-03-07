#!/usr/bin/bash

. /home/pzuser/etc/server.conf

MOD_DELETE=$1

if [ $SAVEGAME_NAME == "" ]; then
    echo "Server's name not stated, falling back to default: servertest-mods"
    SAVEGAME_NAME="servertest-mods"
fi

if [ $MOD_DELETE == "" ]; then
    echo "No mod to delete given, aborting."
    exit 1
fi

MOD_DELETE=$MOD_DELETE";"

sed -i -e 's/'$MOD_DELETE'//g' ~/Zomboid/Server/$SAVEGAME_NAME.ini

exit 0