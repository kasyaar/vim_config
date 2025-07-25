call plug#begin('~/.vim/plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle', 'tag': '7.0.0'}
Plug 'preservim/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim', {'on': 'RainbowParenthesesLoadRound'}
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive', {'on': 'G'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
if !exists('$VIM_BASE')
    Plug 'flazz/vim-colorschemes'
    Plug 'andreypopp/vim-colors-plain'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
    Plug 'vimwiki/vimwiki'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'chrisbra/csv.vim'
    Plug 'tpope/vim-dadbod'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
endif
"Plug 'David-Kunz/gen.nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'williamboman/mason.nvim'
"Plug 'huggingface/llm.nvim'
call plug#end()
