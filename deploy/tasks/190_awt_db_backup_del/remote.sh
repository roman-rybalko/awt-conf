#!/bin/sh -ex
. ./remote.conf

crontab -l | grep -v awt-db-backup > ct || true
cat ct
crontab ct

rm -vf /root/awt-db-backup.* /etc/logrotate.d/awt-db-backup
