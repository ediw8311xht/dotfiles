
    " -- HTML Tags -- "
inoremap <C-l>   <esc>:call  search("[<][^>]*[>]")       <enter>a
inoremap <c-h>   <esc>:call  search("[<][^>]*[>]", "b")  <enter>a
inoremap <C-q>   <esc>:call search("[<][^>]*[>]", "b")   <enter>i
inoremap <C-w>   <esc>:call  search("[<][^>]*\\zs[>]")   <enter>a
nnoremap <C-f>   <esc>vit

