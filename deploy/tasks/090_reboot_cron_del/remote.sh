#!/bin/sh -ex
. ./remote.conf

REBOOT="shutdown -r +1"

crontab -l | grep -v "$REBOOT" > ct || true
grep PATH ct || echo 'PATH=/bin:/sbin:/usr/bin:/usr/sbin' >> ct
cat ct
crontab ct
