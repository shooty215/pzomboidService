# INSTALL

dpkg -i pzomboidservice_*.*.*_amd64.deb
dpkg -r pzomboidservice_*.*.*_amd64.deb

# FIRST-TIME-SETUP

  [1]:
    dpkg -i pzomboidservice_*.*.*_amd64.deb
  [2]:
    su pzuser
    cd ~/bin
  [3]:
    bash createSavegame.sh main
    type when savegame fully started on server: quit

    -- or import existing savegame in migrate/NAME.zip --

    bash importSavegame.sh NAME
  [3.1]:
    incease of import:
    change savegame name in /etc/pzomboidservice/service.conf AND /home/pzuser/etc/server.conf

    -- or simply rename imported savegame --

    bash renameSavegame.sh NAME main
  [4]:
    systemctl start pzomboid.socket

# MANPAGE

# NAME

pzomboidservice

# SYNOPSIS

man pzomboidservice

# DESCRIPTION

Package to install and handle a project zomboid
server. Provides a systemd service to run and
monitor the game server. Additionally provides
binaries to more easily set server options and
add or delete mods to the bound savegame.

  [1]: https://github.com/shooty215/pzomboidService.git

# USAGE with privileges

General application handling via the systemd service and pzserver-cmd.

  [start]:
    systemctl start pzomboid.socket

  [stop]:
    pzserver-cmd save && sleep 10s && pzserver-cmd quit
    
    -- or (non-recommended) --

    systemctl stop pzomboid.service && systemctl stop pzomboid.socket
  
  [restart]:
    systemctl start pzomboid.service

    -- or (when stopped the unrecommended way) --

    systemctl start pzomboid.socket

  [command]:
    pzserver-cmd CMD

# SERVER-MANAGEMENT as pzuser

More specific server configuration only via pzuser.

[pzuser]:
    su pzuser
    cd ~/bin

## SET-PREFERENCES 
    
    ram - in gbs

  [ports]:
    bash changePort.sh PORT_DEFAULT PORT_UDP

  [ram]:
    bash changeRam.sh RAM_MIN RAM_MAX

## ADD-AND-DELETE-MODS

    number: no seperator '45587'

    -- or --

    numbers: no heading and trailing seperator '45587;45588' (only for adding)

  [add]:
    bash addMod.sh MOD

  [delete]:
    bash deleteMod.sh MOD

## UPDATE-SERVER

  [update]:
    bash updateServer.sh

## EXPORT-AND-IMPORT-SAVEGAME

    name - without file extention

  [export]:
    bash exportSavegame.sh NAME_SAVEGAME

  [import]:
    bash importSavegame.sh NAME_SAVEGAME


## CREATE-AND-DELETE-SAVEGAME
    
    name - without file extention

  [create]:
    bash createSavegame.sh NAME_SAVEGAME

  [delete]:
    bash deleteSavegame.sh NAME_SAVEGAME


## INSTALL-AND-UNINSTALL-SERVER

    absolute path to game server

  [install]:
    bash installServer.sh APP_DIR

  [uninstall]:
    bash deleteServer.sh APP_DIR

## RENAME-SAVEGAME

    names - without file extention

  [rename]:
    bash renameSavegame.sh NAME_SAVEGAME NAME_SAVEGAME_NEW