# PZomboidService Binaries
The PZomboid Service comes with a variaty of different bash files to manage your server.
Here's a how to use them:

## USAGE:
Run all binaries in src/ as pzuser and therefore without privileges.

### Add a mod to your server.
bash addMod.sh SERVER_NAME MOD

### Delete a mod.
bash deleteMod.sh SERVER_NAME MOD

### Change the ports of your server.
bash changePort.sh SERVER_NAME PORT_DEFAULT PORT_UDP

### Change the ram configuration of a server in a directory.
bash changeRam.sh APP_DIR RAM_MIN RAM_MAX

### Install a new server to a directory via steamcmd. Make sure the direcotry exists and is owned by the pzuser.
bash installServer.sh APP_DIR

### Delete from a directory.
bash deleteServer.sh APP_DIR

### Update server in a directory.
bash updateServer.sh APP_DIR

### Create new savegame.
bash createSavegame.sh NAME_SAVEGAME APP_DIR

### Rename savegame.
bash renameSavegame.sh NAME_SAVEGAME NAME_SAVEGAME_NEW

### Delete savegame.
bash deleteSavegame.sh NAME_SAVEGAME

### Export the savegames of the servers you run with the pzuser.
bash exportSavegame.sh NAME_SAVEGAME

### Import savegame(s) you want to run with the pzuser.
bash importSavegame.sh NAME_SAVEGAME