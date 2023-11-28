# DriveDownloaderCLI
# Google Drive File Downloader Script

This script simplifies the process of downloading files from Google Drive via the terminal. It utilizes gdown to swiftly retrieve files based on their unique file IDs.

## Features:

- **Streamlined Downloading:** Enter the file ID, and the script handles the rest, swiftly fetching the file from Google Drive.
- **Check for Existing Files:** Prior to download, the script checks for existing files with the same name to prevent accidental overwriting.
- **Log Download History:** Maintains a log (`download_log.txt`) recording download activities, including timestamps and file IDs.

## Instructions:

1. **Run the Script:** Execute the script and follow the prompts to enter the file ID for download.
2. **File Naming:** Adjust the `filename` variable to specify the desired name for the downloaded file.

## Usage:

- Run the script and enter the file ID when prompted.
- The downloaded file will be saved with the specified filename in the directory where the script is executed.

## Notes:

- Ensure `gdown` is installed. If not, the script automatically installs it to facilitate the download process.
# gdown

`gdown` is a Python utility that facilitates easy downloading from Google Drive via command-line interface.

## Installation

To install `gdown`, use the following command:

```bash
pip install gdown

