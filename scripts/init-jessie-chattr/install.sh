#! /bin/sh

set -e
set -x

if ! grep 64022 /etc/ssh/sshd_config; then
	apt-get update
	apt-get --purge --yes install patch
	patch /etc/ssh/sshd_config < sshd_config.diff
	service ssh restart
fi

cat /etc/resolv.conf
echo "nameserver 77.88.8.8" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

echo XX.hosts.advancedwebtesting.net > /etc/hostname

apt-get --yes --purge install e2fsprogs
lsattr /etc/resolv.conf /etc/hostname
chattr +i /etc/resolv.conf /etc/hostname
lsattr /etc/resolv.conf /etc/hostname

shutdown -r
