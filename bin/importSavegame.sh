#!/bin/bash

NAME_SAVEGAME_IMPORT=$1

if [ $NAME_SAVEGAME_IMPORT == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 1
fi

unzip migrate/$NAME_SAVEGAME_IMPORT.zip -d migrate/

cp -r migrate/export/db/$NAME_SAVEGAME_IMPORT.db ~/Zomboid/db
cp -r migrate/export/Saves/Multiplayer/$NAME_SAVEGAME_IMPORT ~/Zomboid/Saves/Multiplayer
cp -r migrate/export/Server/$NAME_SAVEGAME_IMPORT* ~/Zomboid/Server

rm -r migrate/export


exit 0