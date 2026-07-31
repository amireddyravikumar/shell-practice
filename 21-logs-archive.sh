#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
    echo "ERROR:: eother source directory or destintation directory empty"
    echo "USAGE:: $0 [source_dir] [dest_dir] [days(optional)::default 14]"
    exit 0
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory:: $SOURCE_DIR does not exists"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    echo "Source directory:: $DEST_DIR does not exists"
    exit 1
fi

FILES=$(find $SOURCE_DIR -type f -iname "*.log" -mtime +$DAYS)
if [ -z "$FILES" ]; then
    echo "Lod files older than 14 days not found, nothing to do"
    exit 0
fi
TIMESTAMP=$(date "+%Y-%m-%d-%H-%M-%S")

while IFS= read -r FILE
do
    echo "$FILE"
done <<< "$FILES"

ARCHIVE_FILE="$DEST_DIR/logs-archive-$TIMESTAMP.tar.gz"
tar -czvf $ARCHIVE_FILE $FILES &> /dev/null
if [ $# -eq 0 ]; then
    while IFS= read -r FILE
    do
        rm -f %FILE
        echo "Deleted file :: $FILE"
    done <<< "$FILES"
else 
    echo "ERROR:: Arcieval is failed"
    exit 0
fi