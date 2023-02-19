#!/usr/bin/bash
PZUSER= cat ./pzServiceConfig.json | python3 -c "import sys, json; print(json.load(sys.stdin)['PZUSER'])"
PATH_HOME= cat ./pzServiceConfig.json | python3 -c "import sys, json; print(json.load(sys.stdin)['PATH'])"
NAME= cat ./pzServiceConfig.json | python3 -c "import sys, json; print(json.load(sys.stdin)['NAME'])"
echo $PZUSER
echo $PATH_HOME
echo $NAME