
set keywordprg="${HOME}/bin/elixir_keywordprg.sh"
nnoremap <buffer> <leader>vF :!mix format %<esc>
vnoremap <buffer> <leader>vf :!mix format -<esc>

"------For-Mix-Projects------"
nnoremap <buffer> <leader>vt :Mix test<esc>
nnoremap <buffer> <leader>vC :Mix compile<esc>

hi Comment      gui=italic guibg=NONE guifg=#0070FF
