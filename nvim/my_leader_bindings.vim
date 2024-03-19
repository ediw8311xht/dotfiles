
source ${HOME}/.config/nvim/my_functions.vim
"----------------------------------
"-- Leader Bindings              --
"----------------------------------
call L( 'oc'       ,    'q:iput=execute("")<esc>A<C-c>')
call L( 'op'       ,    'q:<C-p><esc>Iput =execute("<esc>A")<esc>A<C-c>')
call L( 'ox'       ,    ':put     =execute("<C-r>0")<esc>')
call L( 'out'      ,    'q:iput =execute("<C-r>0")<esc>A<C-c>')
call L( 'a'        ,    ':call Toggle(g:coc_enabled, 0, ":CocEnable", ":CocDisable")<esc>')
call L( 'b'        ,    ':ls<CR>:b<Space>')
call L( 'c'        ,    ':set nocursorline!<esc>')
call L( 'e'        ,    ':set cursorcolumn!<esc>')
call L( 'u'        ,    ':Lf<esc>')
call L( 'f'        ,    ':set wrap!<esc>')
call L( 'g'        ,    ':enew<esc>')
call L( 'h'        ,    ':call Toggle(&ls, 0, "set ru \| set ls=2", "set noru \| set ls=0")<esc><C-L>')
call L( 'n'        ,    ':next<esc>')
call L( 'q'        ,    ':bd')
call L( 'D'        ,    ':bdelete<esc><enter>')
call L( 'ZC'       ,    ':bd<esc>')
call L( 'ZG'       ,    ':bd!<esc>')
call L( 'tcc'      ,    ':tabclose<esc>')
call L( 'tt'       ,    ':tabnew<esc>')
call L( 'tn'       ,    ':tabmove +1<esc>')
call L( 'tp'       ,    ':tabmove -1<esc>')
call L( 'tb'       ,    ':tabmove -1<esc>')
call L( 'tm'       ,    ':tabmove')
call L( 'tf'       ,    ':tabfirst<esc>')
call L( 'tl'       ,    ':tablast<esc>')
call L( 'tB'       ,    ':tabmove -1<esc>')
call L( 'tN'       ,    ':tabmove +1<esc>')
call L( 'vf'       ,    '?<C-r>"<enter>')
call L( 'vm'       ,    ':put =eval("<C-r>0")')
call L( 'vq'       ,    ':put =eval("<C-r>0")<esc>')
call L( 'vv'       ,    ':call Cycle(["none", "all", "block"], &ve, ["set ve=all \| echo &ve", "set ve=block \| echo &ve", "set ve=none \| echo &ve"], 0)<CR>')
call L( 'vl'       ,    ':call Toggle(&cc, 0, "set cc=80", "set cc=0")<esc>')
call L( 'w'        ,    ':w<esc>')
call L( 'x'        ,    ':w<esc>:!%:p<esc>')
call L( 'X'        ,    ':w<esc>:!%:p ')
call L( 'y'        ,    ':hi Normal guibg=Transparent<esc>')
call L( 'z'        ,    'z')
call L( 'B'        ,    ':Buffers<esc>')
call L( 'H'        ,    ':vert helpgrep ')
call L( 'k'        ,    ':call CorrectColors()<CR>')
call L( 'l'        ,    ':call CycleBackground(+1)<CR>')
call L( 'L'        ,    ':call CycleBackground(-1)<CR>')
call L( 'j'        ,    ':call CycleColor(+1)<CR>')
call L( 'J'        ,    ':call CycleColor(-1)<CR>')
call L( 'M'        ,    ':messages<esc>')
call L( 'N'        ,    ':cnext<esc>')
call L( 'WW'       ,    ':Bracey<esc>')
call L( 'WC'       ,    ':BraceyStop<esc>')
call L( 'T'        ,    ':term<esc>')
call L( 'W'        ,    ':call Web("f")<esc>i')
call L( 'Gm'       ,    ':call GetMappings()<CR>')
call L( '<leader>' ,    '<C-^>')
call L( ','        ,    '<C-^>')
call L( ';'        ,    ':ls<CR>:b<Space>')
call L( '/'        ,    ':Explore<CR>')
call L( '['        ,    ':bprevious<CR>:noh<esc><C-L>')
call L( ']'        ,    ':bnext<CR>:noh<esc><C-L>')
call L( 'dm'       ,    ':delmark')
call L( 'df'       ,    ':%s/\s\+\ze$//gc<esc>')
call L( 'CH'       ,    ':checkhealth<esc>')
call L( 's'        ,    ':source ~/.config/nvim/init.vim<esc>')
let g:subshell_begin=join(['####################', '( #-START-SUBSHELL-#', '####################'], "\n")
let g:subshell_end=join(  ['####################', ') #---END-SUBSHELL-#', '####################'], "\n")
call L( 'Sb'       ,    ':put =subshell_begin<esc>')
call L( 'Se'       ,    ':put =subshell_end<esc>')

