#1/bin/bash

USERID=$(id -u)

LOGS_DIR=/var/log/shell-script
LOG_FILE="$LOGS_DIR/$0.log" # /home/ec2-user/shell-logs/11-logs.sh.log

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ]
then
    echo "Please run this script with super user"
    exit 1
fi
# 
function VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP :: $1 installing is... FAILED" | tee -a $LOG_FILE
        exit 1
    else 
        echo "$TIMESTAMP :: $1 is installed... SUCCESS" | tee -a $LOG_FILE
    fi
}
for package in $@
 do 
    # echo $package
    dnf list installed $package &>> $LOG_FILE
    if [ $? -eq 0 ]; then
        echo "$package is already Installed.. SKIPPING" | tee -a $LOG_FILE
    else
        echo "Installing $package"
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $package $?
    fi
 done