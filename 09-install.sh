#1/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with super user"
    exit 1
fi

echo "installing MySQL "
dnf install mysqlSS -y
if [ $? -ne 0 ]
then
   echo "MySQL installing is... FAILED"
   exit 1
else 
   echo "MySQL is installed... SUCCESS"
fi 