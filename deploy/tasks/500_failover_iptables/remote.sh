#!/bin/sh -ex
. ./remote.conf

IP4=`cat ip4`
IP6=`cat ip6`
ADD=`cat add`
[ "$ADD" = 1 ] && OP='-A' || OP='-D'

sysctl -w net.ipv4.conf.all.forwarding=$ADD
iptables -t nat $OP PREROUTING -p tcp --dport 80 -m addrtype --dst-type LOCAL -j DNAT --to $IP4
iptables -t nat $OP POSTROUTING -p tcp --dport 80 -d $IP4 -j MASQUERADE
iptables -t nat $OP PREROUTING -p tcp --dport 443 -m addrtype --dst-type LOCAL -j DNAT --to $IP4
iptables -t nat $OP POSTROUTING -p tcp --dport 443 -d $IP4 -j MASQUERADE

sysctl -w net.ipv6.conf.all.forwarding=$ADD
ip6tables -t nat $OP PREROUTING -p tcp --dport 80 -m addrtype --dst-type LOCAL -j DNAT --to $IP6
ip6tables -t nat $OP POSTROUTING -p tcp --dport 80 -d $IP6 -j MASQUERADE
ip6tables -t nat $OP PREROUTING -p tcp --dport 443 -m addrtype --dst-type LOCAL -j DNAT --to $IP6
ip6tables -t nat $OP POSTROUTING -p tcp --dport 443 -d $IP6 -j MASQUERADE
