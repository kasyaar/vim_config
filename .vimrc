"Не совместимый с vi
set nocompatible 
"Подсвечивать найденный фрагменты
set hlsearch
set nowrap
set ts=2 sts=2 sw=2 expandtab
set nu
set bg=dark
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
" Слова откуда будем завершать
 set complete=""
 " Из текущего буфера
 set complete+=.
 " Из словаря
 set complete+=k
 " Из других открытых буферов
 set complete+=b
 " из тегов 
 set complete+=t

" Включаем filetype indent
filetype indent on
" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on

set autoread

nmap <c-c>; :%s/\<<c-r>=expand("<cword>")<cr>\>/
set pastetoggle=<Leader>v

fu! RebuildCSTags()
    let out = system("find . -name '*.*' > ./cscope.files && cscope -b")
    cs reset
endf

nmap <Leader>r :call RebuildCSTags()<cr>
set bs=2
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz



"SHORTCUTS
"NERDTree
nmap <Leader>p :NERDTreeToggle<cr>
vmap <Leader>p <esc>:NERDTreeToggle<cr>i
imap <Leader>p <esc>:NERDTreeToggle<cr>i
