let g:coc_global_extensions = ['coc-git', '@yaegassy/coc-pylsp', 'coc-docker', 'coc-spell-checker', 'coc-prettier']
autocmd FileType python let b:coc_root_patterns = ['.git', '.venv']
source $HOME/.vim/coc-git.vim
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
