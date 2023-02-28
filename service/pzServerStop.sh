#!/usr/bin/bash
USER_DIR=$1
CMD_QUIT='quit'

if [ $USER_DIR == "" ]; then
    echo "No user directory stated, falling back to default: /home/pzuser"
    USER_DIR="/home/pzuser"
fi

if [ ${USER_DIR: -1} == "/" ]; then
    USER_DIR=${USER_DIR::-1} 
fi

cd $USER_DIR
echo $CMD_QUIT >> /pzuser/pzomboid.control