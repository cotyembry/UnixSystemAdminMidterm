#!/usr/local/bin/bash

#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	This will rename all files in a subdirectory called Script_1 to remove a prepend letter X and also remove an append letter X on the file name

directory='Script_1'

# I will use absolute paths
___dirname=$(pwd)

#for each file
for fileName in ./$directory/*; do
	#1. get the fileName. 2. build the path
	fileName=$(echo $fileName | cut -d '/' -f3)
	fileNameOriginalReference=$fileName
	#I'll assign a (hopefully) unique delimeter
	fileName="|&|${fileName}|&|"


	# originalFileName=$(echo $fileName | grep -o ) #-o means return only the matched text

	___dirname=$(pwd)

	#right now fileName has a space in front of it and behind it
	
	#now a little string manipulation needs to happen
	# $fileName=$(echo $fileName | tr "/" " ")

	fileName=$(echo $fileName | tr -s "|&|X" " ") #use my delimeter I defined earlier and remove the X that is appended and prepended
	
	fileName=$(echo $fileName | tr -s "/ " "/") #...
	#now build the absolute path to the new file
	newFileNameWithPath=$___dirname/${directory}/$fileName #this string still needs to be translated

	#this is now using my delimeter I chose to cut the X away from the file name
	newFileNameWithPath=$(echo $newFileNameWithPath | tr -s "|&|X" "/")

	oldFileNameWithPath=$___dirname/${directory}/$fileNameOriginalReference

	mv $oldFileNameWithPath $newFileNameWithPath

done
