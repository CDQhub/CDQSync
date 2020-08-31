#!/bin/bash

set -e
WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# get bashrc
# wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/bashrc
# mv bashrc .bashrc
echo "cp my bashrc to ~/.bashrc" >&2
cp ../conf/bashrc ~/.bashrc

## for env settings
mkdir ${HOME}/Software 2>/dev/null
mkdir -p ${HOME}/ToolsGoPath/tmp 2>/dev/null

source ${HOME}/.bashrc
cd -
