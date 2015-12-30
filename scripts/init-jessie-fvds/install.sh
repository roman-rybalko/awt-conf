#! /bin/sh

set -e
set -x

cd "`dirname "$0"`"
chown -R root:root .

if ! grep 64022 /etc/ssh/sshd_config; then
	patch /etc/ssh/sshd_config < sshd_config.diff
	service ssh restart
fi

grep hosts /etc/hostname || grep '\.' /etc/hostname || grep ' ' /etc/hostname || echo `cat /etc/hostname`.hosts.advancedwebtesting.net > /etc/hostname

grep 77.88 /etc/resolv.conf || cat resolv.conf > /etc/resolv.conf

sed -i 's/#alias l/alias l/' /etc/skel/.bashrc

grep inet6 /etc/network/interfaces || cat interfaces.ipv6 >> /etc/network/interfaces

if ! [ -e /etc/apt/sources.list.d/yandex.list ]; then
	sed -i 's/^deb/#deb/' /etc/apt/sources.list
	cp yandex.list /etc/apt/sources.list.d/
	apt-key add 3B4FE6ACC0B21F32.key
	apt-key add 40976EAF437D05B5.key
fi

apt-get update
apt-get --purge remove rpcbind
apt-get --purge dist-upgrade

cat /etc/hosts
