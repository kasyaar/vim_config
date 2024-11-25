#!/usr/bin/env sh
help() {
    echo "Uasge: $0 [options]"
    echo ""
    echo "Options:"
    echo "-h    Display this help message and exit"
    echo "-b    Install base editor config only. (default: false)" 
    echo ""
    exit 1
}


while getopts hb flag
do
    case "${flag}" in
        b) VIM_BASE=true;;
        h) help;;
        *) help;;
    esac
done

missing=""
commands="vim git" 
# node npm pipx
if [ -z "$VIM_BASE" ]; then
    commands="$commands node npm pipx"
fi
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
#exit 1
echo "Backing up old .vim directory"
mv ~/.vim ~/.vim.$(date +%Y%m%d-%H%M%S) > /dev/null 2>&1
echo "Getting package from https://github.com/kasyaar/vim_config.git..."
git clone https://github.com/kasyaar/vim_config.git ~/.vim > /dev/null 2>&1
ln -sf ~/.vim/.vimrc ~/ > /dev/null 2>&1
#ln -sf ~/.vim/.gvimrc ~/ > /dev/null 2>&1

if [ -z "$VIM_BASE" ]; then
    NVIM_CONFIG_PATH=$HOME/.config/nvim
    mkdir -p $NVIM_CONFIG_PATH > /dev/null 2>&1
    cp $HOME/.vim/init.vim.example $NVIM_CONFIG_PATH/init.vim
    cp $HOME/.vim/coc-settings.json $NVIM_CONFIG_PATH/
    echo "Installing vim plugins(vim +PlugInstall +qall)..."
    vim +PlugInstall +qall > /dev/null 2>&1
    if command -v pipx > /dev/null 2>&1; then
        echo "Installing flake8 and bandit"
        pipx install bandit > /dev/null 2>&1
        pipx install flake8 > /dev/null 2>&1
    fi
else
    export VIM_BASE=true
    echo "Installing vim plugins(vim +PlugInstall +qall)..."
    vim +PlugInstall +qall > /dev/null 2>&1
fi
echo "Installation finished."
