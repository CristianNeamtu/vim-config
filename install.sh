#!/bin/bash

# Set up symlinks
if [ ! -d ~/.vim ]; then
    echo "Setting up .vim"
    ln -sfn ~/.config/vim-config/ ~/.vim
fi

if [ ! -f ~/.vimrc ]; then
    echo "Setting up .vimrc"
    ln -sfn ~/.config/vim-config/_vimrc  ~/.vimrc
fi

# Clone vundle
VUNDLE_PATH="$(realpath ~)/.config/vim-config/bundle/Vundle.vim"

if [ ! -d $VUNDLE_PATH ]; then 
    echo "Cloning Vundle"
    git clone https://github.com/VundleVim/Vundle.vim $VUNDLE_PATH
else
    (
        cd $VUNDLE_PATH &&\
         git pull
    )
fi

# Install plugins
vim +BundleInstall +qall
