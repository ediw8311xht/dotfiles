
set keywordprg=$HOME/bin/elixir_keywordprg.sh
nnoremap <leader>p :execute 'vsplit' g:my_elixir_info<esc>
nnoremap <leader>vF :!mix format %<esc>
vnoremap <leader>vf :!mix format -<esc>

"------For-Mix-Projects------"
nnoremap <leader>vT :Mix test<esc>
nnoremap <leader>vC :Mix compile<esc>

hi Comment      gui=italic guibg=NONE guifg=#0070FF
