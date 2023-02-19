#!/usr/bin/bash
read -p "Make sure to edit ./pzServiceConfig.json. The savegame name, user name and path are vital! The script needs priviliges to run! validate with 'yes' or 'no' : " VAL_CONFIG

if [ $VAL_CONFIG == "no" ]; then
    echo "Edit file and re-run script."
    exit 1
elif [ $VAL_CONFIG == "yes" ]; then
    echo "Running deployment."
else
    echo "Yes or no! re-run script."
    exit 1
fi

PZUSER= cat ./pzServiceConfig.json | python3 -c "import sys, json; print(json.load(sys.stdin)['PZUSER'])"
PATH_HOME= cat ./pzServiceConfig.json | python3 -c "import sys, json; print(json.load(sys.stdin)['PATH'])"
NAME= cat ./pzServiceConfig.json | python3 -c "import sys, json; print(json.load(sys.stdin)['NAME'])"

echo 'installing steamcmd.'
#sudo apt-get update
sudo apt-get install steamcmd

echo 'create service"s and server"s user - input needed. CHOOSE SECURE PASSWORD!'
sudo adduser $PZUSER

echo 'creating service file from properties json...'
sudo bash createServiceFile.sh $PZUSER $PATH $NAME

echo 'deploying all service relevant files...'

echo 'copying servers executable to /usr/local/bin/'
sudo cp -f pzserver.sh /usr/local/bin/pzserver

echo 'copying service file to /etc/systemd/system/'
sudo cp -f pzomboid.service /etc/systemd/system/

echo 'copying socket file to /etc/systemd/system/'
sudo cp -f pzomboid.socket /etc/systemd/system/

echo 'creating full unit file instead of snippet'
sudo systemctl edit pzomboid.service --force --full

echo 'copying service config file to /etc/systemd/system/pzomboid.service.d/'
sudo cp -f pzServiceConfig.json $PATH/pzServiceConfig.json

echo 'done. Setting permissions...'
sudo chmod 664 /etc/systemd/system/pzomboid.service
sudo chmod 664 /etc/systemd/system/pzomboid.socket
sudo chmod 664 $PATH/pzServiceConfig.json

echo 'done. reloading systemctl daemon...'
sudo systemctl daemon-reload
echo 'done. make sure to check the config file:'
echo '/etc/systemd/system/pzomboid.service.d/'
echo 'and take a look at the README.md in the repository BEFORE running the service!'