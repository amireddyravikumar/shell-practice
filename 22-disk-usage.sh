#!/bin/bash

DISK_TRESHOLD=10
DISK_USAGE=$(df -hT | grep -v Filesystem)
SERVER_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
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

sh mail.sh "DevOps Team" "High Disk Usage" "$SERVER_IP" "$MESSAGE" "amireddyravi@gmail.com" "High Disk Usage Alert"
