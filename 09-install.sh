#1/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with super user"
    exit 1
fi

echo "installing MySQL "
dnf install mysqldsd -y
echo "i am continuing"
echo "i am still continuing"
