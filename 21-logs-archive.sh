#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=$(3:-14)

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