#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	This will rename all files in a subdirectory called Script_1 to prepend and append the letter X to the file name


#!/usr/local/bin/bash

directory='Script_1'

for file in `ls ./$directory`
	do
		#`mv $file ./X${file}X`
		echo $file
	done


