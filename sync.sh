#!/bin/bash
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-09-09 10:32:02
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 16:13:33
## @Description : sync all in one
##########################################

set -u
WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

## sync env config
echo "cp my config file to ~/.config" >&2
[ ! -d "${HOME}/.config" ] && mkdir "${HOME}/.config"
cp -f ${WORKDIR}/config/*.conf "${HOME}/.config"
source "${HOME}/.config/env.conf"
echo "**********************" >&2

## sync bashrc
echo "**********************start sync bashrc**********************" >&2
./bin/sync_bash.sh

## sync zshrc
echo "**********************start sync zshrc**********************" >&2
./bin/sync_zsh.sh

## sync vimrc
echo "**********************start sync vimrc**********************" >&2
./bin/sync_vim.sh

## sync tmux
echo "**********************start sync tmuxrc**********************" >&2
./bin/sync_tmux.sh

## sync git
echo "**********************start sync git config**********************" >&2
./bin/sync_git.sh

## sync git
echo "**********************start sync top config**********************" >&2
./bin/sync_top.sh

## install fzf
echo "**********************start install fzf**********************" >&2
git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.fzf"
${HOME}/.fzf/install

## install ranger
echo "**********************start sync rangerrc!**********************" >&2
./bin/sync_ranger.sh

cd -
