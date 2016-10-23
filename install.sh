#!/bin/sh

# Set up symlinks
ln -sfn ~/.config/vim-config/ ~/.vim
ln -sfn ~/.config/vim-config/_vimrc  ~/.vimrc

# Clone vundle
git clone https://github.com/gmarik/vundle.git ~/.config/vim-config/bundle/vundle

# Install plugins
vim +BundleInstall +qall

