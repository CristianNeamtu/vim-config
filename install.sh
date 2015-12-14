#!/bin/sh

ln -sfn ~/.config/vim-config/ ~/.vim
ln -sfn ~/.config/vim-config/_vimrc  ~/.vimrc

git clone https://github.com/gmarik/vundle.git ~/.config/vim-config/bundle/vundle

vim +BundleInstall +qall
