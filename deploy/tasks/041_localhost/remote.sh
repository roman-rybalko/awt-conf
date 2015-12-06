#!/bin/sh -ex
. ./remote.conf
cat hosts >> /etc/hosts
cat /etc/hosts
