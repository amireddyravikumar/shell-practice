#!/bin/bash

DISK_TRESHOLD=70
DISK_USAGE=$(df -hT | grep -v Filesystem)
while IFS= read -r line
do 
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    echo "$PARTITION : $USAGE"
    if [ "$DISK_TRESHOLD" -ge "$USAGE"] ; then
        echo "Disk Usage is High on $PARTITION: $USAGE"
    if 

done <<< "$DISK_USAGE"