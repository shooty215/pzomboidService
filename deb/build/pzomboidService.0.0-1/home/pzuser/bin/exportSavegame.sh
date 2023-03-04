#!/usr/bin/bash

NAME_SAVEGAME=$1

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 1
fi

mkdir migrate/export
mkdir migrate/export/db
mkdir migrate/export/Saves
mkdir migrate/export/Saves/Multiplayer
mkdir migrate/export/Server

cp -r ~/Zomboid/db/$NAME_SAVEGAME.db migrate/export/db
cp -r ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME migrate/export/Saves/Multiplayer/
cp -r ~/Zomboid/Server/$NAME_SAVEGAME* migrate/export/Server

cd migrate
zip -r $NAME_SAVEGAME.zip export/

rm -r export/

exit 0