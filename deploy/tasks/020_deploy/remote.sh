#!/bin/sh -ex
. ./remote.conf
adduser --disabled-password --gecos 'AWT Deploy Service' deploy
chmod og-rwx /home/deploy
tar -xvf deploy.tgz -C /
