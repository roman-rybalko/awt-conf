#!/bin/sh -ex
. ./remote.conf

crontab -l | grep -v awt-www-repl > ct || true
cat ct
crontab ct

rm -Rvf /root/awt-www-repl.*
