#!/bin/sh -ex
. ./remote.conf

netstat -ntpl
service postfix stop
pgrep -u postfix | xargs kill || true
start()
{
	service postfix start
	sleep 1
	netstat -ntpl
}
if ! patch -bf /etc/postfix/main.cf < main.cf-lo.diff; then
	mv -vf /etc/postfix/main.cf.orig /etc/postfix/main.cf
	rm -vf /etc/postfix/main.cf.rej
	start
	exit 1
fi
start
