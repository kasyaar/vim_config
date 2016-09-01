fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

" ACTIVATING PLUGINS

" OPTION 1, use VAMActivate
"VAMActivate PLUGIN_NAME PLUGIN_NAME ..

" OPTION 2: use call vam#ActivateAddons
"call vam#ActivateAddons([PLUGIN_NAME], {})
call vam#ActivateAddons([ 
            \"neosnippet",
            \"neosnippet-snippets",
            \"github:Shougo/neocomplete.vim",
            \"github:wting/rust.vim",
            \"github:jtratner/vim-flavored-markdown",
            \"github:tpope/vim-fugitive",
            \"github:mattn/emmet-vim", 
            \"github:tpope/vim-classpath",
            \"github:guns/vim-clojure-static",
            \"github:kien/rainbow_parentheses.vim",
            \"eclipse", 
            \"github:kasyaar/syntastic",
            \"FuzzyFinder",
            \"bufexplorer.zip",
            \"github:garbas/vim-snipmate",
            \"github:honza/vim-snippets",
            \"github:rprimus/vim-snipmate-erlang", 
            \"github:scrooloose/nerdtree",
            \"github:scrooloose/nerdcommenter",
            \"github:jdevera/vim-protobuf-syntax",
            \"github:jeroenbourgois/vim-actionscript",
            \"github:oscarh/vimerl"
            \], {'auto_install' : 0})
" use <c-x><c-p> to complete plugin names

" OPTION 3: Create a file ~/.vim-srcipts putting a PLUGIN_NAME into each line
" See lazy loading plugins section in README.md for details
"call vam#Scripts('~/.vim-scripts', {'tag_regex': '.*'})
