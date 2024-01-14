#!/bin/bash
#  this is for comment
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
echo "Script-name: $0"
LOG_FILE="/tmp/$0-$TIMESTAMP.log"
echo "Script started executing at $TIMESTAMP"

VALIDATE(){
if [ $1 -ne 0 ]
then
echo -e " $R ERROR: $2 is fialed $N"
exit 1
else
echo "$G $2 is success $N"
fi
}
if [ $ID -ne 0 ]
then 
echo -e "$R ERROR: Please run script with root access $N"
exit 1 #give otherthan zero
else
echo "You are root user"
fi #indicating if condition end

yum install mysql -y &>> $LOG_FILE
VALIDATE $? "Installation of MySql"
yum install git -y &>> $LOG_FILE
VALIDATE $? "Installation of Git"