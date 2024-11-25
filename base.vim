" NERDTree
nmap <Leader>p :NERDTreeToggle<cr>
vmap <Leader>p <esc>:NERDTreeToggle<cr>i
imap <Leader>p <esc>:NERDTreeToggle<cr>i
let g:NERDTreeFileLines = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 3
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif


" Tagbar
nmap <Leader>t :TagbarToggle<cr>
vmap <Leader>t <esc>:TagbarToggle<cr>i
imap <Leader>t <esc>:TagbarToggle<cr>i

" RainbowParentheses
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesToggle
nmap <Leader>rp :RainbowParenthesesToggleAll<cr>
let g:rbpt_colorpairs = [
            \ ['brown',       'LightGreen'],
            \ ['Darkblue',    'orange'],
            \ ['darkgray',    'cyan1'],
            \ ['darkgreen',   'HotPink'],
            \ ['darkcyan',    'LightGreen'],
            \ ['darkred',     'orange'],
            \ ['darkmagenta', 'cyan1'],
            \ ['brown',       'HotPink'],
            \ ['gray',        'LightGreen'],
            \ ['black',       'orange'],
            \ ['darkmagenta', 'cyan1'],
            \ ['Darkblue',    'HotPink'],
            \ ['darkgreen',   'LightGreen'],
            \ ['darkcyan',    'orange'],
            \ ['darkred',     'cyan1'],
            \ ['red',         'HotPink'],
         \ ]


" AutoPairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '<c-c>p'
let g:AutoPairsShortcutBackInsert = '<c-c>b'
let g:AutoPairsShortcutFastWrap = '<c-c>e'
let g:AutoPairsShortcutJump = '<c-c>n'

" Undotree
nnoremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
    if has('nvim')
        let target_path = expand('~/.vim/backup/nvim_undotree')
    else
        let target_path = expand('~/.vim/backup/vim_undotree')
    endif

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif


" SnipMate
let g:snipMate = { 'snippet_version' : 1 }
let g:my_email_addr = "<".system("echo -n `git config --get user.email`").">"
let g:snips_author = ''

" Fugitive
nmap <Leader>g :G<CR>
