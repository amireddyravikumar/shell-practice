#1/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
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
        echo -e "$TIMESTAMP [ERROR] $1 installing is...  $R FAILED" | tee -a $LOG_FILE
        exit 1
    else 
        echo -e "$TIMESTAMP [INFO] $1 is installed... $G SUCCESS" | tee -a $LOG_FILE
    fi
}
for package in $@
 do 
    # echo $package
    dnf list installed $package &>> $LOG_FILE
    if [ $? -eq 0 ]; then
        echo -e "$TIMESTAMP [INFO] $package is already Installed.. $Y SKIPPING $N" | tee -a $LOG_FILE
    else
        echo "Installing $package"
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $package $?
    fi
 done