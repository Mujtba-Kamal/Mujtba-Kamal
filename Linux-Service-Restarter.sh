#!/bin/bash
systemctl is-active --quiet apache2
if [ $? -ne 0 ]; then
    systemctl restart apache2
    echo "♻️ Apache Web Server crashed and was restarted." >> /var/log/monitor.log
fi
