#1/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with super user"
    exit 1
fi

dnf list installed mysql
if [ $? -eq 0 ]; then
   echo "MySQL is already Installed.. SKIPPING"
else
   echo "Installing MySQL"
   dnf install mysql -y
   if [ $? -ne 0 ]
   then
      echo "MySQL installing is... FAILED"
      exit 1
   else 
      echo "MySQL is installed... SUCCESS"
   fi 
fi