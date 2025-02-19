
# Phase 2
echo "0 3  * * *  ~/personal-site-deployment/cron/cron_job.sh" | crontab -
docker compose -f ./docker-compose-moondrop.yaml up -d 
docker compose -f ./docker-compose-landscape-patterns.yaml up -d 
docker compose -f ./docker-compose-nginx-certbot.yaml up