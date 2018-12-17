#!/bin/sh

cd ~
git clone https://github.com/vim/vim.git
cd vim
# notice path of python/python3
echo notice path of python/python3
./configure --with-features=huge \
	        --enable-multibyte \
			--enable-rubyinterp=yes \
			--enable-pythoninterp=yes \
			--enable-python3interp=yes \
			--enable-perlinterp=yes \
			--enable-luainterp=yes \
			--enable-gui=gtk2 \
			--enable-cscope \
			--prefix=/usr/local \
			--with-python-config-dir=/usr/lib/python2.7/config \
			--with-python3-config-dir=/usr/lib/python3.5/config

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81

sudo make install

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
