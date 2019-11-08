#!/bin/bash

cd ~

# get bashrc
wget https://raw.githubusercontent.com/CDQhub/CDQSync/master/conf/bashrc
mv bashrc .bashrc
source .bashrc
cd -
