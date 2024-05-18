#!/bin/bash


##########################################################################
# Author : Angana Bose
# Date   : 18-05-2024
# Challenge name : BashBlaze-7-Days-of-Bash-Scripting-Challenge
# Forked from : prajwalpd7/BashBlaze-7-Days-of-Bash-Scripting-Challenge
# DAY-02 Challenge
###########################################################################

: '
Challenge Description
The script will have two main parts:

Part 1: File and Directory Exploration
Upon execution without any command-line arguments, the script will display a welcome message and list all the files and directories in the current path.
For each file and directory, the script will print its name and size in human-readable format (e.g., KB, MB, GB). This information will be obtained using the ls command with appropriate options.
The list of files and directories will be displayed in a loop until the user decides to exit the explorer.

Part 2: Character Counting
After displaying the file and directory list, the script will prompt the user to enter a line of text.
The script will read the user input until an empty string is entered (i.e., the user presses Enter without any text).
For each line of text entered by the user, the script will count the number of characters in that line.
The character count for each line entered by the user will be displayed.
'
#############################################################################

echo "Welcome to the Interactive File and Directory Explorer!"

while true
do
	# List all files and directories in the current path
	echo -e "\nFiles and Directories in the Current Path:\n"
	ls -slh
	sleep 1
	echo -e "\n"

	# List all files and directories in the current path
	read -p "Enter a line of text (Press Enter without text to exit): " line

	#Checking if the input provided by the user is empty or null
	if [ -z "$line" ]; then
		echo "Exiting the Interactive Explorer. Goodbye!"
        	break
	fi

	#Calculate and print the character count of the input line
	char_count=`echo $line|wc -c`
	echo "Character Count: " $char_count
done


