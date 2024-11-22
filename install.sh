#!/usr/bin/env sh
check_editor() {
    local editor="$1"
    if command -v "$editor" > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}
echo "Installing vim_config"
if command -v git > /dev/null 2>&1; then
    echo "Backing up old .vim directory"
    mv ~/.vim ~/.vim.$(date +%Y%m%d-%H%M%S) > /dev/null 2>&1
    echo "Getting package from https://github.com/kasyaar/vim_config.git..."
    git clone https://github.com/kasyaar/vim_config.git ~/.vim > /dev/null 2>&1
    ln -sf ~/.vim/.vimrc ~/ > /dev/null 2>&1
    ln -sf ~/.vim/.gvimrc ~/ > /dev/null 2>&1
else
    echo "git is not installed. Please install and run again."
fi

if check_editor vim || check_editor nvim; then
    EDITOR=$(command -v vim || command -v nvim)
    if check_editor nvim; then
        NVIM_CONFIG_PATH=$HOME/.config/nvim
        mkdir -p $NVIM_CONFIG_PATH > /dev/null 2>&1
        cp $HOME/.vim/init.vim.example $NVIM_CONFIG_PATH/init.vim
    fi
    echo "Installing vim plugins($EDITOR +PlugInstall +qall)..."
    #$EDITOR +PlugInstall +qall > /dev/null 2>&1
    $EDITOR +PlugInstall +qall
else
    echo "vim/neovim is not installed. Please install and run again."
fi
if command -v pipx > /dev/null 2>&1; then
    #echo "Installing bandit and python-lsp-server"
    echo "Installing bandit"
    pipx install bandit > /dev/null 2>&1
    #pipx install "python-lsp-server[all]" > /dev/null 2>&1
    echo "Installation finished."
    echo "Don't forget to install nodejs and npm."
    echo "It's required for code completion and other features."
else
    echo "pipx need to be installed"
fi
