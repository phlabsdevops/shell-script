#!/bin/bash
#  this is for comment

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""
while IFS= read -r line
do 
usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
partition=$(echo $line | awk '{print $1F}')
if [ $usage -ge $DISK_THRESHOLD ]
then
message+="High disk usage on $partition: $usage\n"
fi

done <<< $DISK_USAGE

echo -e "Message: $message"

 #echo "$message" | mail -s "High Disk Usage" harinathbeeram1999@gmail.com
sh 19-mail.sh "DevOps Team" "High Disk Usage" "$message" "harinathbeeram1999@gmail.com" "Alert High Disk Usage"