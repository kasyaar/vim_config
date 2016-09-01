source ~/.vim/vam.vim


set nocompatible 
"Подсвечивать найденный фрагменты
set hlsearch
set nowrap
set ts=4 sts=4 sw=4 expandtab
set nu "set bg=dark set foldmethod=indent
set autoindent
set smartindent
set bg=dark
" Не выгружать буферы при переключении
set hidden
syntax on
"set spell
set spelllang=ru,en
set termencoding=utf8
set fileencodings=utf8,cp1251
set encoding=utf8
set incsearch
set vb t_vb= 
" Поддержка мыши
set mouse=a
set mousemodel=popup
" Папка для swp файлов(дабы не захламлять working dir)
set backupdir=~/.vim/backup
set directory=~/.vim/backup
" Опции сесссий
set sessionoptions=curdir,buffers,tabpages
" show completion menu for only one founded completion
set cot+=menuone

" Включаем filetype indent
filetype indent on
" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on

set autoread

inoremap () ()<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

nmap <c-c>; :%s/\<<c-r>=expand("<cword>")<cr>\>/
set pastetoggle=<Leader>v

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

let vimclojure#SetupKeyMap = 0

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

"Fuzzy finder
nmap <Leader>f :FufTaggedFile<cr>
nmap <Leader>fc :FufCoverageFile<cr>
nmap <Leader>fr :FufTaggedFile <c-r>=expand("<cword>")<cr><cr>

"cscope
nmap <c-f>c :cs find c <cword><cr>
nmap <c-f>e :cs find e <cword><cr>

"grip
nmap <c-g>b :!grip --gfm --wide -b '%:p'<cr>
nmap <c-g>e :!grip --gfm --wide --export '%:p'<cr>

"search current word in whole doc
nmap <c-f>f :/<c-r>=expand("<cword>")<cr><cr>

"rainbow paren
nmap <Leader>rp :RainbowParenthesesToggleAll<cr>

nmap <c-c>; :%s/\<<c-r>=expand("<cword>")<cr>\>/
"
" vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vu :VimuxScrollUpInspect<CR>
map <Leader>vd :VimuxScrollDownInspect<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>


fu! SetAuthorMode()
    set tw=80
endf

fu! SetMarkdownMode()
    set tw=0
endf

au BufNewFile,BufRead,BufWrite,BufWritePost todo set ft=todo

ia td <C-R>=strftime("%d-%m-%y")<CR>
ia tm <C-R>=strftime("%d-%m-%y", localtime() + 24*60*60)<CR>
ia yd <C-R>=strftime("%d-%m-%y", localtime() - 24*60*60)<CR>


au BufNewFile,BufRead,BufWrite,BufWritePost *.txt call SetAuthorMode()
au BufNewFile,BufRead,BufWrite,BufWritePost *.md call SetMarkdownMode()

au BufNewFile,BufRead,BufWrite,BufWritePost *.cljs set ft=clojure
" au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadBraces
"NERD
let NERD_erlang_alt_style=1

"vimux
let g:VimuxHeight = "40"
let g:VimuxPromptString = ">> "


"vimux
let g:VimuxHeight = "40"
let g:VimuxPromptString = ">> "


let g:my_email_addr = "<".system("echo -n `git config --get user.email`").">"
let g:snips_author = "Dmitry Kasimtsev"
let g:syntastic_erlc_include_path='/home/kasyaar/workspace/rtb/out/production/*/ebin /home/kasyaar/workspace/rtb/lib/*/ebin' 
let g:calendar_monday = 1
let g:neocomplete#enable_at_startup = 1

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

let g:NERDCustomDelimiters = {
    \'erlang': { 'leftAlt': '% ','rightAlt': '', 'left': '%% ', 'right': '' },
\}

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
