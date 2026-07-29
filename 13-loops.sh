#1/bin/bash

USERID=$(id -u)

LOGS_DIR=/var/log/shell-script
LOG_FILE="$LOGS_DIR/$0.log" # /home/ec2-user/shell-logs/11-logs.sh.log

if [ $USERID -ne 0 ]
then
    echo "Please run this script with super user"
    exit 1
fi
# 
function VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$1 installing is... FAILED" | tee -a $LOG_FILE
        exit 1
    else 
        echo "$1 is installed... SUCCESS" | tee -a $LOG_FILE
    fi
}

 for package in $@
 do 
    echo $package
 done