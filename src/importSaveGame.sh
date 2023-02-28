#!/usr/bin/bash

NAME_SAVEGAME=$1

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 0
fi

unzip migrate/$NAME_SAVEGAME.zip migrate/import

cp -r migrate/import/db/$NAME_SAVEGAME.db ~/Zomboid/db
cp -r migrate/import/Saves/Multiplayer/ ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME
cp -r migrate/import/Server/$NAME_SAVEGAME* ~/Zomboid/Server

rm -r migrate/import/*

exit 1