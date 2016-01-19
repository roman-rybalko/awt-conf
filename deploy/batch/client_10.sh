#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=10
export LOCK_N=10
deploy_batch 320_client_n
