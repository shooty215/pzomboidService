#!/usr/bin/bash

echo "Fix missing or broken dependencies by running: sudo apt install --fix-broken."

read -p "Choose OS: Type 'Ubuntu' or 'Debian' " VAL_CONFIG_OS

if [[ $VAL_CONFIG_OS == "debian" || $VAL_CONFIG_OS == "Debian" || $VAL_CONFIG_OS == "DEBIAN" ]]; then

    read -p "Are you running Debian 10 and lower OR Debian 11 and higher?': Type '10' or '11' " VAL_CONFIG_VERSION

    if [ $VAL_CONFIG_VERSION == "10" ]; then
        sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip zip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 default-jre rng-tools
    elif [ $VAL_CONFIG_VERSION == "11" ]; then
        sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip zip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 default-jre rng-tools
    else
        echo "Bad input! Exiting..."
        exit 0
    fi

elif [[ $VAL_CONFIG_OS == "ubuntu" || $VAL_CONFIG_OS == "Ubuntu" || $VAL_CONFIG_OS == "UBUNTU" ]]; then

    read -p "Are you running Ubuntu 20.04 and lower OR Ubuntu 20.10 and higher?': Type '20.04' or '20.10' " VAL_CONFIG_VERSION

    if [ $VAL_CONFIG_VERSION == "20.04"]; then
        sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip zip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 libsdl2-2.0-0:i386 steamcmd default-jre rng-tools
    elif [ $VAL_CONFIG_VERSION == "20.10" ]; then
        sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip zip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 steamcmd default-jre rng-tools
    else
        echo "Bad input! Exiting..."
        exit 0
    fi

else
    echo "Bad input! Exiting..."
    exit 0
fi

sudo apt install steamcmd -y

echo ''
echo 'Installed all required packages. See above for errors!'
echo ''

echo ""
echo "Creating default application folder and setting its' ownership."
echo ""

sudo mkdir /opt/pzserver

echo ''
echo "Don't forget to add a new user for the service! Run 'adduser pzuser' to create the service's default user."
echo "Though you can start and stop the pzomboidService without touching this user,"
echo "keep in mind that you have to be able to log into it, to use all of the provided binaries!"
echo ''

exit 1