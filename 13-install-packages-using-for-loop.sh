#!/bin/bash
#  this is for comment
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[34m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"
echo "Script started executing"
VALLIDATE(){
    if[ $1 -ne 0 ]
    then       
    echo -e "$R ERROR:$N $2 $R FAILED $N"
    exit 1
    else
    echo -e "$G $2 SUCCESS $N"
}
if [ $ID -ne 0 ]
then
echo -e "$R Please run the script with root user $N"
exit 1
else
echo -e "$G You are root user $N"
fi
for package in $@
do 
yum list installed $package 
if[ $? -ne 0 ]
then 
yum install $package -y
VALLIDATE $? "Installation of $package is"
else
echo -e "$package is already installed...$Y SKIPPING $N"
fi
done