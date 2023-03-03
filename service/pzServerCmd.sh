#!/usr/bin/bash
PZUSER=$1
CMD=$2

if [ $USER == "" ]; then
    echo "No user directory stated, falling back to default: pzuser"
    USER="pzuser"
fi

if [ $CMD == "" ]; then
    echo "No command for the server given, aborting."
    exit 1
fi

sudo -u $PZUSER bash -c 'cd ~; echo '$CMD' >> pzomboid.control'

exit 0