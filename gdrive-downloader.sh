#!/bin/bash

# Function to check and install gdown if not available
check_install_gdown() {
    if ! command -v gdown &> /dev/null; then
        echo "gdown is not installed. Installing..."
        pip install gdown
        echo "gdown has been installed."
    fi
}

# Function to grant execute permission to gdrive-downloader.sh
grant_execute_permission() {
    chmod +x gdrive-downloader.sh
}

# Check if gdrive-downloader.sh exists and grant execute permission if needed
if [ -f "gdrive-downloader.sh" ]; then
    echo "Found gdrive-downloader.sh"
    grant_execute_permission
    echo "Execute permission granted to gdrive-downloader.sh"
else
    echo "gdrive-downloader.sh not found"
fi

# Display the ASCII art poster and information
echo "+-------------------------------------------------+"
echo "|               _                                 |"
echo "|              /  \                               |"
echo "|             /|oo \     Google Drive Downloader  |"
echo "|            (_|  /_)                             |"
echo "|             _\`@/_ \       By Resikesh M R      |"
echo "|            |     | \   \\                       |"
echo "|            | (*) |  \   ))    India            |"
echo "|   ______   |__U__| /  \//                       |"
echo "|  / FIDO \   _//|| _\   /   FidoNet 1:617/1337   |"
echo "| (________) (_/(_|(____/                         |"
echo "|                  (jm)                           |"
echo "+-------------------------------------------------+"
echo "Welcome to the Google Drive File Downloader Script!"
echo "--------------------------------------"
echo "This script helps you download files from Google Drive."
echo "Please enter the file ID to start the download."
echo "--------------------------------------"

# Check and install gdown if not available
check_install_gdown

# Function to check if the file already exists
check_file_exists() {
    file="$1"
    if [ -f "$file" ]; then
        echo "File '$file' already exists in this directory."
        exit 1
    fi
}

# Function to download file based on provided ID
download_file() {
    file_id="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file with ID: $file_id" >> download_log.txt
    gdown "$file_id"
}

# Prompt user to enter file ID
read -p "Enter the file ID you want to download: " file_id

# Define the filename based on the file ID (change 'filename' to your desired name)
filename="file_downloaded.txt"

# Check if the file already exists
check_file_exists "$filename"

# Call function to download file with provided ID
download_file "$file_id"



# Call function to download file with provided ID
download_file "$file_id"
