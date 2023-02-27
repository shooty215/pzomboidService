#!/usr/bin/bash
APP_DIR=$1

if [ $APP_DIR == "" ]; then
    echo "No application directory stated, falling back to default: /opt/pzserver/"
    $APP_DIR="/opt/pzserver/"
fi

echo "updating server in given directory"

cd ~
steamcmd
force_install_dir $APP_DIR
steamcmd +login anonymous +app_update 380870 +validate +quit
exit 1