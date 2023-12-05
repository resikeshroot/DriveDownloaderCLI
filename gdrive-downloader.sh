#!/bin/bash

# Function to check and install gdown if not available
check_install_gdown() {
    if ! command -v gdown &> /dev/null; then
        echo "gdown is not installed. Installing..."
        pip install gdown
        echo "gdown has been installed."
    fi
}

# Function to check and install megatools if not available
check_install_megatools() {
    if ! command -v megals &> /dev/null; then
        echo "megatools is not installed. Please install megatools from https://megatools.megous.com/"
        exit 1
    fi
}

# Function to download from Mega using megatools
download_from_mega() {
    mega_link="$1"
    megadl "$mega_link"
}

# Display the ASCII art poster and information
# (Your ASCII art and information here)

echo "Welcome to the Cloud File Downloader Script!"
echo "--------------------------------------------"
echo "This script helps you download files from Google Drive or Mega."
echo "Please enter the full Google Drive URL or the Mega link to start the download."
echo "--------------------------------------------"

# Check and install necessary tools if not available
check_install_gdown
check_install_megatools

# Create 'downloads' directory if it doesn't exist
downloads_dir="downloads"
mkdir -p "$downloads_dir"

# Function to check if the file already exists
check_file_exists() {
    file="$1"
    if [ -f "$file" ]; then
        echo "File '$file' already exists in this directory."
        exit 1
    fi
}

# Function to download file based on provided URL or ID
download_file() {
    url_or_id="$1"
    if [[ $url_or_id == *"drive.google.com"* ]]; then
        # Download from Google Drive
        file_id=$(extract_file_id_from_url "$url_or_id")
        download_url="https://drive.google.com/uc?id=$file_id"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from Google Drive URL: $url_or_id" >> download_log.txt
        gdown "$download_url" -O "$downloads_dir/file_downloaded.txt"
    elif [[ $url_or_id == *"mega.nz"* ]]; then
        # Download from Mega
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from Mega link: $url_or_id" >> download_log.txt
        download_from_mega "$url_or_id"
    else
        echo "Unsupported link provided."
        exit 1
    fi
}

# Prompt user to enter full Google Drive URL or Mega link
read -p "Enter the full Google Drive URL or Mega link: " input_url

# Call function to download file with provided URL or ID
download_file "$input_url"


