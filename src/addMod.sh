#!/usr/bin/bash

SERVER_NAME=$1
MOD_ADD=$2

if [ $SERVER_NAME == "" ]; then
    echo "Server's name not stated, falling back to default: servertest-mods"
    SERVER_NAME="servertest-mods"
fi

if [ $MOD_ADD == "" ]; then
    echo "No mod to add given, aborting."
    exit 1
fi

sed -i -e 's/ Example: WorkshopItems=514427485;513111049//g' ~/Zomboid/Server/$SERVER_NAME.ini

MODS_LISTED=$(cat ~/Zomboid/Server/$SERVER_NAME.ini | grep WorkshopItems=)
MODS_LISTED_NEW=$MODS_LISTED$MOD_ADD";"

sed -i -e 's/'$MODS_LISTED'/'$MODS_LISTED_NEW'/g' ~/Zomboid/Server/$SERVER_NAME.ini

exit