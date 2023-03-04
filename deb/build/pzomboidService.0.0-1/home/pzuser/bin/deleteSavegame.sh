#!/usr/bin/bash

NAME_SAVEGAME=$1

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 1
fi

rm -f ~/Zomboid/db/$NAME_SAVEGAME.db
rm -rf ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME
rm -rf ~/Zomboid/Server/$NAME_SAVEGAME*

exit 0