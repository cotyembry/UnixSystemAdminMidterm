#!/usr/local/bin/bash

#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	Write an interactive shell script that will prompt for a search string, and then identify any files in the subdirectory Script_2 that contains the specified string.

directory='Script_2'

# echo "Enter a string to be searched for: " 
# read searchString


# I will use absolute paths

___dirname=$(pwd)
#for each file
for fileName in ./$directory/*; do
	#iterate through each line in the file

	fileName=$(echo $fileName | cut -d '/' -f3)

	___dirname=$(pwd)
	absolutePathToFile=$___dirname/${directory}/$fileName


	while read p; do
    	echo $p
	done < ./Script_2/test1.txt

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
done
