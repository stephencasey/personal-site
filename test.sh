#!/usr/bin/env bash

(crontab -l 2>/dev/null; echo '0 3  * * *  ~/personal-site-deployment/cron/cron_job.sh') | crontab -
