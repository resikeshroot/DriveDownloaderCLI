# DriveDownloaderCLI

## Google Drive File Downloader Script

This script simplifies the process of downloading files from Google Drive via the terminal. It utilizes gdown to swiftly retrieve files based on their unique file IDs.

### Features:

- **Streamlined Downloading:** Enter the file ID, and the script handles the rest, swiftly fetching the file from Google Drive.
- **Check for Existing Files:** Prior to download, the script checks for existing files with the same name to prevent accidental overwriting.
- **Log Download History:** Maintains a log (`download_log.txt`) recording download activities, including timestamps and file IDs.

### Installation:

To use the DriveDownloaderCLI, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/resikeshroot/DriveDownloaderCLI.git
   cd DriveDownloaderCLI
   ./gdrive-downloader.sh
Install gdown:
If you haven't installed gdown, you can install it via pip:

bash

    pip install gdown
Feel free to contribute, report issues, or suggest enhancements!