"---------------------------------------------------
"-- Map  (Normal, Visual, Select, OperatorPending --
"---------------------------------------------------
    "map <Space> <leader>
    map , <leader>
    map + g_
"----------------------------------
"-- Visual                       --
"----------------------------------

    vn <leader>x c<esc>l:execute "normal! i" . eval('<C-r>"')<esc>
    vn im :s/\%V[ \t]*//<esc>| "REMOVE TABS ON VISUAL SELECTION
    vn <Enter> zf
    "-- Math --"
        vn <leader>M :!dc<esc>
        vn <leader>m :!bc<esc>
        vn <leader>c :!column -t<enter>
"----------------------------------
"-- Normal                       --
"----------------------------------
    "nn <esc> <C-w>
    " -- MOVE BETWEEN PANELS
        nn <C-H> <C-w>h
        nn <C-J> <C-w>j
        nn <C-K> <C-w>k
        nn <C-L> <C-w>l
    " -- ESCAPE CLEAR STATUSLINE -- "
        nn <esc> :noh<esc>:echon ''<enter>
    no <leader>zaf gg/<C-r>0<esc>jVnkzf
    nn <C-p> <C-i>
    nn / /\v\c
    nn ? ?\v\c
    nn <C-_> /\v
    nn \ /\V\c
    nn \| ?\V\c
    nn <C-\> /\V
    nn <lt> :tabprevious<esc>
    nn > :tabnext<esc>
    nn x "xx
    nn <C-w>n    :new<esc><C-w>L
    "nn <Backspace> :call search("f", "b", line("."))<esc>
    "sil nn <silent><esc> :noh<esc>
    sil nn <Enter> @=(foldlevel('.')?'za':"\<Space>")<CR>
"----------------------------------
"-- Insert                       --
"----------------------------------
    " -- Scroll Coc Popup -- "
"        if has('nvim-0.4.0') || has('patch-8.2.0750')
"          nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"          nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"          inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"          inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"          vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"          vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"        endif
    " -- Edit Normal Mode -- "
        inoremap    jk <esc>
    " -- Emacs Like Bindings for Insert Mode -- "
        inoremap <C-a>     <esc>I
        inoremap <C-b>     <left>
        inoremap <C-e>     <esc>A
        inoremap <C-f>     <right>
        inoremap <C-K>     <esc>lC
        inoremap <C-\>     <esc>ui
        inoremap <C-v>     <esc><C-r>i
        "inoremap <C-Space> <esc>:call  search("[<][^>]*\\zs[>]")    <enter>a
"       "inoremap <C-l> <esc>/\v[<][^>]*[>]<enter>:noh<esc><C-L>a
"----------------------------------
"-- Terminal                     --
"----------------------------------
    " -- Exit Terminal and Change Buffer -- "
    "tnoremap <leader><leader> <C-\><C-n>:Buffers<esc>
    "tmap <leader>. <C-\><C-n>:bnext<esc>
    "tmap <leader><esc> <C-\><C-n>
    "tmap <leader>G <C-\><C-n>iohttp://localhost:4842<enter>
    tmap <C-w> <C-\><C-n>
