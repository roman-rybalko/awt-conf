#!/bin/sh -ex
. ./local.conf
> hosts
for h in $HOSTS; do
	host=$h.hosts.advancedwebtesting.net
	for a in `./getips $host`; do
		echo "$a $host" >> hosts
	done
done
for a in `./getips deploy.hosts.advancedwebtesting.net`; do
	echo "$a deploy" >> hosts
done
