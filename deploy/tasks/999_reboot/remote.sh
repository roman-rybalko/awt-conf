#!/bin/sh -ex
. ./remote.conf
shutdown -r +1 </dev/null >/dev/null 2>/dev/null
rm -vf /var/run/nologin
