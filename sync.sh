#!/bin/bash
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-09-09 10:32:02
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 16:13:33
## @Description : sync all in one
##########################################

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

## sync bashrc
echo "**********************" >&2
./bin/sync_bash.sh
echo "finish sync bashrc!" >&2
echo "**********************" >&2

## sync vimrc
./bin/sync_vim.sh
echo "finish sync vimrc!" >&2
echo "**********************" >&2

## sync zshrc
./bin/sync_zsh.sh
echo "finish sync zshrc!" >&2
echo "**********************" >&2

## sync tmux
./bin/sync_tmux.sh
echo "finish sync tmux!" >&2
echo "**********************" >&2

## sync git
./bin/sync_git.sh
echo "finish sync git!" >&2
echo "**********************" >&2

## install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
${HOME}/.fzf/install
echo "finish install fzf!" >&2
echo "**********************" >&2

## install ranger
./bin/sync_ranger.sh
echo "finish install ranger!" >&2
echo "**********************" >&2

## sync env config
echo "cp my config file to ~/.config" >&2
[ ! -d ${HOME}/.config ] && mkdir ${HOME}/.config
cp -f ${WORKDIR}/config/*.conf ${HOME}/.config
echo "**********************" >&2

## mkdir env config dir
echo "mkdir env config dir" >&2
[ ! -d ${HOME}/.software ] && mkdir ${HOME}/.software
[ ! -d ${MYTMP} ] && mkdir -p ${MYTMP}
[ ! -d ${GOTMPDIR} ] && mkdir -p ${GOTMPDIR}
[ ! -d ${TMUX_TMPDIR} ] && mkdir -p ${TMUX_TMPDIR}
echo "**********************" >&2

cd -
