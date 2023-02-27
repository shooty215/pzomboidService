# PZomboidService
Systemd service to run steamcmd-installed project zomboid server.

# USAGE:

## Deploy service. Needs privileges.
bash deployService.sh
bash undeployService.sh

## Manage server via service. Needs privileges.
systemctl start|restart|stop|status pzomboid.service

## Run command on actual zomboid cli as pzuser.
echo '{cmd}' >> /pzuser/pzomboid.control

## Run command on actual zomboid cli with privileges.
bash /usr/local/bin/pzserver-cmd USER CMD

# Get further logs.
journalextl -u pzomboid.service