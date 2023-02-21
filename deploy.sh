#!/usr/bin/bash
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

echo 'installing steamcmd.'

sudo apt-get update
sudo apt-get install steamcmd

echo 'create service"s and server"s user - input needed. CHOOSE SECURE PASSWORD!'

echo 'deploying all service relevant files...'

echo 'copying servers start executable to /usr/local/bin/'
sudo cp -f bin/pzServerStart.sh /usr/local/bin/pzserverStart

echo 'copying servers stop executable to /usr/local/bin/'
sudo cp -f bin/pzServerStop.sh /usr/local/bin/pzserverStop

echo 'copying service file to /etc/systemd/system/'
sudo cp -f service/pzomboid.service /etc/systemd/system/

echo 'copying socket file to /etc/systemd/system/'
sudo cp -f service/pzomboid.socket /etc/systemd/system/

echo "copying service config file to user's home folder"
sudo cp -f service/pzomboid.control /home/pzuser/

echo 'creating full unit file instead of snippet'
sudo systemctl edit pzomboid.service --force --full

echo 'done. Setting permissions...'
sudo chmod 664 /etc/systemd/system/pzomboid.service
sudo chmod 664 /etc/systemd/system/pzomboid.socket
sudo chmod 664 /home/pzuser/pzomboid.control

echo 'done. reloading systemctl daemon...'
sudo systemctl daemon-reload
echo 'done. make sure to check the config file:'
echo '/etc/systemd/system/pzomboid.service.d/'
echo 'and take a look at the README.md in the repository BEFORE running the service!'