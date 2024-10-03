#!/usr/bin/env bash
git clone https://github.com/kasyaar/vim_config ~/.vim
ln -sf ~/.vim/.vimrc ~/
ln -sf ~/.vim/.gvimrc ~/
vim +PlugInstall +qall
