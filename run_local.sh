#!/bin/bash

docker compose -f ./docker-compose-moondrop.yaml up -d 
docker compose -f ./docker-compose-landscape-patterns.yaml up -d 
docker compose -f ./docker-compose-local.yaml up