#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-09-09 10:45:26
## @LastEditors : caodaqian
## @LastEditTime: 2020-11-08 14:19:32
## @Description : sync bashrc and mkdir user tmp dir
##########################################

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

## sync bashrc if file not exist
if [[ ! -f ${HOME}/.bashrc ]]; then
    echo "cp my bashrc to ~/.bashrc" >&2
    cp ${WORKDIR}/bash/bashrc ${HOME}/.bashrc
fi

source ${HOME}/.bashrc
