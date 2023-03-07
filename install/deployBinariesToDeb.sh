sudo rm -rf ../deb/build/pzomboidservice-0.0.2/etc
sudo rm -rf ../deb/build/pzomboidservice-0.0.2/home
sudo rm -rf ../deb/build/pzomboidservice-0.0.2/opt
sudo rm -rf ../deb/build/pzomboidservice-0.0.2/usr/local

echo waiting
sleep 10s

sudo mkdir ../deb/build/pzomboidservice-0.0.2/opt
sudo mkdir ../deb/build/pzomboidservice-0.0.2/opt/pzserver

sudo mkdir ../deb/build/pzomboidservice-0.0.2/etc
sudo mkdir ../deb/build/pzomboidservice-0.0.2/etc/pzomboidservice
sudo mkdir ../deb/build/pzomboidservice-0.0.2/etc/systemd
sudo mkdir ../deb/build/pzomboidservice-0.0.2/etc/systemd/system

sudo mkdir ../deb/build/pzomboidservice-0.0.2/home
sudo mkdir ../deb/build/pzomboidservice-0.0.2/home/pzuser
sudo mkdir ../deb/build/pzomboidservice-0.0.2/home/pzuser/etc
sudo mkdir ../deb/build/pzomboidservice-0.0.2/home/pzuser/bin
sudo mkdir ../deb/build/pzomboidservice-0.0.2/usr/local
sudo mkdir ../deb/build/pzomboidservice-0.0.2/usr/local/bin

sudo cp -rf ../bin/* ../deb/build/pzomboidservice-0.0.2/home/pzuser/bin
sudo cp -f ../conf/service.conf ../deb/build/pzomboidservice-0.0.2/etc/pzomboidservice
sudo cp -f ../conf/server.conf ../deb/build/pzomboidservice-0.0.2/home/pzuser/etc

sudo cp -f ../service/pzomboid.service ../deb/build/pzomboidservice-0.0.2/etc/systemd/system
sudo cp -f ../service/pzomboid.socket ../deb/build/pzomboidservice-0.0.2/etc/systemd/system

sudo cp -f ../service/pzServerStart.sh ../deb/build/pzomboidservice-0.0.2/opt/pzserver/pzserver-start
sudo cp -f ../service/pzServerStop.sh ../deb/build/pzomboidservice-0.0.2/opt/pzserver/pzserver-stop
sudo cp -f ../service/pzServerCmd.sh ../deb/build/pzomboidservice-0.0.2/usr/local/bin/pzserver-cmd

sudo chmod -R 750 +x ../deb/build/pzomboidservice-0.0.2/home/pzuser/bin/*

sudo chown -R pzuser:pzuser ../deb/build/pzomboidservice-0.0.2/opt/
sudo chown -R pzuser:pzuser ../deb/build/pzomboidservice-0.0.2/home/
sudo chown -R pzuser:pzuser ../deb/build/pzomboidservice-0.0.2/etc/
sudo chown -R pzuser:pzuser ../deb/build/pzomboidservice-0.0.2/usr/
