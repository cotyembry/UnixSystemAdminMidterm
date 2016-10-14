#!/usr/local/bin/bash

#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	Write a script that will use a while loop to read the contents of a file active_cs.txt and process as follows:

#Note: Do not alter the logic… I am intentionally requiring the nested if-else statement.


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
	if (( $personExists == 0 )); then
		#if here, then the person didn't exist	in /home/STUDENTS/majors
		#echo $builtString
		
		#if the username exists in /home/STUDENTS/nonmajors
		
		#to find this out, I will iterate through each of the majors in
		#/home/STUDENTS/nonmajors/* and see if they are there

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
						echo $personsFullName > ./_tmpPersonsFullName.txt											
					fi
				done
				) < /etc/passwd

#				echo "before final if 

				if (($(cat ./_tmpIsNonMajor.txt) == 1)); then
					echo "CS MAJOR $(cat ./_tmpPersonsFullName.txt) is in nonmajor"
				else
					echo "NO ACCOUNT FOUND $line"
				fi
				#otherwise do nothing
			fi
		
			echo '0' > ./_tmpIsNonMajor.txt
			echo '' > ./_tmpPersonsFullName.txt	

		done

		#echo "out of for loop $personsFullName"

		if (( $personExists == 1 )); then
			#if here then they do exist in /home/STUDENTS/nonmajors
			#display message “CS MAJOR fullname is in nonmajor”
			echo "in $personExists == 1"
		fi

			
		#otherwise
			#display message “NO ACCOUNT FOUND – current record read
	fi

	#make sure to reset my flags for the next iteration
	personExists=0
	isNonMajor=0
done) < inputRecord.txt

	#discard files that I created with this script
	rm ./_tmpIsNonMajor.txt
	rm ./_tmpPersonsFullName.txt	
