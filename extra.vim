let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
autocmd BufRead,BufNewFile gen.nvim setlocal foldmethod=manual
"gen.nvim
if has("nvim")
    luafile $HOME/.vim/gen.lua
    luafile $HOME/.vim/codecompanion.lua
    luafile $HOME/.vim/avante.lua
endif
