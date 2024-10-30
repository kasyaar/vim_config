if exists("g:neovide")
    let g:neovide_cursor_vfx_mode = "railgun"
    let g:neovide_cursor_animation_length = 0.13
    set gfn=Courier\ New:h12:el
    colo monochrome
    autocmd VimEnter * NERDTree
    lua require("toggleterm").setup()
    nmap <F4> :ToggleTerm<CR>
    nmap <C-F4> :ToggleTerm direction=float<CR>
endif
