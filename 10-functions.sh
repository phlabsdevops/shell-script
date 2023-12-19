#!/bin/bash
#  this is for comment
ID=$(id -u)
VALIDATE(){

if [ $1 -ne 0 ]
then
echo "ERROR: $2 is fialed"
exit 1
else
echo "$2 is success"
fi
}
if [ $ID -ne 0 ]
then 
echo "ERROR: Please run script with root access"
exit 1 #give otherthan zero
else
echo "You are root user"
fi #indicating if condition end

yum install mysql -y
VALIDATE $? "Installation of MySql"
yum install git -y
VALIDATE $? "Installation of Git"