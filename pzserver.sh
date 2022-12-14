#!/usr/bin/bash

# handling file inputs
FLAG=$1
SAVEGAME_NAME=$2
RAM_MIN=$3
RAM_MAX=$4
SERVER_DIR=$5

# determining procedure via utility flag
case $FLAG in

 0)
  echo "starting project zomboid server"
  cd ${SERVER_DIR}.steam/steamapps/common/Project\ Zomboid\ Dedicated\ Server/
  /bin/bash start-server.sh -Xms${RAM_MIN}m -Xmx${RAM_MAX}m -servername $SAVEGAME_NAME
  ;;

 1)
  echo "starting update procedure for application and mods"
  steamcmd +login anonymous +app_update 380870 validate +quit
  echo "starting project zomboid server"
  cd ${SERVER_DIR}.steam/steamapps/common/Project\ Zomboid\ Dedicated\ Server/
  /bin/bash start-server.sh -Xms${RAM_MIN}m -Xmx${RAM_MAX}m -servername $SAVEGAME_NAME
  ;;

 2)
  echo "starting install procedure"
  echo "not implemented yet"
  ;;

 3)
  echo "adding mod"
  echo "not implemented yet"
  ;;

 *)
  echo "unknown command given"

  echo "valid parameters are:"
  echo "0: start the server"
  echo "1: run an update"
  echo "2: install the server"
  echo "3: add a mod"

  echo "make sure all properties in /etc/systemd/system/pzomboid.d/override.conf are set correctly and parameter specific"
  ;;
esac
