#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-11-07 23:43:07
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 15:53:11
## @Description : sync ranger config
##########################################

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

# install ranger
if [ -z "$(ranger --version 2>/dev/null)" ]; then
    echo "check not install ranger, then will install ranger secondly"
    #git clone https://github.com/ranger/ranger.git
    #sudo make install
    pip -user install ranger-fm
fi

## sync ranger config
if [ ! -d ${HOME}/.config/ranger ]; then
    echo "load my ranger config"
    cp -r ${WORKDIR}/ranger ${HOME}/.config/
    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
fi
