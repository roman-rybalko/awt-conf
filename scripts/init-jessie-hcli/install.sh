#! /bin/sh

set -e
set -x

if ! grep 64022 /etc/ssh/sshd_config; then
	apt-get update
	apt-get --purge --yes install patch
	patch /etc/ssh/sshd_config < sshd_config.diff
	service ssh restart
fi

sed -i '/exit/ d' /etc/rc.local
cat rc.sh >> /etc/rc.local

echo XX.hosts.advancedwebtesting.net > /etc/hostname

shutdown -r
