#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-11-07 23:43:07
## @LastEditors : caodaqian
## @LastEditTime: 2020-11-08 15:27:05
## @Description : sync git global config
##########################################

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

[ ! -f ${HOME}/.gitconfig ] && cp ${WORKDIR}/git/gitconfig ${HOME}/.gitconfig
[ ! -f ${HOME}/.config/gitignore ] && cp ${WORKDIR}/git/gitignore ${HOME}/.config/gitignore
