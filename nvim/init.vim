
"<==============================================================================>
"<==------------------======================================------------------==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==-----    ||||-----==__________________________________==-----    ||||-----==>
"<==-    ||||||||||||-==                                  ==-    ||||||||||||-==>
"<==-    ||||||||||||-== Vim Config -> Maximilian Ballard ==-    ||||||||||||-==>
"<==-----    ||||-----==__________________________________==-----    ||||-----==>
"<==-----    ||||-----==                                  ==-----    ||||-----==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==------------------======================================------------------==>
"<==============================================================================>
"<==============================================================================>

"<--------- MY VARS -------------------------------------------------------->
let jam        = 'hi FoldColumn gui=bold guibg=NONE guifg=#00ff00'
let GreatJammy = ':call CorrectColors()'
let g:myScheme = [ 'pop-punk', 'eldar', 'elflord', 'delek', 'morning', 'blue', 'peachpuff', 'industry'] + [ 'cyberpunk-neon' ]
let g:mySpec   = [        ".",     jam,       ".",     ".",       ".",    ".",         '.',        '.'] + [ GreatJammy ]
let g:myBg     = [ "#000000", "#333333", "#111111", "#220000", "#002200", "#000022", "#002244" ] + [ "NONE" ]
let g:myFg     = [         ".",         ".",         ".",         ".",         ".",         ".", "#aaawaa" ] + [ "." ]
let g:python3_host_prog="/usr/bin/python"

" Color superfluous whitespace at end of lines "
match ExtraWhiteSpace /[^\s]\s\+\zs$/

"<--------- FUNCTIONS ------------------------------------------------------>
fu! CorrectColors()
    hi ExtraWhiteSpace  cterm=NONE ctermbg=gray ctermfg=NONE    gui=NONE    guibg=#0099FF
    hi Normal                                   ctermbg=black   gui=NONE    guibg=#000000
    hi Comment                                                  gui=BOLD    guibg=#404040 guifg=#000000
    hi StatusLine       cterm=NONE ctermbg=NONE ctermfg=160     gui=NONE    guibg=#000033 guifg=#00FF00
    hi StatusLineNC     cterm=NONE ctermbg=NONE ctermfg=160     gui=NONE    guibg=#444444 guifg=#000000
    hi FoldColumn       cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC  guibg=NONE    guifg=#00FF00
    hi Folded           cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC  guibg=NONE    guifg=#444444
    hi CursorLine       cterm=BOLD ctermfg=NONE ctermbg=18      gui=BOLD    guibg=#111111 guifg=NONE
    hi CursorLineNr     cterm=BOLD ctermfg=NONE ctermbg=18      gui=NONE    guibg=NONE    guifg=#FFFF00
    hi SignColumn       cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC  guibg=NONE    guifg=#000000
    hi LineNr           cterm=NONE ctermbg=NONE ctermfg=NONE    gui=NONE    guibg=#000000 guifg=#AAAAAA
    hi LineNrAbove      cterm=NONE ctermbg=NONE ctermfg=NONE    gui=NONE    guibg=#000000 guifg=#00AAFF
    hi TabLine                                                  gui=NONE    guibg=#222222 guifg=#999999
    hi TabLineSel                                               gui=BOLD    guibg=#000000 guifg=#00FF00
    hi MarkSignNumHL                                            gui=NONE    guibg=none    guifg=NONE
    hi MarkSignVirtTextHL                                       gui=NONE    guibg=NONE    guifg=#00FF00
    hi IncSearch        cterm=NONE ctermbg=white ctermfg=black  gui=NONE    guibg=#FF0000 guifg=#000000
    hi Search           cterm=NONE ctermbg=white ctermfg=black  gui=NONE    guibg=#FFFFFF guifg=#000000
    "<--------------------------------COC----------------------------------->
    hi CocWarningHighlight      gui=UNDERLINE
    hi CocHintHighlight         gui=NONE        guibg=#00FFFF guifg=#000000
    hi CocInfoHighlight         gui=NONE        guibg=#00AA00 guifg=#000000
    hi CocDeprecatedHighlight   gui=NONE        guibg=#333333 guifg=#999900
    hi CocFadeOut               gui=NONE        guibg=#888888 guifg=#000000
