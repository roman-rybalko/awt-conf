#!/bin/sh -ex
. ./local.conf

[ -n "$IP4" ]
[ -n "$IP6" ]
[ -n "$ADD" ]
echo $IP4 > ip4
echo $IP6 > ip6
echo $ADD > add
