#!/bin/sh -ex
. ./framework.sh
DEPLOY_BATCH_REORDER="080_iptables 999_iptables"
deploy_batch 236_awt_cron 421_nginx_maint_mode_off
