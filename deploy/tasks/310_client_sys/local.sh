#!/bin/sh -ex
. ./local.conf

cp -Rv $SRCD/scripts/client/system ./
mkdir system/logrotate
cp -Rv $CNFD/services/logrotate/awt-client system/logrotate/
