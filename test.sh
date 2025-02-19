#!/usr/bin/env bash

echo '0 3  * * *  ~/personal-site-deployment/cron/cron_job.sh' | crontab -
