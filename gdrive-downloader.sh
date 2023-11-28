#!/bin/bash

# Function to check and install gdown if not available
check_install_gdown() {
    if ! command -v gdown &> /dev/null; then
        echo "gdown is not installed. Installing..."
        pip install gdown
        echo "gdown has been installed."
    fi
}

# Display the ASCII art poster and information
echo "+-------------------------------------------------+"
echo "|               _                                 |"
echo "|              /  \                               |"
echo "|             /|oo \     Google Drive Downloader  |"
echo "|            (_|  /_)                             |"
echo "|             _\`@/_ \       By Resikesh M R      |"
echo "|            |  =  | \   \\                       |"
echo "|            |  =  |  \   ))    India            |"
echo "|   ______   |_____| /  \//                       |"
echo "|  / FIDO \   _//|| _\   /   FidoNet 1:617/1337   |"
echo "| (________) (_/(_|(____/                         |"
echo "|                  (jm)                           |"
echo "+-------------------------------------------------+"
echo "Welcome to the Google Drive File Downloader Script!"
echo "--------------------------------------"
echo "This script helps you download files from Google Drive."
echo "Please enter the full Google Drive URL to start the download."
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

# Function to extract file ID from URL
extract_file_id() {
    full_url="$1"
    file_id=$(echo "$full_url" | awk -F'/' '/\/d\//{print $NF}')
    echo "$file_id"
}

# Function to download file based on provided ID
download_file() {
    file_id="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file with ID: $file_id" >> download_log.txt
    gdown "https://drive.google.com/uc?id=$file_id"
}

# Prompt user to enter full Google Drive URL
read -p "Enter the full Google Drive URL of the file you want to download: " full_url

# Extract file ID from URL
file_id=$(extract_file_id "$full_url")

# Define the filename based on the file ID (change 'filename' to your desired name)
filename="file_downloaded.txt"

# Check if the file already exists
check_file_exists "$filename"

# Call function to download file with extracted ID
download_file "$file_id"
