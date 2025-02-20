#!/bin/bash
# cleanup exited docker containers
echo "in the cron job"
EXITED_CONTAINERS=$(docker ps -a | grep Exited | awk '{ print $1 }')
if [ -z "$EXITED_CONTAINERS" ]
then
        echo "No exited containers to clean"
else
        docker rm $EXITED_CONTAINERS
fi

# renew certbot certificate
docker compose -f /home/thornhill523/personal-site-deployment/docker-compose-nginx-certbot.yaml run --rm certbot
docker compose -f /home/thornhill523/personal-site-deployment/docker-compose-nginx-certbot.yaml exec nginx nginx -s reload
