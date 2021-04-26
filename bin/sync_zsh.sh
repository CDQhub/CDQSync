#!/bin/zsh
##########################################
## @Author      : caodaqian
## @CreateTime  : 2020-09-09 10:45:58
## @LastEditors : caodaqian
## @LastEditTime: 2020-12-03 16:15:11
## @Description : sync zshrc and mkdir user tmp dir
##########################################

set -ex
WORKDIR=$(dirname $(dirname $(readlink -f "$0")))

## install zsh
if [[ -z "$(zsh --version 2>/dev/null)" ]]; then
	echo "Can't find zsh, then will install zsh firstly" >&2
	sudo yum install zsh -y
fi

## install oh-my-zsh
if [[ .oh-my-zsh != $(basename $ZSH) ]]; then
	echo "Can't find .oh-my-zsh, then will install oh-my-zsh" >&2
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

## install autosuggestions syntax-highlighting powerlevel10k
if [[ -d ${HOME}/.oh-my-zsh ]]; then
	echo "install zsh plugins autosuggestions syntax-highlighting powerlevel10k"
	# install autosuggestions and syntax_highlignt
	[ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] && git clone git://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	[ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
	[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# get zshrc
echo "cp my zshrc to ~/.zshrc" >&2
cp "${WORKDIR}/zsh/zshrc" "${HOME}/.zshrc"
echo "cp my p10k to ~/.p10k.zsh" >&2
cp "${WORKDIR}/zsh/p10k.zsh" "${HOME}/.p10k.zsh"

## mkdir MYPATH
[ ! -d "${MYTMP}" ] && mkdir -p "${MYTMP}"
[ ! -d "${GOTMP}" ] && mkdir -p "${GOTMP}"
[ ! -d "${TMUXTMP}" ] && mkdir -p "${TMUXTMP}"
