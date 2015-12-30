#!/bin/sh -ex
. ./local.conf

cp -Rv $SRCD/scripts/client/system ./
mkdir system/logrotate
mv -vf awt-client system/logrotate/
