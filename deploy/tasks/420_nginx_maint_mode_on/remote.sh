#!/bin/sh -ex
. ./remote.conf

iptables -A INPUT -p tcp --dport 80 -j DROP
ip6tables -A INPUT -p tcp --dport 80 -j DROP
iptables -A INPUT -p tcp --dport 443 -j DROP
ip6tables -A INPUT -p tcp --dport 443 -j DROP
