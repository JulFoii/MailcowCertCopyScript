## Installation

# 1. Download Script

    wget https://raw.githubusercontent.com/JulFoii/MailcowCertCopyScript/main/copy_mailcow_cert.sh

# 2. Customize variables in the file

    Open the file with a text editor (nano copy_mailcow_cert.sh)
    Adjust the variables according to your configuration
    Save and Close the file

# 3. Make the script executable

    chmod +x copy_mailcow_cert.sh

# 4. Execute the script

    ./copy_mailcow_cert.sh

## Set up a cronjob to run the script automatically

Add the following line to the crontab
Open the crontab with the command:

    crontab -e

Insert the line, save and close the file

    0 1 * */2 * /path/to/script/copy_mailcow_cert.sh

The script is executed with the crontab entry on the first day of every second month

You can customize the cronjob to your liking
