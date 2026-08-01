#!/bin/bash

DISK_TRESHOLD=10
DISK_USAGE=$(df -hT | grep -v Filesystem)
while IFS= read -r line
do 
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    echo "$PARTITION : $USAGE"
    if [ "$USAGE" -ge "$DISK_TRESHOLD" ] ; then
        MESSAGE+="Disk Usage is High on $PARTITION: $USAGE \n"
    fi
done <<< "$DISK_USAGE"
echo -e $MESSAGE