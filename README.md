## Installation - Nutzen des Skripts

# 1. SSH-Passwort-Abfrage installieren

    sudo apt install sshpass

# 2. Skript herunterladen

    wget https://raw.githubusercontent.com/JulFoii/MailcowCertCopyScript/main/Mailcow_Zertifikate_Kopieren.sh

# 3. Variablen in der Datei anpassen

    Öffne die Datei mit einem Texteditor (z.B., nano Mailcow_Zertifikate_Kopieren.sh)
    Passe die Variablen entsprechend deiner Konfiguration an
    Speichere und schließe die Datei

# 4. Skript ausführbar machen

    chmod +x Mailcow_Zertifikate_Kopieren.sh

# 5. Skript ausführen

    ./Mailcow_Zertifikate_Kopieren.sh

## Cronjob einrichten, um das Skript automatisch auszuführen

Füge die folgende Zeile zur Crontab hinzu
Öffne die Crontab mit dem Befehl:

    crontab -e

Füge die Zeile ein, speichere und schließe die Datei

    0 1 1,3,5,7,9,11 * * bash /pfad/zum/skript/Mailcow_Zertifikate_Kopieren.sh >/dev/null 2>&1
