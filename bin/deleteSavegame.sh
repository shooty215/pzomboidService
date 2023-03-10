#!/bin/bash

NAME_SAVEGAME_DELETE=$1

if [ $NAME_SAVEGAME_DELETE == "" ]; then
    echo "Savegame's name not stated, exiting script!"
    exit 1
fi

echo $'\ndeleting savegame: '$NAME_SAVEGAME_DELETE$'\n'

rm -f ~/Zomboid/db/$NAME_SAVEGAME_DELETE.db
rm -rf ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME_DELETE
rm -rf ~/Zomboid/Server/$NAME_SAVEGAME_DELETE*

exit 0