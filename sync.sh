#!/bin/bash
#####
## @Author      : caodaqian
## @since       : 2020-09-09 10:32:02
## @LastEditors : caodaqian
## @lastTime    : 2020-09-09 10:32:23
## @Description : sync all in one
######

WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

# sync bashrc
echo "**********************" >&2
./bin/sync_bashrc.sh
echo "finish sync bashrc!" >&2
echo "**********************" >&2
# sync vimrc
./bin/sync_vimrc.sh
echo "finish sync vimrc!" >&2
echo "**********************" >&2
# sync zshrc
./bin/sync_zshrc.sh
echo "finish sync zshrc!" >&2
echo "**********************" >&2
# sync tmux
./bin/sync_tmux.sh
echo "finish sync tmux!" >&2
echo "**********************" >&2
# sync git
./bin/sync_git.sh
echo "finish sync git!" >&2
echo "**********************" >&2
# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
${HOME}/.fzf/install
echo "finish install fzf!" >&2
echo "**********************" >&2
# install ranger
./bin/sync_ranger.sh
echo "finish install ranger!" >&2
echo "**********************" >&2

cd -
