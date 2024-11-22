#!/usr/bin/env sh
echo "Installing vim_config"
if command -v git > /dev/null 2>&1; then
    echo "Backing up old .vim directory"
    mv ~/.vim ~/.vim.$(date +%Y%m%d-%H%M%S) > /dev/null 2>&1
    echo "Getting package from https://github.com/kasyaar/vim_config.git..."
    git clone https://github.com/kasyaar/vim_config.git ~/.vim > /dev/null 2>&1
    ln -sf ~/.vim/.vimrc ~/ > /dev/null 2>&1
    ln -sf ~/.vim/.gvimrc ~/ > /dev/null 2>&1
else
    echo "GIT is not installed. Please install and run again."
fi
NVIM_CONFIG_PATH=$HOME/.config/nvim
if command -v vim > /dev/null 2>&1 || command -v nvim 2>&1; then
    EDITOR=$(command -v vim || command -v nvim)
    if command -v nvim 2>&1; then
        mkdir -p $NVIM_CONFIG_PATH > /dev/null 2>&1
        cp $HOME/.vim/init.vim.example $NVIM_CONFIG_PATH/init.vim
    fi
    echo "Installing vim plugins($EDITOR +PlugInstall +qall)..."
    $EDITOR +PlugInstall +qall > /dev/null 2>&1
    echo "Done"
else
    echo "vim/neovim is not installed. Please install and run again."
fi
# check pipx and exit if not added
if command -v pipx > /dev/null 2>&1; then
    # Install bandit and python-lsp-server
    echo "Installing bandit and python-lsp-server"
    pipx install bandit > /dev/null 2>&1
    pipx install "python-lsp-server[all]" > /dev/null 2>&1
else
    echo "pipx need to be installed"
fi
echo "Installation finished. Don't forget to install nodejs and npm."
