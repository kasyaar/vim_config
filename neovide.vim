if v:servername =~ '^[^/]\+:\d\+$' || exists("g:neovide")
    colo nord
    let g:neovide_cursor_vfx_mode = "railgun"
    let g:neovide_cursor_animation_length = 0.13
    luafile $HOME/.vim/gen.lua
  " host:port!
endif
