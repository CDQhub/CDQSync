#!/bin/sh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-09-09 10:45:58
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 16:15:11
## @Description : sync zshrc and mkdir user tmp dir
##########################################

set -eu
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

## install zsh
if [[ -z "$(zsh --version 2>/dev/null)" ]]; then
	echo "Can't find zsh, must install zsh firstly" >&2
	exit 1
fi

## install oh-my-zsh
if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
	echo "Can't find .oh-my-zsh, then will install oh-my-zsh" >&2
	cd ~
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cd -
fi

## install autosuggestions syntax-highlighting powerlevel10k
if [[ -d ${HOME}/.oh-my-zsh ]]; then
	echo "install zsh plugins autosuggestions syntax-highlighting powerlevel10k"
	# install autosuggestions and syntax_highlignt
	[ ! -d "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] && git clone git://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	[ ! -d "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
	[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# get zshrc
echo "cp my zshrc to ~/.zshrc" >&2
cp "${WORKDIR}/zsh/zshrc" "${HOME}/.zshrc"
echo "cp my p10k to ~/.p10k.zsh" >&2
cp "${WORKDIR}/zsh/p10k.zsh" "${HOME}/.p10k.zsh"

## mkdir MYPATH
[ ! -d "${MYTMPDIR}" ] && mkdir -p "${MYTMPDIR}"
[ ! -d "${GOTMPDIR}" ] && mkdir -p "${GOTMPDIR}"
[ ! -d "${TMUX_TMPDIR}" ] && mkdir -p "${TMUX_TMPDIR}"
