# Install Process:

## Create a user for the pzomboid server.
adduser pzuser

## Deploy repository binaries to user's home folder, create default server directory
## and install a needed packages(jq, steamcmd). Needs privileges.
deployBinaries.sh /home/pzuser

## Deploy systemd service files and configure unit. Needs privileges.
deployService.sh

## Install a pzomboid server via the steamcmd as pzuser.
su pzuser
installServer.sh /opt/pzserver



# Uninstalling Process:

## Delete binaries from user's home folder. Needs privileges.
bash undeployBinaries.sh /home/pzuser

## Delete systemd service files. Needs privileges.
bash undeployService.sh

## Delete server at given path as pzuser.
bash deleteServer.sh /opt/pzserver

## Delete user, folder, steam and jq. Needs privileges.
deluser pzuser
rm -r /opt/pzserver
apt remove steamcmd jq



# Updating Process:

## Run updating binaries as pzuser.
bash updateServer.sh /opt/pzserver