endfu

fu! L(keys, command, silent="0")
    if a:silent ==? '1'
        execute 'sil nn <leader>'.a:keys.' '.a:command
    else
        execute 'nn <leader>'.a:keys.' '.a:command
    end
endfu

fu! CycleBackground(nextprevious)
    let i = 0 | let current_background = synIDattr(hlID("Normal"), "bg")
    if current_background == ""
        let current_background="NONE"| "CATCH NO BACKGROUND (Transparency)
    endif
    let lenny = len(g:myBg)
    for _ in g:myBg
        if current_background ==? _
            let j = (i + (a:nextprevious)) % lenny
            execute "highlight Normal guibg=" . g:myBg[j]
            execute "highlight Normal guifg=" . g:myFg[j]
            echo j . ' / ' . lenny | syntax on | return
        endif
    let i += 1 | endfor
endfu

fu! CycleColor(nextprevious)
    let i = 0 | let current_scheme = g:colors_name
    let lenny = len(g:myScheme)
    for _ in g:myScheme
        if current_scheme ==? _
            let j = (i + (a:nextprevious)) % lenny
            echo g:myScheme[j] . ' - ' . j '/' . (lenny - 1)
            execute "colorscheme " g:myScheme[j]
            execute g:mySpec[j]
            syntax on
        return | endif
    let i += 1 | endfor
endfu

fu! Toggle(c1, c2, r1, r2)
    if a:c1 == a:c2
    execute a:r1 | return | endif
    execute a:r2
endfu

fu! Cycle(checkarr, cvar, doarr, nextprevious)
    let lenny = len(a:checkarr) | let i = 0
    while i < lenny
        if a:checkarr[i] ==? a:cvar
            let j = (i + (a:nextprevious)) % lenny
            execute a:doarr[j]
        return | endif
        let i += 1
    endwhile
endfu

fu! Web(url)
    enew
    call termopen('elinks "www.google.com"')
endfunction

fu! IndentHalfOrDouble(half_or_double)
    if a:half_or_double ==? "double"
        execute ':%s/  /    /g'
    else
        execute ':%s/    /  /g'
    endif
endfunction

"<--------- LET/SET -------------------------------------------------------->
filetype off
"set runtimepath+=/usr/local/share/lilypond/current/vim/
"set runtimepath+=$LILYPOND_HOME
filetype plugin on
filetype plugin indent on
syntax on
"set colorcolumn=80
set magic
set termguicolors
set splitright
set t_Co=256
set nocompatible
set modelines=0
set signcolumn=yes
set nu
set rnu
set ruler
set hidden
set updatetime=300
set nowrap
set textwidth=0
set formatoptions=tcqrn1
set clipboard=unnamedplus
set autoindent
set backup
set undofile
set undolevels=10000000
set undoreload=1000000
set dir=~/.mynvim/swapfiles
set backupdir=~/.mynvim/backupfiles
set undodir=~/.mynvim/undo_dir
set timeout
set timeoutlen=700
set ttimeoutlen=0
set wildmode=longest,list,full
set foldcolumn=auto
set showmode
set virtualedit=none
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
"set nomore

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let g:html_dynamic_folds = 1
let g:coc_start_at_startup = v:true
let g:coc_enable_at_startup = v:false
let g:mapleader = " "
let mapleader = " "
let maplocalleader = " "

"<--------- PLUGINS -------------------------------------------------------->
call plug#begin()
" Language Servers. Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Treesitter
"    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Treesitter, extra stuff
"    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Show-all-matching-tags-vim
    Plug 'andymass/vim-matchup'
" Autoclose HTML tags
    Plug 'alvan/vim-closetag'
" Autorename HTML tags
    Plug 'AndrewRadev/tagalong.vim'
" Syntax-for-lf
    Plug 'VebbNix/lf-vim'
