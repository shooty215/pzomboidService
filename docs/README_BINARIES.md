# PZomboidService Binaries
The PZomboid Service comes with a variaty of different bash files to manage your server.
Here's a how to use them:

## USAGE:
Run all binaries in bin/ as pzuser and therefore without privileges.

### Add a mod to savegame in /home/pzuser/etc/server.conf.
bash addMod.sh MOD

### Delete a mod from savegame in /home/pzuser/etc/server.conf.
bash deleteMod.sh MOD

### Change the ports of savegame in /home/pzuser/etc/server.conf.
bash changePort.sh PORT_DEFAULT PORT_UDP

### Change the ram configuration of the server stated in /home/pzuser/etc/server.conf.
bash changeRam.sh RAM_MIN RAM_MAX

### Install a new server to a directory via steamcmd. Make sure the direcotry exists and is owned by the pzuser.
bash installServer.sh APP_DIR

### Delete from a directory.
bash deleteServer.sh APP_DIR

### Update server mentioned in /home/pzuser/etc/server.conf.
bash updateServer.sh

### Create new savegame with server mentioned in /home/pzuser/etc/server.conf.
bash createSavegame.sh NAME_SAVEGAME

### Rename savegame.
bash renameSavegame.sh NAME_SAVEGAME NAME_SAVEGAME_NEW

### Delete savegame.
bash deleteSavegame.sh NAME_SAVEGAME

### Export the savegames of the servers you run with the pzuser.
bash exportSavegame.sh NAME_SAVEGAME

### Import savegame(s) you want to run with the pzuser.
bash importSavegame.sh NAME_SAVEGAME