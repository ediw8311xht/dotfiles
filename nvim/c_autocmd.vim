
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"<--------- LANGUAGE SPECIFIC CONFIGS -------------------------------------->

autocmd BufNewFile,BufRead *.sh                         set syntax=bash
autocmd BufNewFile,BufRead *.ex,*.exs                   setfiletype elixir
autocmd BufNewFile,BufRead ~/.config/polybar/config     setfiletype dosini
autocmd BufNewFile,BufRead *.kalker                     setfiletype kalker
autocmd BufNewFile,BufRead ~/.config/i3/*               setfiletype i3
autocmd BufNewFile,BufRead *.html,*.css                 setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.ex,*.exs                   setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd Filetype kalker                                 source ~/.config/nvim/language_specific/kalker.vim
autocmd Filetype css                                    source ~/.config/nvim/language_specific/css.vim
autocmd Filetype html                                   source ~/.config/nvim/language_specific/html.vim
autocmd Filetype elixir                                 source ~/.config/nvim/language_specific/elixir.vim
autocmd Filetype sh,bash                                source ~/.config/nvim/language_specific/bash.vim
autocmd BufNewFile,BufRead ~/.bashrc                    source ~/.config/nvim/language_specific/bashrc.vim
autocmd FocusGained,CursorHold,CursorHoldI * silent! checktime
"autocmd CursorHold * silent! checktime
"autocmd FileChangedShellPost *
"\ echohl WarningMsg | echo "File changed on by external program (not nvim). Buffer reloaded." | echohl None
