#!/bin/sh -ex
. ./local.conf

for f in $SRCD/*/VERSION $SRCD/*/*/VERSION; do
	echo $f
	cat $f
done
