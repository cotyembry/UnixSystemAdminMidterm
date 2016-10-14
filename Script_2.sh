#!/usr/local/bin/bash

#Author:		John Coty Embry
#Date:		10-12-2016
#Class: 		Unix System Administration
#Program Comment:	Write an interactive shell script that will prompt for a search string, and then identify any files in the subdirectory Script_2 that contains the specified string.

directory='Script_2'

echo "Enter a string to be searched for: " 
read searchString

#for formatting to the user
echo "-------"

wasFoundFlag="0"
fileNamesStringWasFoundIn=''
# I will use absolute paths

___dirname=$(pwd)
#for each file
for fileName in ./$directory/*; do
	#iterate through each line in the file

	fileName=$(echo $fileName | cut -d '/' -f3)

	___dirname=$(pwd)
	absolutePathToFile=$___dirname/${directory}/$fileName


	result=$(pwd)

	fileString=$(cat $absolutePathToFile)

	if [[ $fileString =~ $searchString ]]; then
		
		#echo $fileName
		#this if else is for formatting
		if [[ "$wasFound" -eq "0" ]]; then
			fileNamesStringWasFoundIn=$fileName
		else
			fileNamesStringWasFoundIn="$fileNamesStringWasFoundIn, $fileName"
		fi

		wasFound="1"
	fi


done


	echo "Your string was found in the following files: $fileNamesStringWasFoundIn"
	#while read p; do
    #	echo $p
	#done < ${result}/${dirname}/test1.txt

	# the following method would work for files in the subdirectory 'Script_1', but when
	# I tried to do it with files in subdirectory 'Script_2' it wouldn't iterate through
	# each line in the file, so I decided to use the `cat` command instead

	# while read lineInFile; do
	# 	echo $lineInFile
	# done < $absolutePathToFile


	# while read lineInFile
	# do
 #    	# if [[ $lineInFile =~ $searchString ]]; then
 #    	# 	# echo ${#BASH_REMATCH[*]}
 #    	# 	echo $searchString
 #    	# fi
 #    	echo $lineInFile
	# done < $fileName

	
	# fileName=$(echo $fileName | cut -d "/" -f3)
	# ___dirname=$(pwd)
	# mv $___dirname/${directory}/$fileName $___dirname/${directory}/X${fileName}X
