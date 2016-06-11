#!/bin/sh -ex
. ./framework.sh
export MYSQL_PW=xxx
deploy_batch 160_mysql 190_awt_db_backup_del 195_awt_db_backup
