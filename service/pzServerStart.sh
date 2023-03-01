#!/usr/bin/bash
APP_DIR=$1
SERVER_NAME=$2

if [ $APP_DIR == "" ]; then
    echo "No application directory stated, falling back to default: /opt/pzserver/"
    APP_DIR="/opt/pzserver"
fi

if [ $SERVER_NAME == "" ]; then
    echo "Server's name not stated, falling back to default: servertest-mods"
    SERVER_NAME="servertest-mods"
fi

if [ ${APP_DIR: -1} == "/" ]; then
    APP_DIR=${APP_DIR::-1} 
fi


echo "starting server in given directory"

cd $APP_DIR
/bin/bash start-server.sh -servername $SERVER_NAME
exit 1
