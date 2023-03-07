#!/usr/bin/bash

. /etc/pzomboidService/service.conf

if [ ${USER_HOME_DIR: -1} == "/" ]; then
    USER_HOME_DIR=${USER_HOME_DIR::-1} 
fi

echo 'saving and then quitting game server'

cd $USER_HOME_DIR
echo save >> /pzuser/pzomboid.control
sleep 10s
echo quit >> /pzuser/pzomboid.control

exit 0