#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-11-08 13:57:58
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 16:18:32
## @Description : install and sync config for tmux
##########################################

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

## install tmux
if [[ -z "$(tmux -V 2>/dev/null)" ]]; then
	echo "must install tmux firstly" >&2
	exit 1
fi

## sync tmux.conf.local
if [[ ! -d ${HOME}/.tmux ]]; then
	echo "install oh-my-tmux"
	git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
	ln -s -f ${HOME}/.tmux/.tmux.conf ${HOME}/.tmux.conf
	cp ${WORKDIR}/tmux/tmux.conf.local ${HOME}/.tmux.conf.local
fi

# // oh-my-tmux support build-in tpm
# ## install tpm
# if [[ ! -d ${HOME}/.tmux/plugins/tpm ]]; then
# 	echo "install tpm"
# 	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
# fi
