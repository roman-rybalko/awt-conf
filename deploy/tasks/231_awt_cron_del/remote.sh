#!/bin/sh -ex
. ./remote.conf

crontab -u www-data -l | grep -v cron.php > ct || true
cat ct
crontab -u www-data ct
