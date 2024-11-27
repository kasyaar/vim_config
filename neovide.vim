"if exists("g:neovide")
if has('nvim')
    let g:neovide_cursor_vfx_mode = "railgun"
    let g:neovide_cursor_animation_length = 0.13
    colo nord

    lua require("toggleterm").setup()
    nmap <F4> :ToggleTerm<CR>
    nmap <C-F4> :ToggleTerm direction=float<CR>
endif
