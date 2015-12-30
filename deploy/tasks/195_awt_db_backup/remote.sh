#!/bin/sh -ex
. ./remote.conf

mv -vf awt-db-backup.sh /root/
chown -v root:root /root/awt-db-backup.sh

mv -vf awt-db-backup /etc/logrotate.d/
chown -v root:root /etc/logrotate.d/awt-db-backup
chmod -v 0444 /etc/logrotate.d/awt-db-backup

mkdir -vp /var/backups/awt
chmod -v 0710 /var/backups/awt

crontab -l | grep -v awt-db-backup > ct || true
grep PATH ct || echo 'PATH=/bin:/sbin:/usr/bin:/usr/sbin' >> ct
echo "12 12 * * * /root/awt-db-backup.sh" >> ct
cat ct
crontab ct
