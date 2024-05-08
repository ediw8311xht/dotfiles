
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"<--------- LANGUAGE SPECIFIC CONFIGS -------------------------------------->

autocmd BufNewFile,BufRead *.sh                                 set syntax=bash
autocmd BufNewFile,BufRead *.ex,*.exs                           setfiletype elixir
autocmd BufNewFile,BufRead ${XDG_CONFIG_HOME}/polybar/*.ini     setfiletype dosini
autocmd BufNewFile,BufRead ${XDG_CONFIG_HOME}/polybar/*/*.ini   setfiletype dosini
autocmd BufNewFile,BufRead *.kalker                             setfiletype kalker
autocmd BufNewFile,BufRead ${XDG_CONFIG_HOME}/i3/*              setfiletype i3
autocmd BufNewFile,BufRead *.html,*.css                         setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.ex,*.exs                           setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd Filetype kalker                                         source ${XDG_CONFIG_HOME}/nvim/language_specific/kalker.vim
autocmd Filetype css                                            source ${XDG_CONFIG_HOME}/nvim/language_specific/css.vim
autocmd Filetype html                                           source ${XDG_CONFIG_HOME}/nvim/language_specific/html.vim
autocmd Filetype elixir                                         source ${XDG_CONFIG_HOME}/nvim/language_specific/elixir.vim
autocmd Filetype sh,bash                                        source ${XDG_CONFIG_HOME}/nvim/language_specific/bash.vim
autocmd Filetype markdown                                       source ${XDG_CONFIG_HOME}/nvim/language_specific/markdown.vim
autocmd BufNewFile,BufRead ~/.bashrc                            source ${XDG_CONFIG_HOME}/nvim/language_specific/bashrc.vim

autocmd FocusGained,CursorHold,CursorHoldI * silent! checktime

autocmd BufNewFile *.sh         0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.sh     | :w | :!chmod 700 %
autocmd BufNewFile *.py         0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.py     | :w | :!chmod 700 %
autocmd BufNewFile *.kalker     0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.kalker | :w | :!chmod 700 %
autocmd BufNewFile *.ex,*.exs   0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.ex     | :w | :!chmod 700 %
autocmd BufNewFile *.html       0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.html   | :w | :!chmod 600 %
"autocmd CursorHold * silent! checktime
"autocmd FileChangedShellPost *
"\ echohl WarningMsg | echo "File changed on by external program (not nvim). Buffer reloaded." | echohl None
