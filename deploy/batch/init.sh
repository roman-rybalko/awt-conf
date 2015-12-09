#!/bin/sh -ex
. ./framework.sh

for p in hosts_batch/*.pw; do [ -e $p ]; done
deploy_batch 020_deploy

for p in hosts_batch/*.pw; do rm -vf $p; done
deploy_batch 030_secure_home 050_munin 060_postfix_lo
