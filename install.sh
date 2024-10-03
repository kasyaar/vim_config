#!/usr/bin/env bash
echo "Installing vim_config"
if command -v git > /dev/null 2>&1; then
    echo "Getting package from https://github.com/kasyaar/vim_config.git..."
    git clone https://github.com/kasyaar/vim_config.git ~/.vim > /dev/null 2>&1
    ln -s ~/.vim/.vimrc ~/ > /dev/null 2>&1
    ln -s ~/.vim/.gvimrc ~/ > /dev/null 2>&1
else
    echo "GIT is not installed. Please install and run again."
fi
if command -v vim > /dev/null 2>&1; then
    echo "Installing VIM plugins(vim +PlugInstall +qall)..."
    vim +PlugInstall +qall > /dev/null 2>&1
    echo "Done"
else
    echo "VIM is not installed. Please install and run again."
fi
