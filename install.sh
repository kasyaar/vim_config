#!/usr/bin/env sh
missing=""
commands="vim git"
set -- $commands
for command; do
    command -v "$command" > /dev/null 2>&1 || { echo "Error: $command not found"; missing="$missing $command"; }
done

if [ -z "$missing" ]; then
    echo "Installing vim_config"
else
    echo "The following apps are missing: $missing"
    exit 1
fi
echo "Backing up old .vim directory"
mv ~/.vim ~/.vim.$(date +%Y%m%d-%H%M%S) > /dev/null 2>&1
echo "Getting package from https://github.com/kasyaar/vim_config.git..."
git clone https://github.com/kasyaar/vim_config.git ~/.vim > /dev/null 2>&1
ln -sf ~/.vim/.vimrc ~/ > /dev/null 2>&1

NVIM_CONFIG_PATH=$HOME/.config/nvim
mkdir -p $NVIM_CONFIG_PATH > /dev/null 2>&1
cp $HOME/.vim/init.vim.example $NVIM_CONFIG_PATH/init.vim
echo "Installing vim plugins(vim +PlugInstall +qall)..."
vim +PlugInstall +qall > /dev/null 2>&1
echo "Installation finished."
