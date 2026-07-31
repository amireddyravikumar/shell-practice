#!/bin/bash

SOURCE_DIR=$1
DAYS=${2:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo $SOURCE_DIR
echo $DAYS

if [ -z $SOURCE_DIR ]; then
    echo "ERROR.::Missing parameters"
    echo "USAGE: $0 <source-dir> [days(optional default to 14)]"
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then 
  echo -e "$R ERROR $N:: Directory $SOURCE_DIR $R doesn't exists $N"
fi

echo "scanning $SOURCE_DIR for log files older than 14 days"
FILES=$(find $SOURCE_DIR -iname "*.log" -type f -mtime +$DAYS)
echo $FILES
if [ -z "$FILES" ]; then
    echo "No log files older than 14 days found"
    exit 0
fi

while IFS= read -r FILE
do
    echo "Files to be deleted: $FILE"
    rm -f $FILE
    echo "$FILE Deleted"
done <<< "$FILES"

