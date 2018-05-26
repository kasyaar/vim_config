source ~/.vim/plug.vim


set nocompatible 
" highlight found words
set hlsearch
set nowrap
set ts=4 sts=4 sw=4 expandtab
set nu "set bg=dark set foldmethod=indent
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
set backupdir=~/.vim/backup
set directory=~/.vim/backup
" session options
set sessionoptions=curdir,buffers,tabpages
" show completion menu for only one founded completion
set cot+=menuone

" Activate filetype indent
filetype indent on
" Activate filetype plugin.
filetype plugin on

set autoread

inoremap () ()<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

nmap <c-c>; :%s/\<<c-r>=expand("<cword>")<cr>\>/
set pastetoggle=<Leader>v


"cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  if filereadable("cscope.out")
    cs add cscope.out
  endif
endif
fu! RebuildCTags()
    let command = "ctags --langmap=Lisp:.clj.cljs -R"
    let out = system(command)
endf
fu! RebuildCSTags()
    let extensions=['clj', 'js','rb', 'php','py', 'vim','html', 'xml', 'xul', 'sh', 'erl', 'hrl']
    "find . -type file |grep -E '\.(html|sh|js|rb|py|vim|xul|xml|erl|hrl)$'
    let command = "find . -type f|grep -E '.*\\.(".join(extensions, '|').")$' > ./cscope.files && cscope -b"
    "echo command
    let out = system(command)
    cs reset
endf
nmap <Leader>r :call RebuildCSTags()<cr>
nmap <Leader>rc :call RebuildCTags()<cr>

"/cscope
set bs=2
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:NERDSpaceDelims = 1


"SHORTCUTS
"NERDTree
nmap <Leader>p :NERDTreeToggle<cr>
vmap <Leader>p <esc>:NERDTreeToggle<cr>i
imap <Leader>p <esc>:NERDTreeToggle<cr>i

"fugitive
"Gstatus
nmap <Leader>gs :Gstatus<cr>
vmap <Leader>gs <esc>:Gstatus<cr>
imap <Leader>gs <esc>:Gstatus<cr>
"Gpush
nmap <Leader>gp :Git push<cr>
vmap <Leader>gp <esc>:Git push<cr>
imap <Leader>gp <esc>:Git push<cr>
"Gcommit
nmap <Leader>gci :Gcommit<cr>
"Git
nmap <Leader>g :Git 

"cscope
nmap <c-f>c :cs find c <cword><cr>
nmap <c-f>e :cs find e <cword><cr>

"grip
nmap <c-g>b :!grip --gfm --wide -b '%:p'<cr>
nmap <c-g>e :!grip --gfm --wide --export '%:p'<cr>

"search current word in whole doc
nmap <c-f>f :/<c-r>=expand("<cword>")<cr><cr>

"rainbow parentheses
nmap <Leader>rp :RainbowParenthesesToggleAll<cr>

nmap <c-c>; :%s/\<<c-r>=expand("<cword>")<cr>\>/


fu! SetAuthorMode()
    set tw=80
endf

fu! SetMarkdownMode()
    set tw=0
endf

ia td <C-R>=strftime("%d-%m-%y")<CR>
ia tm <C-R>=strftime("%d-%m-%y", localtime() + 24*60*60)<CR>
ia yd <C-R>=strftime("%d-%m-%y", localtime() - 24*60*60)<CR>


au BufNewFile,BufRead,BufWrite,BufWritePost *.txt call SetAuthorMode()
au BufNewFile,BufRead,BufWrite,BufWritePost *.md call SetMarkdownMode()

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadBraces
"NERD
let NERD_erlang_alt_style=1


let g:my_email_addr = "<".system("echo -n `git config --get user.email`").">"
let g:snips_author = "Dmitry Kasimtsev"

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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:UltiSnipsListSnippets="<c-l>"
