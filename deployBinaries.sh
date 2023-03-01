#!/usr/bin/bash

USER_DIR=$1

read -p "Make sure you have created the user pzuser before running this! validate with 'yes' or 'no' : " VAL_CONFIG

if [[ $VAL_CONFIG == "n" || $VAL_CONFIG == "N" || $VAL_CONFIG == "no" || $VAL_CONFIG == "No" || $VAL_CONFIG == "NO" ]]; then
    echo "Add user and re-run script."
    exit 1
elif [[ $VAL_CONFIG == "y" || $VAL_CONFIG == "Y" || $VAL_CONFIG == "yes" || $VAL_CONFIG == "Yes" || $VAL_CONFIG == "YES" ]]; then
    echo "Running deployment."
else
    echo "y or n! re-run script."
    exit 1
fi

if [ $USER_DIR == "" ]; then
    echo "No user directory stated, falling back to default: /home/pzuser/"
    USER_DIR="/home/pzuser/"
fi

if [ ${USER_DIR: -1} == "/" ]; then
    USER_DIR=${USER_DIR::-1} 
fi

echo ""
echo "Copying binaries to user's home folder."
echo ""

sudo cp -rf src/ $USER_DIR

echo ""
echo "Setting permissions."
echo ""

sudo chown -R pzuser:pzuser $USER_DIR/src
sudo chown pzuser:pzuser /opt/pzserver


exit 1