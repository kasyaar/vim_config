# INSTALL
## Script installation
```sh
curl -sSL https://raw.githubusercontent.com/kasyaar/vim_config/master/install.sh | sh
```
## Manual Installation 
```sh
sudo apt-get install git mercurial cscope
git clone git://github.com/kasyaar/vim_config.git $HOME/.vim
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
ln -s $HOME/.vim/.gvimrc $HOME/.gvimrc
vim +PlugInstall +qall
```
## Neovim instructions

### To use with init.vim
open nvim
```
:exe 'edit '.stdpath('config').'/init.vim'
:write ++p
```
then add following text to this file
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
save and re-run nvim
instructions was taken from official [Transitioning from Vim](https://neovim.io/doc/user/nvim.html#nvim) page.

# Plugins that will be installed

This vim config distribution uses [Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug) which I think is
simplest addon manager for vim.

Following plugins will be installed after apply this vim config:

Plugin|Description
------|-----------
[rainbow_parentheses.vim](http://github.com/kien/rainbow_parentheses.vim) | helpful when you work with clojure
[syntastic](http://github.com/kasyaar/syntastic) | syntax checker for many languages
[bufexplorer](https://github.com/jlanzarotta/bufexplorer) | make buffer management much easier
[vim-snippets](http://github.com/honza/vim-snippets) | a bunch of snippets for different languages
[nerdtree](http://github.com/scrooloose/nerdtree) | project tree
[nerdcommenter](http://github.com/scrooloose/nerdcommenter) | ads useful commenting feature 
<!--[ultisnips](http://github.com/SirVer/ultisnips)| snippet engine-->

# Other customizations
 TBD

Enjoy!
