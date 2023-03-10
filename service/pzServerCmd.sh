#!/usr/bin/bash

. /etc/pzomboidservice/service.conf

CMD=$1

if [ $USER_NAME == "" ]; then
    echo "No user directory stated, falling back to default: pzuser"
    USER="pzuser"
fi

if [ $CMD == "" ]; then
    echo "No command for the server given, aborting."
    exit 1
fi

echo $'\nexecuting command in server shell: '$CMD$'\n'

sudo -u $USER_NAME bash -c 'cd ~; echo '$CMD' >> pzomboid.control'

exit 0