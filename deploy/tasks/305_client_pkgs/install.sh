#! /bin/sh

set -e
set -x

rm -vf /etc/apt/sources.list.d/ubuntu.list
apt-get update
apt-get --purge --yes install npm nodejs-legacy
apt-get --purge --yes install xvfb dwm scrot openjdk-7-jre x11vnc

chown -Rv root:root ubuntu.list
cp -vf ubuntu.list /etc/apt/sources.list.d/
apt-key add 3B4FE6ACC0B21F32.key
apt-key add 40976EAF437D05B5.key
apt-get update

apt-get --purge --yes install firefox chromium-browser flashplugin-installer

wget http://deploy/client/firefox.deb
apt-get --purge --yes remove firefox
dpkg -i firefox.deb
rm -vf firefox.deb

rm -vf /etc/apt/sources.list.d/ubuntu.list
