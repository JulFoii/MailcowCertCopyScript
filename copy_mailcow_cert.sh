#!/bin/bash

source_dir="/dir/on/sourcevm"

target_ip="target-ip"

target_dir="/dir/on/targetvm/"

cert_target_name="cert.pem"

key_target_name="key.pem"

target_user="target-user"

# copy the files to the target with scp

scp "${source_dir}/fullchain.pem" "${target_user}@${target_ip}:${target_dir}/${cert_target_name}"

scp "${source_dir}/privkey.pem" "${target_user}@${target_ip}:${target_dir}/${key_target_name}"

# restart docker container on target-vm

ssh "${target_user}@${target_ip}" "docker restart \$(docker ps -qaf name=postfix-mailcow) \$(docker ps -qaf name=dovecot-mailcow) \$(docker ps -qaf name=nginx-mailcow)"
