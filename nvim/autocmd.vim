
autocmd FocusGained,CursorHold,CursorHoldI * silent! checktime

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"<--------- LANGUAGE SPECIFIC CONFIGS -------------------------------------->
"autocmd Filetype vim setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufNewFile,BufRead ~/.config/zathura/*                  set syntax=zathurarc

autocmd BufNewFile *.sh         0read ${HOME}/.config/nvim/language_specific/templates/template.sh     | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.py         0read ${HOME}/.config/nvim/language_specific/templates/template.py     | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.kalker     0read ${HOME}/.config/nvim/language_specific/templates/template.kalker | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.exs        0read ${HOME}/.config/nvim/language_specific/templates/template.exs    | :silent w | :silent !chmod 700 %
autocmd BufNewFile *.ex         0read ${HOME}/.config/nvim/language_specific/templates/template.ex     | :silent w | :silent !chmod 600 %
autocmd BufNewFile *.html       0read ${HOME}/.config/nvim/language_specific/templates/template.html   | :silent w | :silent !chmod 600 %
autocmd BufNewFile *.cpp        0read ${HOME}/.config/nvim/language_specific/templates/template.cpp    | :silent w | :silent !chmod 600 %

autocmd BufNewFile,BufRead ~/.bashrc                            setfiletype bash
autocmd BufNewFile,BufRead ~/bashrc_files/*                     setfiletype bash
autocmd BufNewFile,BufRead *.sh                                 setfiletype bash
autocmd BufNewFile,BufRead ${HOME}/.config/polybar/*.ini     setfiletype dosini
autocmd BufNewFile,BufRead ${HOME}/.config/polybar/*/*.ini   setfiletype dosini
autocmd BufNewFile,BufRead *.kalker                             setfiletype kalker
autocmd BufNewFile,BufRead ${HOME}/.config/i3/*              setfiletype i3
autocmd BufNewFile,BufRead *.ex,*.exs                           setfiletype elixir

autocmd Filetype cpp                                            source ${HOME}/.config/nvim/language_specific/cpp.vim
autocmd Filetype css                                            source ${HOME}/.config/nvim/language_specific/css.vim
autocmd Filetype elixir                                         setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype elixir                                         source ${HOME}/.config/nvim/language_specific/elixir.vim
autocmd Filetype html                                           source ${HOME}/.config/nvim/language_specific/html.vim
autocmd Filetype kalker                                         source ${HOME}/.config/nvim/language_specific/kalker.vim
autocmd Filetype lisp                                           source ${HOME}/.config/nvim/language_specific/lisp.vim
autocmd Filetype lua                                            source ${HOME}/.config/nvim/language_specific/lua.vim
autocmd Filetype markdown                                       source ${HOME}/.config/nvim/language_specific/markdown.vim
autocmd Filetype sh,bash                                        source ${HOME}/.config/nvim/language_specific/bash.vim
autocmd BufNewFile,BufRead ~/.bashrc                            source ${HOME}/.config/nvim/language_specific/bashrc.vim


autocmd VimLeave * call ClipBoardExit()

"--------- HELP ---------"
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>

"---------- For Vim Help File ---------"
let pattern_a = join(["'", '\l{2,}', "'"], '')
let pattern_b = join(['[\|]', '\zs\S+\ze','[\|]'], '')
let combined  = join([pattern_a, pattern_b], '\|') 

let g:bindings_help_buffer=[
    \[  'CR',   '<C-]>'],
    \[  'BS',   '<C-T>'],
    \[  'o',    join(['/\v(', combined, ')<CR>' ], '')   ],
    \[  'O',    join(['?\v(', combined, ')<CR>' ], '')   ],
\]
"call M_Map('nnoremap', g:bindings_help_buffer)
autocmd FileType help call M_Map("nnoremap <buffer>", g:bindings_help_buffer)

autocmd TermOpen * setlocal statusline=%{b:term_title}

"autocmd FileType help call call('M_Map', mapping_g + ['o'] + [bar])
"autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>

"autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
"autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>

"autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
"autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
"autocmd BufRead * call matchadd("ExtraWhiteSpace", '/[^\s]\s\+\zs$/') 
"autocmd FileChangedShellPost * "\ echohl WarningMsg | echo "File changed on by external program (not nvim). Buffer reloaded." | echohl None



