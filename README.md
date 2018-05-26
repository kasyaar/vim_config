# INSTALL
```sh
sudo apt-get install git mercurial cscope
git clone git://github.com/kasyaar/vim_config.git $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
vim +PlugInstall +qall
```

Then just run vim or gvim and VAM will ask you to install few plugins ;)

# Plugins that will be installed

This vim config distribution uses [Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug) which I think is
simplest addon manager for vim.

Following plugins will be installed after apply this vim config:

Plugin|Description
------|-----------
[vim-fugitive](http://github.com/tpope/vim-fugitive) |simple integration with git
[rainbow_parentheses.vim](http://github.com/kien/rainbow_parentheses.vim) | helpful when you work with clojure
[syntastic](http://github.com/kasyaar/syntastic) | syntax checker for many languages
[bufexplorer](https://github.com/jlanzarotta/bufexplorer) | make buffer management much easier
[vim-snippets](http://github.com/honza/vim-snippets) | a bunch of snippets for different languages
[nerdtree](http://github.com/scrooloose/nerdtree) | project tree
[nerdcommenter](http://github.com/scrooloose/nerdcommenter) | ads useful commenting feature 
[ultisnips](http://github.com/SirVer/ultisnips)| snippet engine

# Other customizations
 TBD

Enjoy!
