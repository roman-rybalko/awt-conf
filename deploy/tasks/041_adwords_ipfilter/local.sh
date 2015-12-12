#!/bin/sh -ex
. ./local.conf
for h in $HOSTS; do
	host=$h.hosts.advancedwebtesting.net
	for a in `./getips $host`; do
		echo $a
	done
done | perl -e 'while(<>){chomp; s/\./\\./g; print "|"; print;}'
