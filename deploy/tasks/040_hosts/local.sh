#!/bin/sh -ex
. ./local.conf
> hosts
for h in $HOSTS; do
	host=$h.hosts.advancedwebtesting.net
	for a in `./getips $host`; do
		echo "$a $host" >> hosts
	done
done
cat sl-hosts >> hosts
