#!/bin/bash
#  this is for comment
ID=$(id -u)
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"
echo "Script started executing at $TIMESTAMP" &>> $LOG_FILE 
VALLIDATE(){
    if [ $1 -ne 0 ]
    then       
    echo -e "$R ERROR:$N $2 $R FAILED $N"
    exit 1
    else
    echo -e "$G $2 SUCCESS $N"
    fi
}
if [ $ID -ne 0 ]
then
echo -e "$R Please run the script with root user $N"
exit 1
else
echo -e "$G You are root user $N"
fi
for package in $@ # passed the package names as arguments
do 
yum list installed $package &>> $LOG_FILE   #check installed or not 
if [ $? -ne 0 ] #if not installed
then 
yum install $package -y &>> $LOG_FILE # install the packege
VALLIDATE $? "Installation of $package is" #validate
else
echo -e "$package is already installed...$Y SKIPPING $N"
fi
done