#!/bin/sh -ex
. ./remote.conf

iptables -D INPUT -p tcp --dport 80 -j DROP || true
ip6tables -D INPUT -p tcp --dport 80 -j DROP || true
iptables -D INPUT -p tcp --dport 443 -j DROP || true
ip6tables -D INPUT -p tcp --dport 443 -j DROP || true
