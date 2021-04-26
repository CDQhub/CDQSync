#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-11-07 23:43:07
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 15:45:14
## @Description : sync git global config
##########################################

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

cp -f "${WORKDIR}/git/gitconfig" "${HOME}/.gitconfig"
cp -f "${WORKDIR}/git/gitignore" "${HOME}/.config/gitignore"
