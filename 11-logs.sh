#1/bin/bash

USERID=$(id -u)

LOGS_DIR=/home/ec2-user/shell-logs
LOG_FILE="$LOGS_DIR/$0.log" # /home/ec2-user/shell-logs/11-logs.sh.log

if [ $USERID -ne 0 ]
then
    echo "Please run this script with super user"
    exit 1
fi
# 
function VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$1 installing is... FAILED"
        exit 1
    else 
        echo "$1 is installed... SUCCESS"
    fi 
}


dnf list installed mysql &>> $LOG_FILE
if [ $? -eq 0 ]; then
   echo "MySQL is already Installed.. SKIPPING"
else
   echo "Installing MySQL"
   dnf install mysql -y &>> $LOG_FILE
   VALIDATE Mysql $?
fi

dnf list installed nginx &>> $LOG_FILE
if [ $? -eq 0 ]; then
   echo "nginx is already Installed.. SKIPPING"
else
   echo "Installing nginx" 
   dnf install nginx -y &>> $LOG_FILE
   VALIDATE Mysql $?
fi