#!/bin/sh
#####
## @Author      : caodaqian
## @since       : 2020-09-09 10:46:42
## @LastEditors : caodaqian
## @lastTime    : 2020-09-09 11:30:57
## @Description : sync vimrc and mkdir .vim/*
######

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

if [ ! -f ${HOME}/.vim/autoload/plug.vim ]; then
    echo "plug.vim is not exists, then will install plug.vim first" >&2
    curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

## for vimrc config
[ ! -d ${HOME}/.vim/undo ] && mkdir ${HOME}/.vim/undo
[ ! -d ${HOME}/.vim/backup ] && mkdir ${HOME}/.vim/backup
[ ! -d ${HOME}/.vim/tmp ] && mkdir ${HOME}/.vim/tmp
[ ! -d ${HOME}/.vim/viminfo ] && mkdir ${HOME}/.vim/viminfo

echo "cp my vimrc to ~/.vim/vimrc" >&2
cp ${WORKDIR}/vim/vimrc ${HOME}/.vim/vimrc
cp ${WORKDIR}/vim/coc-settings.json ${HOME}/.vim/coc-settings.json
