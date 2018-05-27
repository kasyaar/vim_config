call plug#begin('~/.vim/plugged')

Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'kien/rainbow_parentheses.vim'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'


Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'

call plug#end()
