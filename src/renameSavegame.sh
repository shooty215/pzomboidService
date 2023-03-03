#!/usr/bin/bash

NAME_SAVEGAME=$1
NAME_SAVEGAME_NEW=$2

if [ $NAME_SAVEGAME == "" ]; then
    echo "Savegame's name not stated, exitting script!"
    exit 1
fi

cp -f ~/Zomboid/db/$NAME_SAVEGAME.db ~/Zomboid/db/$NAME_SAVEGAME_NEW.db
cp -rf ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME_NEW

cp -f ~/Zomboid/Server/$NAME_SAVEGAME.ini ~/Zomboid/Server/$NAME_SAVEGAME_NEW.ini
cp -f ~/Zomboid/Server/${NAME_SAVEGAME}_SandboxVars.lua ~/Zomboid/Server/${NAME_SAVEGAME_NEW}_SandboxVars.lua
cp -f ~/Zomboid/Server/${NAME_SAVEGAME}_spawnpoints.lua ~/Zomboid/Server/${NAME_SAVEGAME_NEW}_spawnpoints.lua
cp -f ~/Zomboid/Server/${NAME_SAVEGAME}_spawnregions.lua ~/Zomboid/Server/${NAME_SAVEGAME_NEW}_spawnregions.lua

rm -f ~/Zomboid/db/$NAME_SAVEGAME.db
rm -rf ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME
rm -f ~/Zomboid/Server/$NAME_SAVEGAME.ini
rm -f ~/Zomboid/Server/${NAME_SAVEGAME}_SandboxVars.lua
rm -f ~/Zomboid/Server/${NAME_SAVEGAME}_spawnpoints.lua
rm -f ~/Zomboid/Server/${NAME_SAVEGAME}_spawnregions.lua

exit 0