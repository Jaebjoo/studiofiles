#This script is used to create/update users from a csv file. If a user does not exist it will create the user and set their password according to the csv file (second column). If a user does exist it will update the user comment field with the latest paper they have taken

#expect csv format: <username>,<password>,<course occurrence>,<fullname>. Username is expected to be lower case, password at time of creation is the students user id number

#Script usage: sudo ./DB2UserImport.sh <csvFile> e.g. sudo ./DB2UserImport.sh DB2Users2019S2.csv
INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read login idNum course fullName
do
        grep -q "$login" /etc/passwd && usermod -c "$fullName, $course" $login || ( useradd -c "$fullName, $course" -d /home/$login -m -U -s /bin/bash $login; echo $login:$idNum | chpasswd;)
		#Search /etc/passwd for login, if found (&&) then update the user details; if not (||) found then add user and set user details, home dir, and shell, set password and then expire it
done < $INPUT
