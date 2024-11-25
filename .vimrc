" BASE CONFIG
set runtimepath+=$HOME/.vim
set nocompatible 
" highlight found words
set hlsearch
set nowrap
set ts=4 sts=4 sw=4 expandtab
set nu 
set bg=dark 
set foldmethod=indent
set autoindent
set smartindent
" don't unload buffers when switching along
set hidden
syntax on
 set spell
set spelllang=en
"set termencoding=utf8
set fileencodings=utf8
set encoding=utf8
set incsearch
set vb t_vb= 
" Mouse support
set mouse=a
set mousemodel=popup
" swp folder
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set undodir=$HOME/.vim/backup
" session options
set sessionoptions=curdir,buffers,tabpages
" show completion menu for only one founded completion
set cot+=menuone
" Activate filetype indent
filetype indent on
" Activate filetype plugin.
filetype plugin on
set autoread


" PLUGINS
source $HOME/.vim/plug.vim


" BASE PLUGINS
source $HOME/.vim/base.vim


" EXTRA PLUGINS
if !exists('$VIM_BASE')
    source $HOME/.vim/extra.vim
    source $HOME/.vim/neovide.vim
endif

" old config
"source $HOME/.vim/check.vim
"source $HOME/.vim/coc.vim
"jedi
"let g:jedi#popup_on_dot = 0
"gen.nvim
"if has("nvim")
"    luafile $HOME/.vim/gen.lua
"endif
