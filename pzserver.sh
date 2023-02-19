#!/usr/bin/bash

# handling file inputs
cd ~
FLAG=grep -o '"FLAG": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'
USER=grep -o '"PZUSER": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'
SAVEGAME_NAME=grep -o '"NAME": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'
RAM_MIN=grep -o '"RAM_MIN": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'
RAM_MAX=grep -o '"RAM_MAX": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'
SERVER_DIR=grep -o '"PATH": "[^"]*' pzServiceConfig.json | grep -o '[^"]*$'

# determining procedure via utility flag
case $FLAG in

 0)
  echo "starting project zomboid server"
  cd ${SERVER_DIR}.steam/steamapps/common/Project\ Zomboid\ Dedicated\ Server/
  /bin/bash start-server.sh -servername $SAVEGAME_NAME
  ;;

 1)
  echo "starting update procedure for application and mods"
  steamcmd +login anonymous +app_update 380870 +validate +quit
  echo "starting project zomboid server"
  cd ${SERVER_DIR}.steam/steamapps/common/Project\ Zomboid\ Dedicated\ Server/
  /bin/bash start-server.sh -servername $SAVEGAME_NAME
  ;;

 2)
  echo "starting install procedure"
  echo "not implemented yet"
  cd ~
  dpkg --add-architecture i386
  # install steamcmd in deploy.sh to avoid privs
  #apt-get update
  #apt-get install steamcmd
  steamcmd
  login anonymous +app_update 380870 +validate +quit
  ;;

 3)
  echo "delete server"
  echo "not implemented yet"
  cd ~
  steamcmd
  login anonymous +app_uninstall 380870 +quit
  ;;

 4)
  echo "delete server"
  echo "not implemented yet"
  cd ~
  login anonymous +app_uninstall 380870 +quit
  ;;

 5)
  echo "adding mod"
  echo "not implemented yet"
  ;;

 *)
  echo "unknown command given"

  echo "valid parameters are:"
  echo "0: start the server"
  echo "1: run an update"
  echo "2: install the server"
  echo "3: uninstall the server"
  echo "4: add a mod"

  echo "make sure all properties in /etc/systemd/system/pzomboid.d/override.conf are set correctly and parameter specific"
  ;;
esac
