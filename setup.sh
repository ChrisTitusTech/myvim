#!/bin/bash

# Initial Setup file for new systems
mkdir -p ~/.vim/undodir
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Share system clipboard with unnamedplus
sudo apt install vim-gtk3 ripgrep fd-find xclip
