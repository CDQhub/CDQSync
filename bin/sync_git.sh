#!/bin/sh

set -e
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))


[ ! -f ${HOME}/.gitconfig ] && cp ${WORKDIR}/git/gitconfig ${HOME}/.gitconfig
[ ! -f ${HOME}/.config/gitignore ] && cp ${WORKDIR}/git/gitignore ${HOME}/.config/gitignore
