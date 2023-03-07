# Install Process:

## Fresh install
bash install.sh


## Create a user for the pzomboid server.
adduser pzuser

## Deploy repository binaries to user's home folder, create default server directory
## And install all required packages. Needs privileges.
## If the script fails run 'apt install --fix-broken'. Needs privileges.
bash installRequirements.sh

## Deploy binaries.
bash deployBinaries.sh USER_DIR

## Deploy systemd service files and configure unit. Needs privileges.
bash deployService.sh USER_DIR

## Install a pzomboid server via the steamcmd as pzuser. Make sure the user has ownership of the directory. chown -R user:group dir
su pzuser && cd ~/bin
bash installServer.sh APP_DIR

## Create new savegame/server.
su pzuser && cd ~/bin
bash createSavegame.sh NAME_SAVEGAME APP_DIR

# Uninstalling Process:

## Delete binaries from user's home folder. Needs privileges.
bash undeployBinaries.sh USER_DIR

## Delete systemd service files. Needs privileges.
bash undeployService.sh

## Delete server at given path as pzuser.
su pzuser && cd ~/bin
bash deleteServer.sh APP_DIR

## Delete user, folder and steamcmd. Needs privileges.
deluser pzuser
rm -r /opt/pzserver
apt remove steamcmd



# Updating Process:

## Run updating binaries as pzuser.
su pzuser && cd ~/bin
bash updateServer.sh APP_DIR

