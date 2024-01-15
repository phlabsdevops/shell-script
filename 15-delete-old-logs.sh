#!/bin/bash
#  this is for comment

SOURCE_DIR="/tmp/shellscript-logs"

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[34m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ] # find /tmp/shellscript-logs directory exists or not
then
echo -e " $R Source Directory: $SOURCE_DIR does not exists. $N "
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +30 -name "*.log")

while IFS= read -r line
do
echo "Deleted file: $line"
rm -rf $line
done <<< $FILES_TO_DELETE
