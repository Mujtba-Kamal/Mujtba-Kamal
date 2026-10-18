#!/bin/bash
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ $USAGE -gt 90 ]; then
    echo "CRITICAL: Linux Server Disk space is above 90%!" | mail -s "Disk Alert" it-support@domain.com
fi
