#!/bin/bash

# Quellverzeichnis auf der ersten Maschine wo die Zertifikate sind
SOURCE_DIR="/pfad/auf/der/Quellmaschine"

# Zielverzeichnis auf der zwiten Maschine, wo die Zertifikate kopiert werden sollen
TARGET_DIR="/pfad/auf/der/Zielmaschine"

# IP-Adresse der Zielmaschine
TARGET_IP="1.1.1.1"

# Liste der zu kopierenden Dateien
FILES=("cert.pem" "chain.pem" "fullchain.pem" "privkey.pem")

# SSH-Verbindung und Kopieren der Dateien

## Beim SCP-Befehl den Benutzer ändern falls erforderlich

BENUTZER="root"

for file in "${FILES[@]}"; do
    scp "$SOURCE_DIR/$file" "$BENUTZER@$TARGET_IP:$TARGET_DIR"
done

# Neustart der relevanten Docker-Container

postfix_c=$(docker ps -qaf name=postfix-mailcow)
dovecot_c=$(docker ps -qaf name=dovecot-mailcow)
nginx_c=$(docker ps -qaf name=nginx-mailcow)

docker restart ${postfix_c} ${dovecot_c} ${nginx_c}
