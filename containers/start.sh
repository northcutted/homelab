#!/usr/bin/env bash

# Ordered List of compose files
declare -a COMPOSE_FILES=(
    'traefik/docker-compose.yml',
    'openvpn-as/docker-compose.yml',
    'organizr/docker-compose.yml',
    'downloader/docker-compose.yml',
    'monitoring/docker-compose.yml'
)

## now loop through the above array
for file in "${COMPOSE_FILES[@]}"
do
    cmd="docker-compose -f $file"
    $cmd down
    $cmd pull
    $cmd up -d
done

