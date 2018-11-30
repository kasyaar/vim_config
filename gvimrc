" Start without the toolbar
" set guioptions-=T
color desert
" Project Tree
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . a:directory
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif
endfunction

