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
	echo "check not install ranger, must install ranger firstly" >&2
	exit 1
fi

## sync ranger config
if [ ! -d ${HOME}/.config/ranger ]; then
	echo "load my ranger config"
	cp -r "${WORKDIR}/ranger" "${HOME}/.config/"
	git clone https://github.com/alexanderjeurissen/ranger_devicons "${HOME}/.config/ranger/plugins/ranger_devicons"
fi
