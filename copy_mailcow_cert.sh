#!/bin/bash

# Verzeichnisse und Dateinamen

source_dir="/verzeichnis/quellmaschine"

target_ip="IP-Zielmaschine"

target_dir="/ziel/auf/zielmaschine"

cert_target_name="cert.pem"

key_target_name="key.pem"

target_user="dein_benutzername"

# Kopiere und benenne die Dateien auf der Ziel-VM um

echo "Kopiere Dateien zur Ziel-VM..."

scp "${source_dir}/fullchain.pem" "${source_dir}/privkey.pem" "${target_user}@${target_ip}:${target_dir}"

echo "Dateien erfolgreich kopiert."

# Neustart der Container auf der Ziel-VM

echo "Neustart der Container auf der Ziel-VM..."

ssh "${target_user}@${target_ip}" "docker restart \$(docker ps -qaf name=postfix-mailcow) \$(docker ps -qaf name=dovecot-mailcow) \$(docker ps -qaf name=nginx-mailcow)"

echo "Container erfolgreich neugestartet."