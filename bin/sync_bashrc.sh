#!/bin/bash

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# get bashrc
# wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/bashrc
# mv bashrc .bashrc
cp ../conf/bashrc ~/.bashrc

source ~/.bashrc
cd -