" Syntax-for-i3
    Plug 'PotatoesMaster/i3-vim-syntax'
" Auto-save-restore-view :) --best plugin
    Plug 'https://github.com/vim-scripts/restore_view.vim'
" Real-time HTML/CSS/JS Editor
    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
" Showmarks/ Better marks
    Plug 'chentoast/marks.nvim'
" Requirements for lilypond (not using anymore), cool ui stuff
    Plug 'MunifTanjim/nui.nvim'
" Fzf Finder
    Plug 'junegunn/fzf.vim'
" Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Semantic Highlighting for Python
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" For lf.vim
    Plug 'voldikss/vim-floaterm'
    Plug 'ptzz/lf.vim'
" Elixir
    Plug 'elixir-editors/vim-elixir'
call plug#end()
"<--------_G-VAR_<leader>f_from-:-lf
lua require('base')
"---- Bracey Settings ----"
    let g:bracey_refresh_on_save    = 1
    let g:bracey_eval_on_save       = 1
    let g:bracey_auto_start_browser = 0
    let g:bracey_server_port        = 4842
"---- For 'ptzz/lf.vim' ----"
    let g:lf_map_keys   = 0
let g:html_mode     = 1
let g:is_bash       = 1
"-----------------CLOSETAG
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx' : 'jsxRegion,tsxRegion',
    \ 'javascript.jsx' : 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
"let g:closetag_shortcut = '<leader>'
" Add > at current position without closing the current tag, default is ''
"let g:closetag_close_shortcut = ''
"<hi> >

"<--------- COLOR SCHEME STUFF --------------------------------------------->
colorscheme pop-punk
:call CorrectColors()
hi Normal       ctermbg=black guibg=Transparent
hi ColorColumn cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#333333 guifg=NONE
set guicursor=n:block90,i:ver20
set cul
set nocuc
"<--------- MAPPINGS ------------------------------------------------------->
"nn <leader>stupidv :%s/\t/    /g<esc>
"list keybindings with :help index
"list user keybindings with :map

