#!/usr/bin/bash

NAME_SAVEGAME=$1

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 0
fi

#mkdir migrate/$NAME_SAVEGAME

unzip migrate/$NAME_SAVEGAME.zip -d migrate/

cp -r migrate/export/db/$NAME_SAVEGAME.db ~/Zomboid/db
cp -r migrate/export/Saves/Multiplayer/$NAME_SAVEGAME ~/Zomboid/Saves/Multiplayer
cp -r migrate/export/Server/$NAME_SAVEGAME* ~/Zomboid/Server

rm -r migrate/export

exit 1