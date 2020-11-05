#!/bin/bash
INPUT=$1
OLDIFS=$IFS
IFS=,
echo "script is searching for the file: " + $INPUT
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; } #if the script doesn't exist
while read username password course fullname
do
        sudo userdel -r $username;
done < $INPUT
IFS=$OLDIFS
echo "Users deleted successfully";
exit 0;
