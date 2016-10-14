#!/usr/local/bin/bash

#Author:	John Coty Embry
#Date:		10-12-2016
#Class: 	Unix System Administration
#Program Comment:	Write an alias that will cancel all print requests associated with your username by typing cancel_print

#to make this alias permanent on every load of the terminal you can place the code in the
#~/.bash_profile file or in the .bash_rc file that gets created - whereever that is located..
#I always use the ~/.bash_profile file

#the second cut command is using j as a delimter and I say it is safe to do this because
#I'm trying to simply get the first field, so I can confidently assume nothing will go wrong
alias cancel_print='cancel `lpstat | cut -d "-" -f2 | cut -d "j" -f1`'

