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

echo ''
echo "Create service's and server's user - input needed. CHOOSE SECURE PASSWORD!"
echo ''

echo ''
echo 'Deploying all service relevant files...'
echo ''

echo ''
echo 'Copying servers start executable to /usr/local/bin/'
echo ''

sudo cp -f service/pzServerStart.sh /usr/local/bin/pzserver-start

echo ''
echo 'Copying servers stop executable to /usr/local/bin/'
echo ''

sudo cp -f service/pzServerStop.sh /usr/local/bin/pzserver-stop

echo ''
echo 'Copying servers command executable to /usr/local/bin/'
echo ''

sudo cp -f service/pzServerCmd.sh /usr/local/bin/pzserver-cmd

echo ''
echo 'Copying service file to /etc/systemd/system/'
echo ''

sudo cp -f service/pzomboid.service /etc/systemd/system/

echo ''
echo 'Copying socket file to /etc/systemd/system/'
echo ''

sudo cp -f service/pzomboid.socket /etc/systemd/system/

echo ''
echo "Copying service config file to user's home folder"
echo ''

sudo cp -f service/pzomboid.control /home/pzuser/

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
sudo chmod 664 /home/pzuser/pzomboid.control

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

exit 1