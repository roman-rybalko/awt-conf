#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=5
deploy_batch 320_client_n
