# PZomboidService
Systemd service to run steamcmd-installed project zomboid server.

# USAGE:

## Deploy service. Needs privileges.
bash deployService.sh USER_DIR
bash undeployService.sh

## Start service via starting the socket. Needs privileges.
systemctl start pzomboid.socket

## Stop service and then socket. Needs privileges.
systemctl stop pzomboid.service && systemctl stop pzomboid.socket

## Manage server via service. Needs privileges.
systemctl start|restart|stop|status pzomboid.service

## Run command on actual zomboid cli as pzuser.
echo CMD >> /pzuser/pzomboid.control

## Run command on actual zomboid cli with privileges.
bash /usr/local/bin/pzserver-cmd USER CMD

# Get further logs. Needs privileges.
journalctl -u pzomboid.service