#!/bin/sh -ex
. ./local.conf

for f in $SRCD/server/*/VERSION $SRCD/server/*/*/VERSION; do
	echo $f
	cat $f
done
