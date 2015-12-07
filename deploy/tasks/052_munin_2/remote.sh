#!/bin/sh -ex
. ./remote.conf

mv -vf /etc/munin/munin-node.conf.orig /etc/munin/munin-node.conf.orig2
if patch -b /etc/munin/munin-node.conf < munin-node-2.conf.diff; then
	service munin-node restart
	exit 0
fi

mv -vf /etc/munin/munin-node.conf.orig /etc/munin/munin-node.conf
rm -vf /etc/munin/munin-node.conf.rej
if patch -b /etc/munin/munin-node.conf < munin-node-2-ipv4.conf.diff; then
	service munin-node restart
	exit 0
fi

mv -vf /etc/munin/munin-node.conf.orig /etc/munin/munin-node.conf
rm -vf /etc/munin/munin-node.conf.rej
mv -vf /etc/munin/munin-node.conf.orig2 /etc/munin/munin-node.conf.orig
exit 1
