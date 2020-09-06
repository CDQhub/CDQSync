#!/bin/sh

set -ex
WORKDIR=$(dirname $(readlink -f "$0"))
cd $WORKDIR

if [ ! -f ${HOME}/.gitconfig ];then
	echo "cannot find gitconfig in $HOME, then will sync gitconfig"
	cp ${WORKDIR}/conf/gitconfig ${HOME}/.gitconfig
fi
cd -
