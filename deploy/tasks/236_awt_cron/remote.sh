#!/bin/sh -ex
. ./remote.conf

crontab -u www-data -l | grep -v /var/www/awt > ct || true
echo '* * * * * cd /var/www/awt && php cron.php' >> ct
cat ct
crontab -u www-data ct
