#!/bin/bash

#Run this script to load DB3 users to the server

INPUT=$1
OLDIFS=$IFS
IFS=,

echo "Script is search for file : " + $INPUT

#If file not found, echo response and exit code 99
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

#Create docker group
sudo groupadd docker

#Read in file into variables
while read username password course fullname
do
        sudo grep -q "$username" /etc/passwd && usermod -c "$fullName, $course" $username || ( sudo useradd -c "$fullName, $course" -d /home/$username -m -U -s /bin/bash $username;
        echo $username:$password | sudo chpasswd; sudo chage -d 0 $username; )

        #Add users to Docker group
        sudo usermod -aG docker $username

done < $INPUT

IFS=$OLDIFS
echo "Users added successfully"
exit 0;
