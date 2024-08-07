
"    " -- HTML Tags -- "
"inoremap <buffer> <C-l>   <esc>:call  search("[<][^>]*[>]")           <enter>a
"inoremap <buffer> <C-h>   <esc>:call  search("[<][^>]*[>]", "b")      <enter>a
"inoremap <buffer> <C-q>   <esc>:call  search("[<][^>]*\\zs[>]", "b")  <enter>a
"inoremap <buffer> <C-w>   <esc>:call  search("[<][^>]*\\zs[>]")       <enter>a
"nnoremap <buffer> <C-f>   <esc>vit
"
"vnoremap <buffer> <C-l>   /\v[<][^>]*[>]<enter>
"vnoremap <buffer> <c-h>   ?\v[<][^>]*[>]<enter>
"vnoremap <buffer> <C-q>   ?\v\v[<][^>]*[>]<enter>
"vnoremap <buffer> <C-w>   /\v[<][^>]*\\zs[>]<enter>
"
"nnoremap <buffer> <leader>m i<span class="math inline">\(\)</span><esc>F(a
""nnoremap <leader>M 0f(a
"nnoremap <buffer> <leader>vp :%!tidy --parser="html"<esc>
"nnoremap <buffer> <leader>x  :!xmllint %<esc>
"
""nnoremap <leader>r  i<img src="images/"/><esc>F"i
""nnoremap <leader>R :!qutebrowser ":reload"<esc>
setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
