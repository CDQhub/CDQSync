#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-09-09 10:45:26
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 16:14:04
## @Description : sync bashrc and mkdir user tmp dir
##########################################

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

## sync bashrc if file not exist
echo "cp my bashrc to ~/.bashrc"
cp "${WORKDIR}/bash/bashrc" "${HOME}/.bashrc"

## mkdir MYPATH
[ ! -d "${MYTMPDIR}" ] && mkdir -p "${MYTMPDIR}"
[ ! -d "${GOTMPDIR}" ] && mkdir -p "${GOTMPDIR}"
[ ! -d "${TMUX_TMPDIR}" ] && mkdir -p "${TMUX_TMPDIR}"
