#!/bin/bash
INPUT=$1
OLDIFS=$IFS
IFS=,
echo "script is searching for the file: " + $INPUT
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; } #if the script doesn't exist
while read username password course fullname
do
        echo "$username:$password" | sudo chpasswd; 
done < $INPUT
IFS=$OLDIFS
echo "update user password successfully";
exit 0;
