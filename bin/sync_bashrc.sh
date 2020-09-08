#!/bin/bash

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

# get bashrc
if [[ ! -f ${HOME}/.bashrc ]]; then
    echo "cp my bashrc to ~/.bashrc" >&2
    cp ${WORKDIR}/bash/bashrc ~/.bashrc
fi

echo "cp my config file to ~/.config" >&2
[ -d ${HOME}/.config ] && mkdir ${HOME}/.config
cp -f ${WORKDIR}/config/* ${HOME}/.config

## for env settings
[ ! -d ${HOME}/Software ] && mkdir ${HOME}/Software
[ ! -d ${GOTMPDIR} ] && mkdir -p ${GOTMPDIR}
[ ! -d ${TMUX_TMPDIR} ] && mkdir -p ${TMUX_TMPDIR}

source ${HOME}/.bashrc
