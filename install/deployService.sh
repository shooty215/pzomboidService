#!/usr/bin/bash

read -p "Make sure you have created the user pzuser before running this! validate with 'yes' or 'no' : " VAL_CONFIG

USER_DIR=$1

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
    USER_DIR="/home/pzuser"
fi

if [ ${USER_DIR: -1} == "/" ]; then
    USER_DIR=${USER_DIR::-1} 
fi

echo ''
echo 'Deploying all service relevant files...'
echo ''

echo ''
echo 'Copying servers start executable to /usr/local/bin/'
echo ''

sudo cp -f ../service/pzServerStart.sh /opt/pzserver/pzserver-start

echo ''
echo 'Copying servers stop executable to /usr/local/bin/'
echo ''

sudo cp -f ../service/pzServerStop.sh /opt/pzserver/pzserver-stop

echo ''
echo 'Copying servers command executable to /usr/local/bin/'
echo ''

sudo cp -f ../service/pzServerCmd.sh /usr/local/bin/pzserver-cmd

echo ''
echo 'Copying service file to /etc/systemd/system/'
echo ''

sudo cp -f ../service/pzomboid.service /etc/systemd/system/

echo ''
echo 'Copying socket file to /etc/systemd/system/'
echo ''

sudo cp -f ../service/pzomboid.socket /etc/systemd/system/

echo ''
echo 'Creating full unit file instead of snippet'
echo ''

sleep 3s

sudo systemctl edit pzomboid.service --force --full

echo ''
echo 'Done. Setting permissions...'
echo ''

sudo chmod 664 /etc/systemd/system/pzomboid.service
sudo chmod 664 /etc/systemd/system/pzomboid.socket

sudo chown -R pzuser:pzuser /opt/pzserver/pzServerStart.sh
sudo chown -R pzuser:pzuser /opt/pzserver/pzServerStop.sh

echo ''
echo 'Done. Reloading systemctl daemon...'
echo ''

sudo systemctl daemon-reload

echo ''
echo 'done. make sure to check the config file:'
echo '/etc/systemd/system/pzomboid.service.d/'
echo ''
echo 'If your not using /opt/pzserver/ as install directory and/or pzuser as respective application user, you have to manually change the pzomboid.service in /etc/systemd/system/.'
echo 'Also take a look at the README.md in the repository BEFORE running the service!'
echo ''


exit 0