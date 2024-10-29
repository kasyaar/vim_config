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
"PLUGINS
"NERDTree
nmap <Leader>p :NERDTreeToggle<cr>
vmap <Leader>p <esc>:NERDTreeToggle<cr>i
imap <Leader>p <esc>:NERDTreeToggle<cr>i
let g:NERDTreeFileLines = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 3
"Tagbar
nmap <Leader>t :TagbarToggle<cr>
vmap <Leader>t <esc>:TagbarToggle<cr>i
imap <Leader>t <esc>:TagbarToggle<cr>i
"rainbow parentheses
nmap <Leader>rp :RainbowParenthesesToggleAll<cr>
"let g:rbpt_colorpairs = [
    "\ ['brown',       'LightGreen'],
    "\ ['Darkblue',    'orange'],
    "\ ['darkgray',    'cyan1'],
    "\ ['darkgreen',   'HotPink'],
    "\ ['darkcyan',    'LightGreen'],
    "\ ['darkred',     'orange'],
    "\ ['darkmagenta', 'cyan1'],
    "\ ['brown',       'HotPink'],
    "\ ['gray',        'LightGreen'],
    "\ ['black',       'orange'],
    "\ ['darkmagenta', 'cyan1'],
    "\ ['Darkblue',    'HotPink'],
    "\ ['darkgreen',   'LightGreen'],
    "\ ['darkcyan',    'orange'],
    "\ ['darkred',     'cyan1'],
    "\ ['red',         'HotPink'],
    "\ ]
"auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = '<c-c>p'
let g:AutoPairsShortcutBackInsert = '<c-c>b'
let g:AutoPairsShortcutFastWrap = '<c-c>e'
let g:AutoPairsShortcutJump = '<c-c>n'
"UndotreeToggle
nnoremap <F5> :UndotreeToggle<CR>
"snipMate
let g:snipMate = { 'snippet_version' : 1 }
let g:my_email_addr = "<".system("echo -n `git config --get user.email`").">"
let g:snips_author = "Dmitry Kasimtsev"
"jedi
"let g:jedi#popup_on_dot = 0
if exists("g:neovide")
    let g:neovide_cursor_vfx_mode = "railgun"
    let g:neovide_cursor_animation_length = 0.13
    set gfn=Courier\ New:h12:el
    colo monochrome
    autocmd VimEnter * NERDTree
    lua require("toggleterm").setup()
    nmap <F4> :ToggleTerm<CR>
endif
