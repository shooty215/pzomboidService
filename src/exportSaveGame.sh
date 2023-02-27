#!/usr/bin/bash

mkdir migrate/export

cp -r ~/Zomboid/Server migrate/export/
cp -r ~/Zomboid/db migrate/export/
cp -r ~/Zomboid/Logs migrate/export/
cp -r ~/Zomboid/messaging migrate/export/
cp -r ~/Zomboid/backups migrate/export/
cp -r ~/Zomboid/Saves migrate/export/
cp -r ~/Zomboid/Lua migrate/export/
cp ~/Zomboid/server-console.txt migrate/export/
cp ~/Zomboid/options.ini migrate/export/

zip -r migrate/export.zip migrate/export

rm -r migrate/export

exit 1