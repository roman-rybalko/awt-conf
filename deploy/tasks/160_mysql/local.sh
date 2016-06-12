#!/bin/sh -ex
. ./local.conf

[ -n "$MYSQL_PW" ]
echo $MYSQL_PW > pw

H=$1
case $H in
	s1.*)
		rm -vf *2.cnf *2.sql
	;;
	s2.*)
		rm -vf *1.cnf *1.sql
	;;
	*)
		case "$MYSQL_MASTER" in
			s1.*|s1)
				rm -vf *1.cnf *1.sql
			;;
			s2.*|s2)
			;;
				rm -vf *2.cnf *2.sql
			*)
				exit 1
			;;
		esac
	;;
esac
