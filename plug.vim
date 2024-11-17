call plug#begin('~/.vim/plugged')

Plug 'jlanzarotta/bufexplorer'
"Plug 'preservim/nerdtree', {'tag': '6.10.11'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'andreypopp/vim-colors-plain'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-dadbod'
Plug 'mbbill/undotree'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'David-Kunz/gen.nvim'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
"Plug 'williamboman/mason.nvim'
"Plug 'huggingface/llm.nvim'
call plug#end()
