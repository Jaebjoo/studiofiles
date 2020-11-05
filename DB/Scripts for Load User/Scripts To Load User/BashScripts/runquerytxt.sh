#!/bin/bash
INPUT=$1
echo "script is serching for the target file" $INPUT
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; } #if the script doesn't exist
	# login to mysql using it account and run the query from the input txt file
	mysql -u itintern -p < $INPUT

echo "inserted all query from the file" $INPUT 


