#!/usr/bin/bash

SERVER_NAME=$1
MOD_DELETE=$2

if [ $SERVER_NAME == "" ]; then
    echo "Server's name not stated, falling back to default: servertest-mods"
    SERVER_NAME="servertest-mods"
fi

if [ $MOD_DELETE == "" ]; then
    echo "No mod to delete given, aborting."
    exit 1
fi

MOD_DELETE=$MOD_DELETE";"

sed -i -e 's/'$MOD_DELETE'//g' ~/Zomboid/Server/$SERVER_NAME.ini

exit 0