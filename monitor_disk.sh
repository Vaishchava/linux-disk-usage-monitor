#!/bin/bash

set -e

THRESHOLD=80
LOGFILE="/home/vaish/disk_alert.log"

# Get current disk usage of root partition
usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Current Disk Usage: ${usage}%"

# Compare usage with threshold
if [ "$usage" -gt "$THRESHOLD" ]
then
    echo "$(date) - ALERT: Disk usage crossed ${THRESHOLD}% (Current Usage: ${usage}%)" >> "$LOGFILE"

    echo "WARNING: High Disk Usage!"
else
    echo "Disk usage is under control"
fi
