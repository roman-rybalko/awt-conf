#!/bin/sh -ex
. ./remote.conf

cd /usr/lib/
tar -cf /var/backups/munin.tar munin
chmod -v 0440 /var/backups/munin.tar
