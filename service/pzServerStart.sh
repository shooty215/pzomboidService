#!/usr/bin/bash

. /etc/pzomboidservice/service.conf

echo "starting game server in given directory"

cd $APP_DIR
/bin/bash start-server.sh -servername $SAVEGAME_NAME


exit 0