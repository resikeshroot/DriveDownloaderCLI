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
echo "|             _\`@/_ \       By Your Name          |"
echo "|            |  =  | \   \\                       |"
echo "|            |  =  |  \   ))    Your Location    |"
echo "|   ______   |_____| /  \//                       |"
echo "|  / FIDO \   _//|| _\   /   FidoNet 1:617/1337   |"
echo "| (________) (_/(_|(____/                         |"
echo "|                  (Your Initials)                |"
echo "+-------------------------------------------------+"
echo "Welcome to the Google Drive File Downloader Script!"
echo "--------------------------------------"
echo "This script helps you download files from Google Drive."
echo "Please enter the full Google Drive URL or the file ID to start the download."
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

# Function to extract file ID from full URL
extract_file_id_from_url() {
    full_url="$1"
    if [[ $full_url == *"drive.google.com"* ]]; then
        file_id=$(echo "$full_url" | grep -oP '[-\w]{25,}' | head -1)
        echo "$file_id"
    else
        echo "Invalid Google Drive URL."
        exit 1
    fi
}

# Function to download file based on provided URL or ID
download_file() {
    url_or_id="$1"
    if [[ $url_or_id == *"drive.google.com"* ]]; then
        file_id=$(extract_file_id_from_url "$url_or_id")
        download_url="https://drive.google.com/uc?id=$file_id"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from URL: $url_or_id" >> download_log.txt
        gdown "$download_url"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file with ID: $url_or_id" >> download_log.txt
        gdown "$url_or_id"
    fi
}

# Prompt user to enter full Google Drive URL or file ID
read -p "Enter the full Google Drive URL or the file ID: " input_id_or_url

# Call function to download file with provided URL or ID
download_file "$input_id_or_url"

