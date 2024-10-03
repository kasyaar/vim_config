#!/usr/bin/env bash
echo_cmd "Cloning vim config"
git clone https://github.com/kasyaar/vim_config ~/.vim
ln -sf ~/.vim/.vimrc ~/
ln -sf ~/.vim/.gvimrc ~/
vim +PlugInstall +qall
