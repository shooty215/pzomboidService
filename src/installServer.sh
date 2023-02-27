#!/usr/bin/bash
APP_DIR=$1

if [ $APP_DIR == "" ]; then
    echo "No application directory stated, falling back to default: /opt/pzserver/"
    echo "Saves will be located at ~/Zomboid/"
    APP_DIR="/opt/pzserver/"
fi

echo "installing server in given directory"

cd ~
steamcmd
force_install_dir $APP_DIR
login anonymous +app_update 380870 +validate +quit
exit 1