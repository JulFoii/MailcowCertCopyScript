## Installation

# 1. Install sshpass

    sudo apt install sshpass

# 2. Download Script

    wget https://raw.githubusercontent.com/JulFoii/MailcowCertCopyScript/main/Mailcow_Zertifikate_Kopieren.sh

# 3. Customize variables in the file

    Open the file with a text editor (nano Mailcow_Zertifikate_Kopieren.sh)
    Adjust the variables according to your configuration
    Save and Close the file

# 4. Make the script executable

    chmod +x Mailcow_Zertifikate_Kopieren.sh

# 5. Execute the script

    ./Mailcow_Zertifikate_Kopieren.sh

## Set up a cronjob to run the script automatically

Add the following line to the crontab
Open the crontab with the command:

    crontab -e

Insert the line, save and close the file

    0 1 1,3,5,7,9,11 * * bash /pfad/zum/skript/Mailcow_Zertifikate_Kopieren.sh >/dev/null 2>&1
