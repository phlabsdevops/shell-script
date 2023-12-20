#!/bin/bash
#  this is for comment
ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
echo "Script-name: $0"
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

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

yum install mysql -y &>> $LOG_FILE
VALIDATE $? "Installation of MySql"
yum install git -y &>> $LOG_FILE
VALIDATE $? "Installation of Git"