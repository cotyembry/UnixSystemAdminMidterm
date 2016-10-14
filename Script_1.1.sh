#!/usr/local/bin/bash

#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	This will rename all files in a subdirectory called Script_1 to prepend and append the letter X to the file name



directory='Script_1'

# for file in `ls ./$directory` #another - less predictable apparently - way to iterate through files

# I will use absolute paths
for fileName in ./$directory/*; do
	fileName=$(echo $fileName | cut -d "/" -f3)
	# fileName=$(echo $fileName | cut -d "/" -f3)
	___dirname=$(pwd)
	mv $___dirname/${directory}/$fileName $___dirname/${directory}/X${fileName}X
	# cp $fileName 

done

		# echo $fileName
		# echo $file

		# `mv ./$directory/$file ./X${file}X`
		# echo $file
