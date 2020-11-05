#!/bin/bash
INPUT=$1
OLDIFS=$IFS
IFS=,
echo "script is searching for the file: " + $INPUT
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; } #if the script doesn't exist
while read username password course fullname
do
	sudo grep -q "$username" /etc/passwd && usermod -c "$fullName, $course" $username || ( sudo useradd -c "$fullName, $course" -d /home/$username -m -U -s /bin/bash $username; echo $username:$password | chpasswd; chage -d 0 $username; )
done < $INPUT
IFS=$OLDIFS
echo "Users added successfully";
exit 0;
