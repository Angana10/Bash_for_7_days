#!/bin/bash

###########################################################################
# Author : Angana Bose
# Date   : 20-05-2024
# Challenge name : BashBlaze-7-Days-of-Bash-Scripting-Challenge
# Forked from : prajwalpd7/BashBlaze-7-Days-of-Bash-Scripting-Challenge
# DAY-02 Challenge-2
# To run : ./file_day2_backup_with_rotation.sh arg1 arg2
###########################################################################

: '
Our task is to create a bash script that takes a directory path as a command-line argument and performs a backup of the directory. The script should create timestamped backup folders and copy all the files from the specified directory into the backup folder.

Additionally, the script should implement a rotation mechanism to keep only the last 3 backups. This means that if there are more than 3 backup folders, the oldest backup folders should be removed to ensure only the most recent backups are retained.

'

############################################################################

#Enter the source directory to backup
source_dir="$1"

#Enter the destination directory to store the backup
dest_dir="$2"

#Creating a backup folder if it does not exist.
mkdir -p "${dest_dir}/backup_folder"

#Creating timesatamp
timestamp=$(date +%T)

#Creating a backup file with timestamp appended to it
backup_file="backup_${timestamp}.tar.gz"

#Creating backup

#Checking whether number of arguments provided is correct
if [ $# -eq 2 ]
then
	tar -czvf "${dest_dir}/backup_folder/${backup_file}" "${source_dir}"
else
	echo "Arguments not sufficient. Hence, exiting ......"
	exit 1
fi

if [ $? -eq 0 ]
then
	echo "Backup created successfully in : ${dest_dir}/backup_folder"
else
	echo "Backup failed"
	exit 1
fi

#Implementing rotation mechanism
path="${dest_dir}/backup_folder"
cd $path
count=$(find . -type f -name "backup*" | wc -l)
echo "Backup count: " $count
read -p "Enter the number of backups you want to retain: " num_backup_to_retain
num_backups_to_remove=$((count - num_backup_to_retain))
echo $num_backups_to_remove
if [ $num_backups_to_remove -gt 0 ] 
then
	old_backup=$(ls | sort | head -n $num_backups_to_remove)
	echo " Old backups: " $old_backup
	for file in $old_backup
	do
		rm "$path/$file"
	done
fi

