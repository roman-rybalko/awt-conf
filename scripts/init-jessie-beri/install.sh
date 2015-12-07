#! /bin/sh

set -e
set -x

if ! grep 64022 /etc/ssh/sshd_config; then
	apt-get update
	apt-get --purge --yes install patch
	patch /etc/ssh/sshd_config < sshd_config.diff
	service ssh restart
fi

chown -v root:root 10-no-ipv6.conf
cp -v 10-no-ipv6.conf /etc/sysctl.d/

sed -i '/exit/ d' /etc/rc.local
cat rc.sh >> /etc/rc.local

shutdown -r
