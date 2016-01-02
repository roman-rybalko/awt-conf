#!/bin/sh -ex
. ./remote.conf

iptables -t nat -L -v -n --line-numbers
ip6tables -t nat -L -v -n --line-numbers