"----------------------------------
"-- Leader Bindings              --
"----------------------------------
    "call L( 'r'    ,     '<C-w>')
    call L( 'oc'           ,     'q:iput=execute("")<esc>A<C-c>')
    call L( 'op'           ,     'q:<C-p><esc>Iput =execute("<esc>A")<esc>A<C-c>')
    call L( 'ox'           ,     ':put     =execute("<C-r>0")<esc>')
    call L( 'out'          ,     'q:iput =execute("<C-r>0")<esc>A<C-c>')
    " -- Toggle COC -- "
        call L( 'a'        ,     ':call Toggle(g:coc_enabled, 0, ":CocEnable", ":CocDisable")<esc>')
    " -- List and Go to Buffer -- "
        call L( 'b'        ,     ':ls<CR>:b<Space>')
    " -- Toggle Cursorline -- "
        call L( 'c'        ,     ':set nocursorline!<esc>')
    " -- Toggle Cursorcolumn -- "
        call L( 'e'        ,     ':set cursorcolumn!<esc>')
    " -- Open LF -- "
        call L( 'u'        ,     ':Lf<esc>')
    " -- Half Page Down -- "
        call L( 'd'        ,     '<C-d>')
    " -- Toggle Word Wrap -- "
        call L( 'f'        ,     ':set wrap!<esc>')
    " -- Create New Buffer -- "
        call L( 'g'        ,     ':enew<esc>')
    " -- Toggle Status Line -- "
        call L( 'h'        ,     ':call Toggle(&ls, 0, "set ru \| set ls=2", "set noru \| set ls=0")<esc><C-L>')
    " -- Got to Next File -- "
        call L( 'n'        ,     ':next<esc>')
    " -- Got to Previous File -- "
        call L( 'p'        ,     ':previous<esc>')
    " -- Delete Buffer (Pick) -- "
        call L( 'q'        ,     ':bd')
    " -- Delete Current Buffer -- "
        call L( 'D'        ,     ':bdelete<esc><enter>')
        call L( 'ZC'       ,     ':bd<esc>')
    " -- Delete Current Buffer (Don't Save) -- "
        call L( 'ZG'       ,     ':bd!<esc>')
    " -- Load Vim Config File -- "
        call L( 's'        ,     ':%so "${HOME}/.config/nvim/init.vim"<esc>')
    " -- Tab Stuff -- "
        call L( 'tcc'      ,     ':tabclose<esc>')
        call L( 'tt'       ,     ':tabnew<esc>')
        call L( 'tn'       ,     ':tabmove +1<esc>')
        call L( 'tp'       ,     ':tabmove -1<esc>')
        call L( 'tb'       ,     ':tabmove -1<esc>')
        call L( 'tm'       ,     ':tabmove')
        call L( 'tf'       ,     ':tabfirst<esc>')
        call L( 'tl'       ,     ':tablast<esc>')
        call L( 'tB'       ,     ':tabmove -1<esc>')
        call L( 'tN'       ,     ':tabmove +1<esc>')
    " -- Search with Register -- "
        call L( 'vf'       ,     '?<C-r>"<enter>')
    " -- Eval Register -- "
        call L( 'vm'       ,     ':put =eval("<C-r>0")')
    " -- Eval Register (Automatic)-- "
        call L( 'vq'       ,     ':put =eval("<C-r>0")<esc>')
    " -- Virtual Edit Cycle -- "
        call L( 'vv'       ,     ':call Cycle(["none", "all", "block"], &ve, ["set ve=all \| echo &ve", "set ve=block \| echo &ve", "set ve=none \| echo &ve"], 0)<CR>')
    " -- Save -- "
        call L( 'w'        ,     ':w<esc>')
    " -- Execute -- "
        call L( 'x'        ,     ':w<esc>:!%:p<esc>')
    " -- Toggle Transparency -- "
        call L( 'y'        ,    ':hi Normal guibg=Transparent<esc>')
    " -- z does tons of stuff.... -- "
        call L( 'z'        ,    'z')
    " -- Show Buffers in Pane -- "
        call L( 'B'        ,    ':Buffers<esc>')
    " -- Help Grep -- "
        call L( 'H'        ,    ':vert helpgrep ')
    " -- Correct Color Stuff -- "
        call L( 'k'        ,    ':call CorrectColors()<CR>')
    " -- Cycle Background Colors -- "
        call L( 'l'        ,    ':call CycleBackground(+1)<CR>')
        call L( 'L'        ,    ':call CycleBackground(-1)<CR>')
    " -- Cycle Colorscheme -- "
        call L( 'j'        ,    ':call CycleColor(+1)<CR>')
        call L( 'J'        ,    ':call CycleColor(-1)<CR>')
    " -- Show Messages -- "
        call L( 'M'        ,    ':messages<esc>')
    " -- Display Next Error -- "
        call L( 'N'        ,    ':cnext<esc>')
    " -- Display Previous Error -- "
        call L( 'P'        ,    ':cprevious<esc>')
    " -- Toggle Color Column -- "
        call L( '<C-w>line',    ':call Toggle(&cc, 0, "set cc=80", "set cc=0")<esc>')
    " -- Start Bracy -- "
        call L( 'WW'       ,   ':Bracey<esc>')
    " -- Stop Bracy -- "
        call L( 'S'        ,    ':BraceyStop<esc>')
    " -- OPEN TERMINAL -- "
        call L( 'T'        ,    ':buff term://<esc>i')
    " -- OPEN WEB BROWSER -- "
        call L( 'W'        ,    ':call Web("f")<esc>i')
        " -- Go to 'https://localhost:4842' -- "
            call L( 'G'    ,    ':buff term://<esc>iohttp://localhost:4842')
    " -- QUICK SWITCH BETWEEN ALTERNATE FILE -- "
        call L( '<leader>' ,    '<C-^>')
        call L( ',' ,           '<C-^>')
    " -- LIST AND OPEN BUFFER QUICK -- "
        call L( ';'        ,    ':ls<CR>:b<Space>')
        "call L( '.'       ,    ':bnext<esc>')-----------------------
    " -- OPEN FILE EXPLORER -- "
        call L( '/'        ,    ':Explore<CR>')
    " -- GO PREVIOUS BUFFER -- "
        call L( '['        ,    ':bprevious<CR>:noh<esc><C-L>')
    " -- GO NEXT BUFFER -- "
        call L( ']'        ,    ':bnext<CR>:noh<esc><C-L>')
    " -- DELETE MARK -- "
        call L( 'dm'       ,    ':delmark')
    " -- DELETE WHITESPACE -- "
        call L( 'df'       ,    ':%s/\s\+\ze$//gc<esc>')
    " --  Run Healthchecks -- "
        call L( 'CH'       ,    ':checkhealth<esc>')
    " -- -- "
        call L( '<enter>'  ,    ':set paste!<esc>')