"-- exit terminal = ctrl-\ ctrl-n --"

"nn dd "Ddd
"nn    D "DD
"nn cc "Ccc
"nn    C "CC
"nn C "Cd
"map <leader> :Lf<CR>
" Take last command line command to use to output to neovim
" BELOW 4 lines do that riff on that
"<--------- STATUS LINE ---------------------------------------------------->

" -----------------REMEMBER-----------------
" &      - (normal mode) repeat last substitution "
" ctrl+o - (insert mode) execute 1 normal command "


"map <c-b> nn <leader>bb :buffers<cr>:b<space>
"nn <leader><leader> :<backspace>
"nn <leader>ap :let @+="<c-r>1<c-r>0"
"1+2
"vn <leader>vq q:o<c-c>put =execute(' <C-R>0')

"nn <leader>mq :put =execute('echo <c-r>0')<esc>
"vn <leader>c c<esc>l:execute "normal! i" . execute("!<C-r>"")<esc>
"<--------- EXTRA ---------------------------------------------------------->
"augroup bashiez
"    au!
"    autocmd BufNewFile,BufRead *.sh set syntax=zsh
"augroup END
"<--------- INFO ----------------------------------------------------------->
"     %<"                             _-_is expanded to the name of the current buffer.

"     :help key-notation                _-_for list of keys and their names.
"     :only                             _-_make split only one.
"     :let                            _-_list all options and their values.
"     :put =Execute("map")            _-_output of command into nvim.
"<-------------------------------------------------------------------------->


"hi default link CocErrorVirtualText         CocErrorSign
"hi default link CocWarningVirtualText         CocErrorSign
"hi default link CocInfoVirtualText            CocErrorSign
"hi default link CocHintVirtualText            CocErrorSign
"hi default link CocErrorHighlight             CocErrorSign
"hi default link CocWarningHighlight         CocErrorSign
"hi default link CocInfoHighlight            CocErrorSign
"hi default link CocHintHighlight            CocErrorSign
"hi default link CocErrorFloat                 CocErrorSign
"hi default link CocWarningFloat             CocErrorSign
"hi default link CocInfoFloat                CocErrorSign
"hi default link CocHintFloat                CocErrorSign
"hi default link CocCursorRange                CocErrorSign
"hi default link CocHoverRange                 CocErrorSign
"hi MatchParen            cterm=NONE ctermbg=NONE ctermfg=NONE gui=reverse
"hi cursorcolumn        gui=bold,italic,reverse
"hi Normal                cterm=NONE ctermbg=17     ctermfg=NONE gui=NONE    guibg=NONE    guifg=#ffffff
"hi Visual                cterm=NONE ctermbg=NONE ctermfg=16     gui=NONE guibg=#333333 guifg=#00ff00
"hi NonText             cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE    guifg=NONE
"hi CocSearch             cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#FF0000 guifg=#000000
"hi CocMenuSel            cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#FF0000 guifg=#000000
"hi CocErrorHighlight     cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#FF0000 guifg=#000000
"hi CocErrorSign        cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#FF0000 guifg=#000000
"hi CocWarningSign        cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#FF0000 guifg=#000000
"hi CocInfoSign         cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#FF0000 guifg=#000000
"hi CocHintSign         cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#FF0000 guifg=#000000
"hi htmlTag                                                    gui=reverse guifg=#90b0d1 guibg=#000033
"hi htmlSpecialTagName                                         gui=reverse
"hi html gui=reverse
"hi htmlTagName                                                gui=NONE guifg=#90b0d1 guibg=#000033
"hi htmlEndTag                                                 gui=NONE guifg=#000000 guibg=#ffffff
"


