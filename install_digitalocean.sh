#!/bin/bash

# Install docker compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# Open firewall
ufw allow 80
ufw allow 443

# Install certbot
docker compose -f ./docker-compose-initiate.yml up -d nginx
docker compose -f ./docker-compose-initiate.yml up certbot
docker compose -f ./docker-compose-initiate.yml down

# some configurations for let's encrypt
curl -L --create-dirs -o nginx-certbot/etc/letsencrypt/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
openssl dhparam -out nginx-certbot/etc/letsencrypt/ssl-dhparams.pem 2048

# Phase 2
docker compose -f ./docker-compose-moondrop.yaml up -d 
docker compose -f ./docker-compose-landscape-patterns.yaml up -d 
docker compose -f ./docker-compose-nginx-certbot.yaml up