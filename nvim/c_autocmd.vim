
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"<--------- LANGUAGE SPECIFIC CONFIGS -------------------------------------->
autocmd Filetype css                                    source ~/.config/nvim/language_specific/css.vim
autocmd Filetype html                                   source ~/.config/nvim/language_specific/html.vim
autocmd BufNewFile,BufRead ~/.bashrc                    source ~/.config/nvim/language_specific/bashrc.vim

autocmd BufNewFile,BufRead *.sh                         set syntax=bash
autocmd BufNewFile,BufRead *.ex,*.exs                   setfiletype elixir
autocmd BufNewFile,BufRead ~/.config/polybar/config     setfiletype dosini
autocmd BufNewFile,BufRead ~/.config/i3/*               setfiletype i3
autocmd BufNewFile,BufRead *.html                       setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.ex,*.exs                   setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
