
autocmd FocusGained,CursorHold,CursorHoldI * silent! checktime

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"<--------- LANGUAGE SPECIFIC CONFIGS -------------------------------------->

"autocmd BufNewFile,BufRead ~/.bashrc                            set syntax=bash
"autocmd BufNewFile,BufRead ~/bashrc_files/*                     set syntax=bash
autocmd BufNewFile,BufRead *.sh                                 set syntax=bash
autocmd BufNewFile,BufRead ${XDG_CONFIG_HOME}/polybar/*.ini     setfiletype dosini
autocmd BufNewFile,BufRead ${XDG_CONFIG_HOME}/polybar/*/*.ini   setfiletype dosini
autocmd BufNewFile,BufRead *.kalker                             setfiletype kalker
autocmd BufNewFile,BufRead ${XDG_CONFIG_HOME}/i3/*              setfiletype i3
autocmd BufNewFile,BufRead *.ex,*.exs                           setfiletype elixir
autocmd BufNewFile,BufRead *.ex,*.exs                           setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd Filetype kalker                                         source ${XDG_CONFIG_HOME}/nvim/language_specific/kalker.vim
autocmd Filetype css                                            source ${XDG_CONFIG_HOME}/nvim/language_specific/css.vim
autocmd Filetype html                                           source ${XDG_CONFIG_HOME}/nvim/language_specific/html.vim
autocmd Filetype elixir                                         source ${XDG_CONFIG_HOME}/nvim/language_specific/elixir.vim
autocmd Filetype sh,bash                                        source ${XDG_CONFIG_HOME}/nvim/language_specific/bash.vim
autocmd Filetype markdown                                       source ${XDG_CONFIG_HOME}/nvim/language_specific/markdown.vim
autocmd BufNewFile,BufRead ~/.bashrc                            source ${XDG_CONFIG_HOME}/nvim/language_specific/bashrc.vim


autocmd BufNewFile *.sh         0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.sh     | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.py         0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.py     | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.kalker     0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.kalker | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.exs        0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.exs    | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.ex         0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.ex     | :silent w | :silent !chmod 600 %
autocmd BufNewFile *.html       0read ${XDG_CONFIG_HOME}/nvim/language_specific/templates/template.html   | :silent w | :silent !chmod 600 %
"autocmd CursorHold * silent! checktime
"autocmd FileChangedShellPost *
"\ echohl WarningMsg | echo "File changed on by external program (not nvim). Buffer reloaded." | echohl None
