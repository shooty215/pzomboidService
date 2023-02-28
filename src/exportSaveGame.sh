#!/usr/bin/bash

NAME_SAVEGAME=$1

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 0
fi

mkdir migrate/export

cp -r ~/Zomboid/db/$NAME_SAVEGAME.db migrate/export/db
cp -r ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME migrate/export/Saves/Multiplayer/
cp -r ~/Zomboid/Server/$NAME_SAVEGAME* migrate/export/Server

zip -r migrate/$NAME_SAVEGAME.zip migrate/export

rm -r migrate/export/*

exit 1