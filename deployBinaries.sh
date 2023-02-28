#!/usr/bin/bash

USER_DIR=$1

read -p "Make sure you have created the user pzuser before running this! validate with 'yes' or 'no' : " VAL_CONFIG

if [ $VAL_CONFIG == "n" ]; then
    echo "Add user and re-run script."
    exit 1
elif [ $VAL_CONFIG == "y" ]; then
    echo "Running deployment."
else
    echo "y or n! re-run script."
    exit 1
fi

if [ $USER_DIR == "" ]; then
    echo "No user directory stated, falling back to default: /home/pzuser/"
    USER_DIR="/home/pzuser/"
fi

echo ""
echo 'Adding repository and performimg repository update.'
echo ""

sudo dpkg --add-architecture i386
sudo apt-get update

echo ""
echo 'Installing needed packages.'
echo "steamcmd, jq, zip"
echo ""

sudo apt install steamcmd -y
sudo apt install jq -y
sudo apt install zip -y

echo ""
echo "Copying binaries to user's home folder."
echo ""

sudo cp -rf src/ $USER_DIR

echo ""
echo "Creating default application folder and setting its' ownership."
echo ""

sudo mkdir /opt/pzserver
sudo chown -R pzuser:pzuser /home/pzuser/src
sudo chown pzuser:pzuser /opt/pzserver


exit 1