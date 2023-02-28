#!/usr/bin/bash

NAME_SAVEGAME=$1

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 0
fi

mkdir migrate/$NAME_SAVEGAME

unzip migrate/$NAME_SAVEGAME.zip -d migrate/$NAME_SAVEGAME

cp -r migrate/$NAME_SAVEGAME/db/$NAME_SAVEGAME.db ~/Zomboid/db
cp -r migrate/$NAME_SAVEGAME/Saves/Multiplayer/$NAME_SAVEGAME ~/Zomboid/Saves/Multiplayer
cp -r migrate/$NAME_SAVEGAME/Server/$NAME_SAVEGAME* ~/Zomboid/Server

#rm -r migrate/import

exit 1