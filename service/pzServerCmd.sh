#!/usr/bin/bash
USER=$1
CMD=$2

if [ $USER_DIR == "" ]; then
    echo "No user directory stated, falling back to default: pzuser"
    USER_DIR="pzuser"
fi

if [ $CMD == "" ]; then
    echo "No command for the server given, aborting."
    exit 1
fi

sudo su $USER
cd /home/$USER
echo $CMD >> pzomboid.control

exit 1