#!/bin/bash
#####
## @Author      : caodaqian
## @since       : 2020-09-09 10:45:26
## @LastEditors : caodaqian
## @lastTime    : 2020-09-09 11:28:55
## @Description : sync bashrc and mkdir user tmp dir
######

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

# get bashrc
if [[ ! -f ${HOME}/.bashrc ]]; then
    echo "cp my bashrc to ~/.bashrc" >&2
    cp ${WORKDIR}/bash/bashrc ${HOME}/.bashrc
fi

echo "cp my config file to ~/.config" >&2
[ ! -d ${HOME}/.config ] && mkdir ${HOME}/.config
cp -f ${WORKDIR}/config/* ${HOME}/.config

## for env settings
[ ! -d ${HOME}/Software ] && mkdir ${HOME}/Software
[ ! -d ${GOTMPDIR} ] && mkdir -p ${GOTMPDIR}
[ ! -d ${TMUX_TMPDIR} ] && mkdir -p ${TMUX_TMPDIR}

source ${HOME}/.bashrc
