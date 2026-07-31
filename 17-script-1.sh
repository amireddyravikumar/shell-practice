#!/bin/bash

COUNTRY="INDIA"

echo "Coutry : $COUNTRY"
echo "PID is in script-1: $$"
sh 18-script-2.sh
source ./18-script-2.sh
