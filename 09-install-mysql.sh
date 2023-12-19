#!/bin/bash
#  this is for comment
ID=$(id -u)
if [ $ID -ne 0 ]
then 
echo "ERROR: Please run script with root access"
exit 1 #give otherthan zero
else
echo "You are root user"
fi #indicating if condition end

yum install mysql -y

if [ $? -ne 0 ]
echo "ERROR: Installation of MySql fialed"
exit 1
else
echo "Installation of MySql is success"
fi