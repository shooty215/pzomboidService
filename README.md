# pzomboidService
Systemd service to run and update a steamcmd-installed project zomboid server.

Make sure to edit the settings in /etc/systemd/system/pzomboid.service.d/override.conf: FLAG={1:run,2:update-run,3:install,4:add-mod}.

Install and mod-addition functionalities are yet to be implemented.

## USAGE:

# deploy service
bash deploy.sh
bash undeploy.sh

# manage server
systemctl start|restart|stop|status pzomboid.service

# set all other useful server properties in
/etc/systemd/system/pzomboid.d/override.conf

# run command on actual zomboid cli
echo '{cmd}' >> /run/pzomboid.stdin

# get further logs
journalextl -u pzomboid.service