#!/bin/sh -ex
. ./framework.sh
export RSYNC_USER=awt-repl
export RSYNC_PASSWORD=ziZianQTGxlDBfZy4LdG9s
deploy_batch 442_munin_restore
