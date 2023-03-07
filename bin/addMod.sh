#!/bin/bash

. /home/pzuser/etc/server.conf

MOD_ADD=$1

if [ $SAVEGAME_NAME == "" ]; then
    echo "Server's name not stated, falling back to default: servertest-mods"
    SAVEGAME_NAME="servertest-mods"
fi

if [ $MOD_ADD == "" ]; then
    echo "No mod to add given, aborting."
    exit 1
fi

sed -i -e 's/ Example: WorkshopItems=514427485;513111049//g' ~/Zomboid/Server/$SAVEGAME_NAME.ini

MODS_LISTED=$(cat ~/Zomboid/Server/$SAVEGAME_NAME.ini | grep WorkshopItems=)
MODS_LISTED_NEW=$MODS_LISTED$MOD_ADD";"

sed -i -e 's/'$MODS_LISTED'/'$MODS_LISTED_NEW'/g' ~/Zomboid/Server/$SAVEGAME_NAME.ini

exit 0