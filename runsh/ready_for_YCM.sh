#!/bin/bash

cd ~/.vim/bundle/YouCompleteMe
sudo yum install -y clang
python install.py --clang-completer
cd -
