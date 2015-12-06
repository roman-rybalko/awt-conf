#!/bin/sh -ex
. ./remote.conf

for f in /var/www/awt/*/VERSION /var/www/awt/*/*/VERSION; do
	echo $f
	cat $f
done
