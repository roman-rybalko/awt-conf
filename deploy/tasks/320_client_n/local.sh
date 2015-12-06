#!/bin/sh -ex
. ./local.conf

N=$CLIENT_N
[ -n "$N" ]
echo $N > client_n

H=`echo $1 | sed 's/.hosts.advancedwebtesting.net//'`

mkdir home
cd home

cp -R $SRCD/client ./
rm -Rf client/.gitignore client/config.js client/node_modules

sed "s/XXXHOSTNAMEXXX/$H/" $CNFD/services/client$N/config.js > client/config.js

cp -R $SRCD/scripts/client/user/* $SRCD/scripts/client/user/.??* ./
