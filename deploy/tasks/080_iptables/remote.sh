#!/bin/sh -ex
. ./remote.conf

mv -vf /etc/default/iptables.save /etc/default/iptables.save.bak || true
mv -vf /etc/default/ip6tables.save /etc/default/ip6tables.save.bak || true

iptables-save > /etc/default/iptables.save
ip6tables-save > /etc/default/ip6tables.save
chmod -v 0400 /etc/default/iptables.save /etc/default/ip6tables.save

grep iptables-restore /etc/rc.local || sed -i '/^exit 0/ i \
iptables-restore /etc/default/iptables.save
' /etc/rc.local
grep ip6tables-restore /etc/rc.local || sed -i '/^exit 0/ i \
ip6tables-restore /etc/default/ip6tables.save
' /etc/rc.local

cat /etc/rc.local
cat /etc/default/iptables.save
diff -u /etc/default/iptables.save.bak /etc/default/iptables.save || true
cat /etc/default/ip6tables.save
diff -u /etc/default/ip6tables.save.bak /etc/default/ip6tables.save || true
