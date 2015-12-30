#!/bin/sh -ex
. ./remote.conf

mv -vf /etc/munin/munin-node.conf.orig /etc/munin/munin-node.conf.orig2
patch -b /etc/munin/munin-node.conf < munin-node-ipv4.conf.diff
service munin-node restart
