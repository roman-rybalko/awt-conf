#!/bin/sh -ex
. ./remote.conf

grep ^allow /etc/munin/munin-node.conf
sed -i 's/85.143.219.62/92\\.63\\.99\\.29/' /etc/munin/munin-node.conf
sed -i 's/2a04:ac00:1:4f60:5054:ff:fe00:659f/2a01:230:2:6::35b/' /etc/munin/munin-node.conf
grep ^allow /etc/munin/munin-node.conf
service munin-node restart
