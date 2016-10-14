#!/usr/local/bin/bash

#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	This will rename all files in a subdirectory called Script_1 to remove a prepend letter X and also remove an append letter X on the file name

directory='Script_1'

regex="file "


# I will use absolute paths

___dirname=$(pwd)
#for each file
for fileName in ./$directory/*; do
	#iterate through each line in the file

	while read lineInFile
	do
    	if [[ $lineInFile =~ $regex ]]; then
    		# echo ${#BASH_REMATCH[*]}
    		echo $lineInFile
    	fi
	done < $fileName
	
	# fileName=$(echo $fileName | cut -d "/" -f3)
	# ___dirname=$(pwd)
	# mv $___dirname/${directory}/$fileName $___dirname/${directory}/X${fileName}X
done
