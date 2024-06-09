
set keywordprg=$HOME/bin/elixir_keywordprg.sh
let g:my_elixir_test="${HOME}/TEST/test_elixir/test.exs"
nnoremap <leader>pi  :execute 'vsplit' g:my_elixir_info<esc>
nnoremap <leader>pt :execute 'vsplit' g:my_elixir_test<esc>

nnoremap <leader>vF :!mix format %<esc>
vnoremap <leader>vf :!mix format -<esc>

"------For-Mix-Projects------"
nnoremap <leader>vt :Mix test<esc>
nnoremap <leader>vC :Mix compile<esc>

hi Comment      gui=italic guibg=NONE guifg=#0070FF
