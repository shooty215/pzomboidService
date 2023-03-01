#!/usr/bin/bash

APP_DIR=$1

if [ $APP_DIR == "" ]; then
    echo "No application directory stated, falling back to default: /opt/pzserver/"
    APP_DIR="/opt/pzserver/"
fi

echo "deleting server in given directory"
echo ""
echo ""
echo "TYPE QUIT TO EXIT STEAMCMD"
echo ""
echo ""

cd ~
steamcmd +force_install_dir $APP_DIR +login anonymous +app_uninstall 380870

exit 1