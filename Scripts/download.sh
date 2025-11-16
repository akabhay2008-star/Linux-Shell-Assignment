#!/bin/bash
# ---------------------------------------------------------
# Script Name : download.sh
# Purpose     : Download a file using wget or curl
# Author      : Abhay Kumar
# Date        : 2025-11-16
# ---------------------------------------------------------

# Ask user for URL
echo "Enter the file URL to download:"
read URL

# Default download folder
DOWNLOADS="$HOME/my_downloads"

# Create folder if needed
mkdir -p "$DOWNLOADS"

# Extract filename from URL
FILE_NAME=$(basename "$URL")

# Full destination path
DEST="$DOWNLOADS/$FILE_NAME"

# If wget exists, use it
if command -v wget >/dev/null; then
    wget -O "$DEST" "$URL"

# Else use curl
elif command -v curl >/dev/null; then
    curl -L -o "$DEST" "$URL"

# If neither tool exists
else
    echo "Error: wget or curl not found!"
    exit 1
fi

echo "Download completed!"
echo "Saved to: $DEST"
