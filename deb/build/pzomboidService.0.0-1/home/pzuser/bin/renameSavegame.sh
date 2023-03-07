#!/usr/bin/bash

NAME_SAVEGAME_RENAME=$1
NAME_SAVEGAME_RENAME_NEW=$2

if [ $NAME_SAVEGAME_RENAME == "" ]; then
    echo "Savegame's name not stated, exiting script!"
    exit 1
fi

if [ $NAME_SAVEGAME_RENAME_NEW == "" ]; then
    echo "Savegame's new name not stated, exiting script!"
    exit 1
fi

cp -f ~/Zomboid/db/$NAME_SAVEGAME_RENAME.db ~/Zomboid/db/$NAME_SAVEGAME_RENAME_NEW.db
cp -rf ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME_RENAME ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME_RENAME_NEW

cp -f ~/Zomboid/Server/$NAME_SAVEGAME_RENAME.ini ~/Zomboid/Server/$NAME_SAVEGAME_RENAME_NEW.ini
cp -f ~/Zomboid/Server/${NAME_SAVEGAME_RENAME}_SandboxVars.lua ~/Zomboid/Server/${NAME_SAVEGAME_RENAME_NEW}_SandboxVars.lua
cp -f ~/Zomboid/Server/${NAME_SAVEGAME_RENAME}_spawnpoints.lua ~/Zomboid/Server/${NAME_SAVEGAME_RENAME_NEW}_spawnpoints.lua
cp -f ~/Zomboid/Server/${NAME_SAVEGAME_RENAME}_spawnregions.lua ~/Zomboid/Server/${NAME_SAVEGAME_RENAME_NEW}_spawnregions.lua

rm -f ~/Zomboid/db/$NAME_SAVEGAME_RENAME.db
rm -rf ~/Zomboid/Saves/Multiplayer/$NAME_SAVEGAME_RENAME
rm -f ~/Zomboid/Server/$NAME_SAVEGAME_RENAME.ini
rm -f ~/Zomboid/Server/${NAME_SAVEGAME_RENAME}_SandboxVars.lua
rm -f ~/Zomboid/Server/${NAME_SAVEGAME_RENAME}_spawnpoints.lua
rm -f ~/Zomboid/Server/${NAME_SAVEGAME_RENAME}_spawnregions.lua

exit 0