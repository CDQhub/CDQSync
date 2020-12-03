#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-09-09 10:46:42
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 16:10:31
## @Description : sync vimrc and mkdir .vim/*
##########################################

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

## for vimrc config
if [[ ! -z ${VIMDIR} ]]; then
    echo "mkdir vim undo/tmp/backup/viminfo"
    [ ! -d ${VIMDIR}/undo ] && mkdir ${VIMDIR}/undo
    [ ! -d ${VIMDIR}/backup ] && mkdir ${VIMDIR}/backup
    [ ! -d ${VIMDIR}/tmp ] && mkdir ${VIMDIR}/tmp
    [ ! -d ${VIMDIR}/viminfo ] && mkdir ${VIMDIR}/viminfo

    echo "cp VIMRC and coc-settings.json"
    if [[ -z "$(nvim --version 2>/dev/null)" ]]; then
        cp ${WORKDIR}/vim/vimrc ${VIMDIR}/vimrc
    else
        cp ${WORKDIR}/vim/init.vim ${VIMDIR}/init.vim
    fi
    cp ${WORKDIR}/vim/coc-settings.json ${VIMDIR}/coc-settings.json
fi
