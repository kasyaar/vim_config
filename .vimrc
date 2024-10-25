set runtimepath+=$HOME/.vim
source $HOME/.vim/plug.vim


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
set bg=dark

" don't unload buffers when switching along
set hidden
syntax on

" set spell
set spelllang=en,ru
set termencoding=utf8
set fileencodings=utf8,cp1251
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
"SHORTCUTS
"NERDTree
nmap <Leader>p :NERDTreeToggle<cr>
vmap <Leader>p <esc>:NERDTreeToggle<cr>i
imap <Leader>p <esc>:NERDTreeToggle<cr>i
