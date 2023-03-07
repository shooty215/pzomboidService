#!/usr/bin/bash

. /etc/pzomboidService/service.conf

CMD=$1

if [ $USER_NAME == "" ]; then
    echo "No user directory stated, falling back to default: pzuser"
    USER="pzuser"
fi

if [ $CMD == "" ]; then
    echo "No command for the server given, aborting."
    exit 1
fi

sudo -u $PZUSER bash -c 'cd ~; echo '$CMD' >> pzomboid.control'

exit 0