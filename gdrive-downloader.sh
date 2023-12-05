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
    if ! command -v megadl &> /dev/null; then
        echo "megatools is not installed. Please install it first."
        exit 1
    fi
}

# Function to check and install onedrive-dl if not available
check_install_onedrive_dl() {
    if ! command -v onedrive-dl &> /dev/null; then
        echo "onedrive-dl is not installed. Installing..."
        pip install onedrive-dl
        echo "onedrive-dl has been installed."
    fi
}

# Display the ASCII art poster and information
echo "+-------------------------------------------------+"
echo "|               _                                 |"
echo "|              /  \                               |"
echo "|             /|oo \     Multi-Cloud Downloader   |"
echo "|            (_|  /_)                             |"
echo "|             _\`@/_ \       By Your Name          |"
echo "|            |  =  | \   \\                       |"
echo "|            |  =  |  \   ))    Your Location    |"
echo "|   ______   |_____| /  \//                       |"
echo "|  / FIDO \   _//|| _\   /   FidoNet 1:617/1337   |"
echo "| (________) (_/(_|(____/                         |"
echo "|                  (Your Initials)                |"
echo "+-------------------------------------------------+"
echo "Welcome to the Multi-Cloud File Downloader Script!"
echo "--------------------------------------"
echo "This script helps you download files from Google Drive, Mega, OneDrive, Dropbox, or TeraBox."
echo "Please enter the full URL or the file ID to start the download."
echo "--------------------------------------"

# Check and install gdown if not available
check_install_gdown

# Check and install megatools if not available
check_install_megatools

# Check and install onedrive-dl if not available
check_install_onedrive_dl

# Function to download file from Google Drive
download_from_drive() {
    url_or_id="$1"
    if [[ $url_or_id == *"drive.google.com"* ]]; then
        file_id=$(echo "$url_or_id" | grep -oP '[-\w]{25,}' | head -1)
        download_url="https://drive.google.com/uc?id=$file_id"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from Google Drive URL: $url_or_id" >> download_log.txt
        gdown "$download_url"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file with Google Drive ID: $url_or_id" >> download_log.txt
        gdown "$url_or_id"
    fi
}

# Function to download file from Mega
download_from_mega() {
    mega_url="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from Mega URL: $mega_url" >> download_log.txt
    megadl "$mega_url"
}

# Function to download file from OneDrive
download_from_onedrive() {
    onedrive_url="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from OneDrive URL: $onedrive_url" >> download_log.txt
    onedrive-dl "$onedrive_url"
}

# Function to download file from Dropbox
download_from_dropbox() {
    dropbox_url="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from Dropbox URL: $dropbox_url" >> download_log.txt
    wget "$dropbox_url"
}

# Function to download file from TeraBox
download_from_terabox() {
    terabox_url="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Downloading file from TeraBox URL: $terabox_url" >> download_log.txt
    wget "$terabox_url"
}

# Prompt user to enter full URL from supported platforms
read -p "Enter the full URL from Google Drive, Mega, OneDrive, Dropbox, or TeraBox: " input_url

# Check if the input is a Google Drive, Mega, OneDrive, Dropbox, or TeraBox URL
if [[ $input_url == *"drive.google.com"* ]]; then
    # Download from Google Drive
    download_from_drive "$input_url"
elif [[ $input_url == *"mega.nz"* ]]; then
    # Download from Mega
    download_from_mega "$input_url"
elif [[ $input_url == *"1drv.ms"* ]]; then
    # Download from OneDrive
    download_from_onedrive "$input_url"
elif [[ $input_url == *"dropbox.com"* ]]; then
    # Download from Dropbox
    download_from_dropbox "$input_url"
elif [[ $input_url == *"terabox.com"* ]]; then
    # Download from TeraBox
    download_from_terabox "$input_url"
else
    echo "Invalid URL. Please provide a valid URL from Google Drive, Mega, OneDrive, Dropbox, or TeraBox."
    exit 1
fi

