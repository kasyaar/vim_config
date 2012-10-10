source ~/.vim/vam.cfg

set nocompatible 
"Подсвечивать найденный фрагменты
set hlsearch
set nowrap
set ts=4 sts=4 sw=4 expandtab
set nu
"set bg=dark
set foldmethod=indent
set autoindent
set smartindent
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

fu! RebuildCSTags()
    let extensions=['js','rb', 'php','py', 'vim','html', 'xml', 'xul', 'sh', 'erl', 'hrl']
    "find . -type file |grep -E '\.(html|sh|js|rb|py|vim|xul|xml|erl|hrl)$'
    let command = "find . -type f|grep -E '.*\\.(".join(extensions, '|').")$' > ./cscope.files && cscope -b"
    "echo command
    let out = system(command)
    cs reset
endf


nmap <Leader>r :call RebuildCSTags()<cr>
set bs=2
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"SHORTCUTS
"NERDTree
nmap <Leader>p :NERDTreeToggle<cr>
vmap <Leader>p <esc>:NERDTreeToggle<cr>i
imap <Leader>p <esc>:NERDTreeToggle<cr>i

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org call org#SetOrgFileType()

au BufNewFile,BufRead,BufWrite,BufWritePost ebt.config,reltool.config set ft=erlang
let g:my_email_addr = "dmitry.kasimtsev@strikead.com"
let g:snips_author = "Dmitry Kasimtsev"
let g:syntastic_erlc_attrs='-pa /home/kasyaar/workspace/rtb/out/production/*/ebin -pa /home/kasyaar/workspace/rtb/lib/*/ebin' 
