#!/bin/sh -ex
. ./local.conf

[ -n "$RSYNC_USER" ]
[ -n "$RSYNC_PASSWORD" ]

H=$1
case $H in
	s1.*)
		RSYNC_HOST=s2.hosts.advancedwebtesting.net
	;;
	s2.*)
		RSYNC_HOST=s1.hosts.advancedwebtesting.net
	;;
	*)
		case "$RSYNC_MASTER" in
			s1.*|s1)
				RSYNC_HOST=s1.hosts.advancedwebtesting.net
			;;
			s2.*|s2)
				RSYNC_HOST=s2.hosts.advancedwebtesting.net
			;;
			*)
				exit 1
			;;
		esac
	;;
esac

echo $RSYNC_USER > u
echo $RSYNC_PASSWORD > p
echo $RSYNC_HOST > h
