#!/usr/bin/bash
USER_NAME='pzuser'
USER_GROUP='pzuser'
USER_HOME_DIR='/home/pzuser'
APP_DIR='/opt/pzserver'

PATH_INSTALL_SERVER='/home/pzuser/src/installServer.sh /opt/pzserver'

# create user, group
sudo adduser --system --group --disabled-password --home $USER_HOME_DIR --quiet $USER_NAME

# install all required packages
sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip zip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 default-jre rng-tools

# install steamcmd
sudo apt install steamcmd -y

# create app directory
sudo mkdir $APP_DIR

# copy repositories binaries to target folder
sudo cp -rf src/ $USER_DIR

# set permissions for pzusers files and application directory
sudo chown -R $USER_NAME:$USER_GROUP $USER_DIR/src
sudo chown -R $USER_NAME:$USER_GROUP $APP_DIR

# copy service relevant files
sudo cp -f service/pzServerStart.sh $APP_DIR/pzserver-start
sudo cp -f service/pzServerStop.sh $APP_DIR/pzserver-stop
sudo cp -f service/pzomboid.service /etc/systemd/system/
sudo cp -f service/pzomboid.socket /etc/systemd/system/

# create full unit file instead of snippet
sudo systemctl edit pzomboid.service --force --full

# copy command binearies
sudo cp -f service/pzServerCmd.sh /usr/local/bin/pzserver-cmd

# set permissions for service files
sudo chmod 664 /etc/systemd/system/pzomboid.service
sudo chmod 664 /etc/systemd/system/pzomboid.socket

sudo chown -R $USER_NAME:$USER_GROUP $APP_DIR/pzServerStart.sh
sudo chown -R $USER_NAME:$USER_GROUP $APP_DIR/pzServerStop.sh

# reload systemctl daemon
sudo systemctl daemon-reload

# install pzomboid server to the application's directory
sudo -u $PZUSER bash -c $PATH_INSTALL_SERVER

exit 0