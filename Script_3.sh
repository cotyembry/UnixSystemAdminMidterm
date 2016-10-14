#!/usr/local/bin/bash

#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	Write a script that will use a while loop to read the contents of a file active_cs.txt and process as follows:

#Note: Do not alter the logic… I am intentionally requiring the nested if-else statement.
#As much as I could I tried not to.. I left the
#
#	if
#		if
#
#		else
#
#	nested if else in the code, but added while loops and for loops around and within some of them
#

#I created a file called inputRecord.txt and put majors names in it then added a random
#string in the file to handle it and branch when encountering it



personExists=0
personsFullName=''
echo 0 > ./_tmpIsNonMajor.txt
echo '' > ./_tmpPersonsFullName.txt


#iterate through each name in the list/file called inputRecord.txt

#$line will be the persons username in this case in the state that inputRecord.txt is in currently
(while read line; do
	#iterate through each of the majors in /home/STUDENTS/majors/* and see if they are there
	for userDirectory in /home/STUDENTS/majors/*; do
		builtString=$(echo $userDirectory | cut -d '/' -f5)
		#echo "comparing $builtString with $line"
		if [ "$builtString" == "$line" ]; then
			personExists=1
			#otherwise do nothing
		fi
	done	

	#If the username in first field of the input record does not exist in /home/STUDENTS/majors

	#1 outer if

	if (( $personExists == 0 )); then
		#if here, then the person didn't exist	in /home/STUDENTS/majors
		#echo $builtString
		
		#if the username exists in /home/STUDENTS/nonmajors
		
		#to find this out, I will iterate through each of the majors in
		#/home/STUDENTS/nonmajors/* and see if they are there
	
		echo 0 > ./_tmpCheckFlag.txt

		for userDirectory in /home/STUDENTS/nonmajors/*; do

			#builtString is the person's username
			builtString=$(echo $userDirectory | cut -d '/' -f5)


			if [ "$builtString" == "$line" ]; then
				#if here, then the person exists in /home/STUDENTS/nonmajors
				#now I need to get their full name

				personExists=1
				#go get their full name

				(
				while read etcLine; do
					#pull the username out of /etc/passwd to be able to compare to
					username=$(echo $etcLine | cut -d ':' -f1)

					if [ "$username" == "$builtString" ]; then
						#if here I can finally get the person's full name
						personsFullName=$(echo $etcLine | cut -d ':' -f5 | cut -d '+' -f1)
				
						#since I can't modify this `isNonMajor` global variable, I will
						#write the data to a file and access it later...

						#isNonMajor=1

						echo '1' > ./_tmpIsNonMajor.txt
						echo $personExists > ./_tmpPersonExists.txt
						echo $personsFullName > ./_tmpPersonsFullName.txt
						echo 1 > ./_tmpCheckFlag.txt
					fi
				done
				) < /etc/passwd

				personExists=0
	
			else
				#if in the past iterations it changed the value of _tmpCheckFlag.txt then that tells me it hasn't been found yet
				if (( "$(cat ./_tmpCheckFlag.txt)" == 0 )); then
					#i.e. if here then the person still hasn't been located so far in the iteration
					echo "$line" > ./_tmpCheckFlagLineName.txt
				else
					echo "" > ./_tmpCheckFlagLineName.txt
				fi
			fi
		done

		#2 nested if else statements

		#if the username exists in /home/STUDENTS/nonmajors
		if (( "$(cat ./_tmpPersonExists.txt)" == 1 && "$(cat ./_tmpCheckFlag.txt)" == 1 )); then
			#display message “CS MAJOR fullname is in nonmajor”
			echo "CS MAJOR $(cat ./_tmpPersonsFullName.txt) is in nonmajor"	
		else
			#otherwise
			#display message “NO ACCOUNT FOUND – current record read
			echo "NO ACCOUNT FOUND - $(cat _tmpCheckFlagLineName.txt)"
		fi

	fi

	#make sure to reset my flags for the next iteration
	personExists=0
	isNonMajor=0
done) < inputRecord.txt

	#discard files that I created with this script to help me
	rm ./_tmpCheckFlag.txt
	rm ./_tmpCheckFlagLineName.txt
	rm ./_tmpIsNonMajor.txt
	rm ./_tmpPersonExists.txt
	rm ./_tmpPersonsFullName.txt

