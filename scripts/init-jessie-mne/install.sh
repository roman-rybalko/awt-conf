#! /bin/sh

set -e
set -x

if ! grep 64022 /etc/ssh/sshd_config; then
	patch /etc/ssh/sshd_config < sshd_config.diff
	service ssh restart
fi

chown -v root:root 10-no-ipv6.conf
cp -v 10-no-ipv6.conf /etc/sysctl.d/

sed -i '/exit/ d' /etc/rc.local
cat rc.sh >> /etc/rc.local

chown -v root:root tmp
cp -v tmp /etc/init.d/
update-rc.d tmp defaults

shutdown -r
