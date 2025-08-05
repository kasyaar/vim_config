let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"gen.nvim
if has("nvim")
    luafile $HOME/.vim/gen.lua
endif