"---------------------------------------------------
"-- Map  (Normal, Visual, Select, OperatorPending --
"---------------------------------------------------
    map <Space> <leader>
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
"----------------------------------
"-- Normal                       --
"----------------------------------
    "nn <esc> <C-w>
    " -- MOVE BETWEEN PANELS
        nn <C-h> <C-w>h
        nn <C-j> <C-w>j
        nn <C-k> <C-w>k
        nn <C-l> <C-w>l
    " -- ESCAPE CLEAR STATUSLINE -- "
        nn <esc> :noh<esc><C-L>
    no <leader>zaf gg/<C-r>0<esc>jVnkzf
    nn <C-p> <C-i>
    nn / /\v\c
    nn ? ?\v\c
    nn <C-_> /\V\c
    nn <lt> :tabprevious<esc>
    nn > :tabnext<esc>
    nn x "xx
    nn \ `
    nn <C-w>n    :new<esc><C-w>L
    nn SS :source ~/.config/nvim/init.vim<esc><C-w>L
    "sil nn <silent><esc> :noh<esc>
    sil nn <Enter> @=(foldlevel('.')?'za':"\<Space>")<CR>
"----------------------------------
"-- Insert                       --
"----------------------------------
    " -- Scroll Coc Popup -- "
        if has('nvim-0.4.0') || has('patch-8.2.0750')
          nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
          inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
          inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
          vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        endif
    " -- Edit Normal Mode -- "
        inoremap    jk <esc>
    " -- Emacs Like Bindings for Insert Mode -- "
        inoremap <C-a> <esc>I
        inoremap <C-b> <left>
        inoremap <C-e> <esc>A
        inoremap <C-f> <right>
        inoremap <C-K> <esc>lCi
"----------------------------------
"-- Terminal                     --
"----------------------------------
    " -- Exit Terminal and Change Buffer -- "
    tnoremap <leader><leader> <C-\><C-n>:Buffers<esc>
    tnoremap <leader>. <C-\><C-n>:bnext<esc>
    tnoremap <leader><esc> <C-\><C-n>
    tnoremap <leader>G <C-\><C-n>iohttp://localhost:4842<enter>
"-- exit terminal = ctrl-\ ctrl-n --"
"nn dd "Ddd
"nn    D "DD
"nn cc "Ccc
"nn    C "CC
"nn C "Cd
"map <leader> :Lf<CR>
" Take last command line command to use to output to neovim
" BELOW 4 lines do that riff on that
set cedit=\<C-c>
"<--------- STATUS LINE ---------------------------------------------------->
set statusline=\ [%n]\ 
set statusline+=\ %F\ 
set statusline+=%m\ 
"set statusline+=%=\ %L\ l,\ 
set statusline+=%=\(%l\/%L\)\ (%v\)\ 
set statusline+=%{wordcount().words}\ w\ 

autocmd BufNewFile,BufRead *.sh                         set syntax=zsh
autocmd BufNewFile,BufRead ~/.config/polybar/config     setfiletype dosini
autocmd BufNewFile,BufRead ~/.config/i3/*               setfiletype i3
autocmd BufNewFile,BufRead *.html                       setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.css                        setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
" -----------------REMEMBER-----------------
" & is repeat last substitution


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

