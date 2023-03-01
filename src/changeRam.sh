#!/usr/bin/bash

APP_DIR=$1
RAM_MIN=$2
RAM_MAX=$3

if [ $APP_DIR == "" ]; then
    echo "No application directory stated, falling back to default: /opt/pzserver/"
    APP_DIR="/opt/pzserver/"
fi

if [ $RAM_MIN == "" ]; then
    echo "No minimum ram set, falling back to default: 4"
    RAM_MIN=4
fi

if [ $RAM_MAX == "" ]; then
    echo "No maximum ram set, falling back to default: 8"
    RAM_MAX=8
fi

if [ ${APP_DIR: -1} == "/" ]; then
    APP_DIR=${APP_DIR::-1} 
fi

JSON_STRING=$( jq -n '{ "vmArgs":[ "-Xms'$RAM_MIN'g", "-Xmx'$RAM_MAX'g" ] }' )

echo $JSON_STRING > config/input.json

jq -s '.[0].vmArgs + .[1].vmArgs' config/input.json config/vmArgs.json > config/vmArgs.new.json

JSON_ARGS_NEW=$( cat config/vmArgs.new.json)

JSON_ARGS_NEW_NAMED='{ "vmArgs": '$JSON_ARGS_NEW'}'

echo $JSON_ARGS_NEW_NAMED > config/vmArgs.new.json

jq -s '.[0] + .[1]' config/ProjectZomboid64.json config/vmArgs.new.json > config/ProjectZomboid64.new.json

cat config/ProjectZomboid64.new.json > $APP_DIR/ProjectZomboid64.json

rm config/input.json
rm config/vmArgs.new.json
rm config/ProjectZomboid64.new.json

exit 1
