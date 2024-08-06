
set keywordprg="${HOME}/bin/elixir_keywordprg.sh"
let g:my_elixir_test="${HOME}/TEST/test_elixir/test.exs"
nnoremap <buffer> <leader>pi  :execute 'vsplit' g:my_elixir_info<esc>
nnoremap <buffer> <leader>pt :execute 'vsplit' g:my_elixir_test<esc>

nnoremap <buffer> <leader>vF :!mix format %<esc>
vnoremap <buffer> <leader>vf :!mix format -<esc>

"------For-Mix-Projects------"
nnoremap <buffer> <leader>vt :Mix test<esc>
nnoremap <buffer> <leader>vC :Mix compile<esc>

hi Comment      gui=italic guibg=NONE guifg=#0070FF
