#!/bin/bash

#This script is used for the replacement for wc command in linux.
#first will gonna only checking the validation and checking of the CLA passed to the script i.e in our case is input/file.


SCRIPT_NAME=`basename $0`
FILENAME=$1
USAGE="Usage: $SCRIPT_NAME [filename.txt] operation

Example:
        $SCRIPT_NAME /home/devops/filename.txt operation
        
	From above,assume that you have  file in the /home/devops/filename.txt
	
	The First Colunm contain the description,second column contain the filename and the third column is for operation you need to perform, like word line count,word counts.

	For Counting file lines use line_count operation.
	For Counting word count use word_count operation.
"

if [ $# -ne 2 ]; then

echo -e "\nYou must pass one command line argument"
echo  -e "\n$USAGE"
# Check if the parameters are correct
        elif [ $1 = "--help" ];then

        echo "$USAGE"
        exit 12
	
	elif [ $2 = "line_count" ]; then
		#echo "0 For scrip name $0"
		#echo "1 For file name $1"
		#echo "2 For Operaion $2"
		line_count=$(cat -n $1  | awk '{print $1}' | tail -1)
		echo "The no of lines in $1 are $line_count"
	elif [ $2 = "word_count" ]; then
		declare -i cnt=0
		while read -r line || [ -n "$line" ]; do        # read line from file
			tmp=( $line )                               # create tmp array of words
			 cnt=$((cnt + ${#tmp[@]}))                   # add no. of words to count
		done <"$1"
		printf "\n %s words in %s\n\n" "$cnt" "$1"     # show results
fi



