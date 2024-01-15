#!/bin/bash
#  this is for comment

FILE="/etc/passwd"

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[34m"
N="\e[0m"

if [ ! -f $FILE ]
then
echo -e " $R Source Directory: $FILE does not exists. $N "
fi

while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path 
do
echo "USERNAME: $username"
echo "USER ID: $user_id"
echo "USER FULLNAME: $user_fullname"
done <<< $FILE