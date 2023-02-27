#!/usr/bin/bash

unzip migrate/import.zip migrate/import

cp -r migrate/import/Server ~/Zomboid/
cp -r migrate/import/db ~/Zomboid/
cp -r migrate/import/Logs ~/Zomboid/
cp -r migrate/import/messaging ~/Zomboid/
cp -r migrate/import/Zomboid/backups ~/Zomboid/
cp -r migrate/import/Zomboid/Saves ~/Zomboid/
cp -r migrate/import/Zomboid/Lua ~/Zomboid/
cp migrate/import/server-console.txt ~/Zomboid/
cp migrate/import/options.ini ~/Zomboid/

rm -r migrate/import

exit 1