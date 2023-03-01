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

if [ ${USER_DIR: -1} == "/" ]; then
    USER_DIR=${USER_DIR::-1} 
fi

echo ""
echo 'Adding repository and performimg repository update.'
echo ""

# all needed packages for bullseye or higher: sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 default-jre rng-tools
# all needed packages for buster or lower: sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 default-jre rng-tools

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

echo ""
echo "Setting permissions."
echo ""

sudo chown -R pzuser:pzuser $USER_DIR/src
sudo chown pzuser:pzuser /opt/pzserver


exit 1