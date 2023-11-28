#!/bin/bash

# Quellverzeichnis auf der ersten Maschine

SOURCE_DIR="/pfad/quellverzeichnis"

# Zielverzeichnis auf der zweiten Maschine

TARGET_DIR="/pfad/zielmaschine"

# IP-Adresse der Zielmaschine

TARGET_IP="IP_DER_ZIELMASCHINE"

# Liste der zu kopierenden Dateien

FILES=("cert.pem" "chain.pem" "fullchain.pem" "privkey.pem")

# SSH-Verbindung und Kopieren der Dateien

## Beim SCP-Befehl den Benutzer ändern falls erforderlich

USER="BENUTZER_DER_ZIELMASCHINE"

# SSH-Passwort

PASSWORD="DEIN_PASSWORT"

echo Kopiere Dateien zur Zielmaschine in das angegebene Verzeichnis....

# Kopieren der Dateien mit sshpass

for file in "${FILES[@]}"; do
    sshpass -p "$PASSWORD" scp "$SOURCE_DIR/$file" "$USER@$TARGET_IP:$TARGET_DIR"
done

echo Kopieren der Dateien DONE ✓

# Neustart der relevanten Docker-Container auf der Zielmaschine

echo Starte Docker-Container neu.....

sshpass -p "$PASSWORD" ssh "$USER@$TARGET_IP" "docker restart \$(docker ps -qaf name=postfix-mailcow) \$(docker ps -qaf name=dovecot-mailcow) \$(docker ps -qaf name=nginx-mailcow)"

echo Neustart von Docker-Containern DONE ✓