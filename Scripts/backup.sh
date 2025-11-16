#!/bin/bash
# -----------------------------------------------
# Script Name : backup.sh
# Purpose     : Create a backup of a directory
# Author      : Abhay Kumar
# Date        : 2025-11-16
# -----------------------------------------------

# Ask user for directory to back up
echo "Enter the directory you want to back up:"
read SOURCE_DIR

# Folder where backups will be stored
BACKUP_FOLDER="$HOME/backups"

# Create backup folder if it doesn't exist
mkdir -p "$BACKUP_FOLDER"

# Create a timestamp for the backup name
TIME_NOW=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup name like: backup_2025-11-16_11-22-30
BACKUP_NAME="backup_$TIME_NOW"

# Full backup path
DESTINATION="$BACKUP_FOLDER/$BACKUP_NAME"

# Copy files
cp -r "$SOURCE_DIR" "$DESTINATION"

echo "Backup completed!"
echo "Stored at: $DESTINATION"
