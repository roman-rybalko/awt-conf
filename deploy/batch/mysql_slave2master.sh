#!/bin/sh -ex
. ./framework.sh
export MYSQL_USER=awt-repl-adm
export MYSQL_PASSWORD=ubEBbVnoy0cCOiW876hNgd
deploy_batch 180_mysql_slave2master
