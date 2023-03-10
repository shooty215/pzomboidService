#!/usr/bin/bash
USER_NAME='pzuser'
USER_GROUP='pzuser'
USER_HOME_DIR='/home/pzuser'
APP_DIR='/opt/pzserver'
CONF_SERVICE_DIR='/etc/pzomboidservice'
CONF_SERVER_DIR='/home/pzuser/etc'
PATH_INSTALL_SERVER='/home/pzuser/bin/installServer.sh /opt/pzserver'

ZOMBOID_DIR='/home/pzuser/Zomboid'
ZOMBOID_SERVER_DIR='/home/pzuser/Zomboid/Server'
ZOMBOID_SAVES_DIR='/home/pzuser/Zomboid/Saves'
ZOMBOID_MULTIPLAYER_DIR='/home/pzuser/Zomboid/Saves/Multiplayer'
ZOMBOID_DB_DIR='/home/pzuser/Zomboid/db'

# create user, group
sudo adduser --system --group --disabled-password --shell /bin/bash --home $USER_HOME_DIR --quiet $USER_NAME

# install all required packages
sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip zip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 default-jre rng-tools

# install steamcmd
sudo apt install steamcmd -y

# create app and config directory
sudo mkdir $APP_DIR
sudo mkdir $CONF_SERVICE_DIR
sudo mkdir $CONF_SERVER_DIR
sudo mkdir $ZOMBOID_DIR
sudo mkdir $ZOMBOID_SERVER_DIR
sudo mkdir $ZOMBOID_SAVES_DIR
sudo mkdir $ZOMBOID_MULTIPLAYER_DIR
sudo mkdir $ZOMBOID_DB_DIR

# copy repositories binaries to target folder
sudo cp -r bin/ $USER_HOME_DIR
sudo cp -rf ../conf/service.conf $CONF_SERVICE_DIR
sudo cp -rf ../conf/server.conf $CONF_SERVER_DIR

# set permissions for pzusers files and application directory
sudo chown -R $USER_NAME:$USER_GROUP $USER_HOME_DIR/bin
sudo chown -R $USER_NAME:$USER_GROUP $ZOMBOID_DIR
sudo chown -R $USER_NAME:$USER_GROUP $APP_DIR
sudo chown -R $USER_NAME:$USER_GROUP $CONF_SERVICE_DIR
sudo chown -R $USER_NAME:$USER_GROUP $CONF_SERVER_DIR

# copy service relevant files
sudo cp -f service/pzServerStart.sh $APP_DIR/pzserver-start
sudo cp -f service/pzServerStop.sh $APP_DIR/pzserver-stop
sudo cp -f service/pzomboid.service /etc/systemd/system/
sudo cp -f service/pzomboid.socket /etc/systemd/system/

# create full unit file instead of snippet
sudo systemctl edit pzomboid.service --force --full

# copy command binearies
sudo cp -f ../service/pzServerCmd.sh /usr/local/bin/pzserver-cmd

# set permissions for service files
sudo chmod 664 /etc/systemd/system/pzomboid.service
sudo chmod 664 /etc/systemd/system/pzomboid.socket

sudo chown -R $USER_NAME:$USER_GROUP $APP_DIR/pzserver-start
sudo chown -R $USER_NAME:$USER_GROUP $APP_DIR/pzserver-stop

# reload systemctl daemon
sudo systemctl daemon-reload

# install pzomboid server to the application's directory
#sudo -lu $USER_NAME bash $PATH_INSTALL_SERVER
sudo -u $USER_NAME bash -c 'cd ~/bin; bash installServer.sh /opt/pzserver/'


exit 0