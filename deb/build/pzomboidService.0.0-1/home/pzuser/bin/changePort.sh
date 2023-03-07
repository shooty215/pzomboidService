#!/usr/bin/bash

. /home/pzuser/etc/server.conf

PORT_DEFAULT=$1
PORT_UDP=$2

#DefaultPort=16261
#UDPPort=16262

if [ $PORT_DEFAULT == "" ]; then
    echo "Default port not stated, falling back to default: 16261"
    PORT_DEFAULT=16261
fi

if [ $PORT_UDP == "" ]; then
    echo "Server's name not stated, falling back to default: 16262"
    PORT_UDP=16262
fi

PORT_DEFAULT_LISTED=$(cat ~/Zomboid/Server/$SAVEGAME_NAME.ini | grep DefaultPort=)
PORT_DEFAULT_LISTED_NEW="DefaultPort="$PORT_DEFAULT

PORT_UDP_LISTED=$(cat ~/Zomboid/Server/$SAVEGAME_NAME.ini | grep UDPPort=)
PORT_UDP_LISTED_NEW="UDPPort="$PORT_UDP

sed -i -e 's/'$PORT_DEFAULT_LISTED'/'$PORT_DEFAULT_LISTED_NEW'/g' ~/Zomboid/Server/$SAVEGAME_NAME.ini

sed -i -e 's/'$PORT_UDP_LISTED'/'$PORT_UDP_LISTED_NEW'/g' ~/Zomboid/Server/$SAVEGAME_NAME.ini

exit 0