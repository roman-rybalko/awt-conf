#!/bin/sh -ex
. ./remote.conf

cd /var/lib/
rm -vf /var/backups/awt/munin.tar
tar -cf /var/backups/awt/munin.tar munin
chmod -v 0440 /var/backups/awt/munin.tar
ls -l /var/backups/awt/munin.tar
