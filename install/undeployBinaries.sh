#!/usr/bin/bash
USER_DIR=$1

if [ $USER_DIR == "" ]; then
    echo "No user directory stated, falling back to default: /home/pzuser/"
    USER_DIR="/home/pzuser"
fi

echo ""
echo "Deleting binaries from user's home folder."
echo ""

cd $USER_DIR
sudo rm -rf $USER_DIR/bin/
sudo rm -rf $USER_DIR/etc/
