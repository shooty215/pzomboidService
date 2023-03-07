#!/bin/bash

APP_DIR_DELETE=$1

if [ $APP_DIR_DELETE == "" ]; then
    echo "No application directory stated, exiting script!"
fi

echo "deleting server in given directory"
echo ""
echo ""
echo "TYPE QUIT TO EXIT STEAMCMD"
echo ""
echo ""

cd ~
/user/games/steamcmd +force_install_dir $APP_DIR_DELETE +login anonymous +app_uninstall 380870

exit 0