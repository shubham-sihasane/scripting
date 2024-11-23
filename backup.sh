#!/bin/bash
####################################
#
# Create a backup of source in destination
#
####################################
    
# What to backup. 
backup_files="/home/ec2-user/soure"
    
# Where to backup to.
dest="/home/ec2-user/destination"
    
# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"
    
# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo
    
# Backup the files using tar.
tar czf $dest/$archive_file $backup_files
    
# Print end status message.
echo
echo "Backup finished"
date
    
# Long listing of files in $dest to check file sizes.
ls -lh $dest