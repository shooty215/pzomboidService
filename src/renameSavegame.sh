#!/usr/bin/bash

NAME_SAVEGAME=$1
NAME_SAVEGAME_NEW=$2

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 0
fi

mv -f ~/Zomboid/db/$NAME_SAVEGAME.db ~/Zomboid/db/$NAME_SAVEGAME_NEW.db
mv -r ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME_NEW
mv -r ~/Zomboid/Server/$NAME_SAVEGAME* ~/Zomboid/Server/$NAME_SAVEGAME_NEW*

exit 1