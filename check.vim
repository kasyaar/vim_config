autocmd FileType python nmap <buffer> <Leader>f :cexpr system('flake8 '.expand('%'))<CR>
"autocmd FileType python nmap <buffer> <Leader>b :cexpr system('bandit -f custom -q '.expand('%'))<CR>
nmap <Leader>b :cexpr system('bandit -r . -f custom -q -x ./.venv')<CR>
"nmap <Leader>t :cexpr system('typos --format=brief '.expand('%'))<CR>
nmap <Leader>gt :cexpr system('typos --format=brief')<CR>
