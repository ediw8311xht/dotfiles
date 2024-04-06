
    " -- HTML Tags -- "
inoremap <C-l>   <esc>:call  search("[<][^>]*[>]")           <enter>a
inoremap <C-h>   <esc>:call  search("[<][^>]*[>]", "b")      <enter>a
inoremap <C-q>   <esc>:call  search("[<][^>]*\\zs[>]", "b")  <enter>a
inoremap <C-w>   <esc>:call  search("[<][^>]*\\zs[>]")       <enter>a
nnoremap <C-f>   <esc>vit

vnoremap <C-l>   /\v[<][^>]*[>]<enter>
vnoremap <c-h>   ?\v[<][^>]*[>]<enter>
vnoremap <C-q>   ?\v\v[<][^>]*[>]<enter>
vnoremap <C-w>   /\v[<][^>]*\\zs[>]<enter>

nnoremap <leader>m i<span class="math inline">\(\)</span><esc>F(a
nnoremap <leader>M 0f(a
nnoremap <leader>vp :%!prettier --parser="html"<esc>

nnoremap <leader>r  i<img src="images/"/><esc>F"i
nnoremap <leader>rO :!qutebrowser %<esc>
"nnoremap <leader>R :!qutebrowser ":reload"<esc>
