
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
"<--------- FUNCTIONS ------------------------------------------------------>
fu! CorrectColors()
    hi ExtraWhiteSpace cterm=NONE ctermbg=gray ctermfg=NONE  gui=NONE guibg=#0000FF
    hi Normal       ctermbg=black guibg=#000000
    hi StatusLine   cterm=NONE ctermbg=NONE ctermfg=160     gui=NONE    guibg=#000000 guifg=#00DD00
    hi StatusLineNC cterm=NONE ctermbg=NONE ctermfg=160     gui=NONE    guibg=#000000 guifg=#FFFFFF
    hi FoldColumn   cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC  guibg=NONE    guifg=#00ff00
    hi Folded       cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC  guibg=NONE    guifg=#999999
    hi CursorLine   cterm=BOLD ctermfg=NONE ctermbg=18      gui=BOLD    guibg=NONE    guifg=NONE
    hi CursorLineNr cterm=BOLD ctermfg=NONE ctermbg=18      gui=NONE    guibg=NONE    guifg=#FFFF00
    hi SignColumn   cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC  guibg=NONE    guifg=#000000
    hi LineNr       cterm=NONE ctermbg=NONE ctermfg=NONE    gui=NONE    guibg=#000000 guifg=#AAAAAA
    hi LineNrAbove  cterm=NONE ctermbg=NONE ctermfg=NONE    gui=NONE    guibg=#000000 guifg=#00AAFF
    hi TabLine                                              gui=NONE    guibg=#222222 guifg=#999999
    hi TabLineSel                                           gui=BOLD    guibg=#000000 guifg=#00FF00
    hi MarkSignNumHL                                        gui=NONE    guibg=none    guifg=NONE
    hi MarkSignVirtTextHL                                   gui=NONE    guibg=NONE    guifg=#00FF00
    hi IncSearch    cterm=NONE ctermbg=white ctermfg=black  gui=NONE    guibg=#FF0000 guifg=#000000
    hi Search       cterm=NONE ctermbg=white ctermfg=black  gui=NONE    guibg=#FFFFFF guifg=#000000
endfu

match ExtraWhiteSpace /[^ ]\s\+\zs$/
fu! L(keys, command, silent="0")
    if a:silent ==? '1'
        execute 'sil nn <leader>'.a:keys.' '.a:command
    else
        execute 'nn <leader>'.a:keys.' '.a:command
    end
endfu

fu! CyBac(nextprevious)
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

fu! CyCol(nextprevious)
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

fu! Tog(c1, c2, r1, r2)
    if a:c1 == a:c2
    execute a:r1 | return | endif
    execute a:r2
endfu

fu! Cy(checkarr, cvar, doarr, nextprevious)
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
"set signcolumn=no
set nu
set rnu
set ruler
set hidden
set updatetime=200
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
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"treesitter, self explanatory
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"show-all-matching-tags-vim
Plug 'andymass/vim-matchup'
"autoclose html tags
Plug 'alvan/vim-closetag'
"autorename html tags
Plug 'AndrewRadev/tagalong.vim'
"syntax-for-lf
Plug 'VebbNix/lf-vim'
"Plug 'neovim/nvim-lspconfig'
"syntax-for-i3
Plug 'PotatoesMaster/i3-vim-syntax'
"auto-save-restore-view :) --best plugin
Plug 'https://github.com/vim-scripts/restore_view.vim'
"realtime-html-editor
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
"showmarks
Plug 'chentoast/marks.nvim'
"lilypondstuff--music-score-creation
"Plug 'martineausimon/nvim-lilypond-suite'
"req for lilypond, cool ui stuff
Plug 'MunifTanjim/nui.nvim'
"just for fun record stats about programming
"Plug 'wakatime/vim-wakatime'
"Plug 'ActivityWatch/aw-watcher-vim'
" fzf finder
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
call plug#end()

"<--------_G-VAR_<leader>f_from-:-lf
lua require('base')
let g:bracey_refresh_on_save    = 1
let g:bracey_eval_on_save       = 1
let g:bracey_auto_start_browser = 0
let g:bracey_server_port        = 4842
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
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
"<hi> >

"<--------- COLOR SCHEME STUFF --------------------------------------------->
colorscheme pop-punk
"colorscheme cyberpunk-neon
:call CorrectColors()

hi Normal       ctermbg=black guibg=Transparent

""<--------- COCSTUFF ------------------------------------------------------->
hi ColorColumn cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#333333 guifg=NONE

set guicursor=n:block90,i:ver20
set cul
set nocuc
"<--------- MAPPINGS ------------------------------------------------------->
"nn <leader>stupidv :%s/\t/    /g<esc>
"list keybindings with :help index
"list user keybindings with :map
"nn <leader>. :NERDTreeToggle<esc>

" -- TOGGLE COC
    call L( 'a'    ,     ':call Tog(g:coc_enabled, 0, ":CocEnable", ":CocDisable")<esc>')
" -- LIST AND GO TO BUFFER
    call L( 'b'    ,     ':ls<CR>:b<Space>')
call L( 'c'    ,     ':set nocursorline!<esc>')
call L( 'd'    ,     '<C-d>')
call L( 'e'    ,     ':set cursorcolumn!<esc>')
call L( 'f'    ,     ':set wrap!<esc>')
call L( 'g'    ,     ':enew<esc>')
call L( 'h'    ,     ':call Tog(&ls, 0, "set ru \| set ls=2", "set noru \| set ls=0")<esc><C-L>')
call L( 'j'    ,     ':call CyCol(+1)<CR>')
call L( 'k'    ,     ':call CorrectColors()<CR>')
call L( 'l'    ,     ':call CyBac(+1)<CR>')
call L( 'n'    ,     ':next<esc>')
call L( 'oc'   ,     'q:iput=execute("")<esc>A<C-c>')
call L( 'op'   ,     'q:<C-p><esc>Iput =execute("<esc>A")<esc>A<C-c>')
call L( 'ox'   ,     ':put     =execute("<C-r>0")<esc>')
call L( 'out'  ,     'q:iput =execute("<C-r>0")<esc>A<C-c>')
call L( 'p'    ,     ':previous<esc>')
" -- DELETE BUFFER
    call L( 'q'   ,      ':bd')
call L( 'r'    ,     '<C-w>')
call L( 's'    ,     ':%so "${HOME}/.config/nvim/init.vim"<esc>')
call L( 'tcc'  ,     ':tabclose<esc>')
call L( 'tt'   ,     ':tabnew<esc>')
call L( 'tn'   ,     ':tabmove +1<esc>')
call L( 'tp'   ,     ':tabmove -1<esc>')
call L( 'tb'   ,     ':tabmove -1<esc>')
call L( 'tm'   ,     ':tabmove')
call L( 'tf'   ,     ':tabfirst<esvsplitc>')
call L( 'tl'   ,     ':tablast<esc>')
call L( 'tB'   ,     ':tabmove -1<esc>')
call L( 'tN'   ,     ':tabmove +1<esc>')
call L( 'u'    ,     '<C-u>')
call L( 'var'  ,     ':let maxvar ="<C-r>1<C-r>0"')
call L( 'vf'   ,     '?<C-r>"<enter>')
call L( 'vm'   ,     ':put =eval("<C-r>0")')
call L( 'vq'   ,     ':put =eval("<C-r>0")<esc>')
call L( 'vv'   ,     ':call Cy(["none", "all", "block"], &ve, ["set ve=all \| echo &ve", "set ve=block \| echo &ve", "set ve=none \| echo &ve"], 0)<esc>')
call L( 'vz'   ,     'i<C-r>"')
call L( 'w'    ,     ':w<esc>')
call L( 'x'    ,     ':w<esc>:!%:p<esc>')
call L( 'y'    ,     ':hi Normal guibg=Transparent<esc>')
call L( 'z'    ,     'z')
" -- DELETE BUFFER
    call L( 'ZC'   ,     ':bd<esc>')
" -- DELETE BUFFER
    call L( 'ZG'   ,     ':bd!<esc>')
call L( 'B'    ,    ':Buffers<esc>')
call L( 'D'    ,    ':bdelete<esc><enter>')
call L( 'G'    ,    ':buff term://<esc>iohttp://localhost:4842')
call L( 'H'    ,    ':vert helpgrep ')
call L( 'J'    ,    ':call CyCol(-1)<CR>')
call L( 'L'    ,    ':call CyBac(-1)<CR>')
call L( 'M'    ,    ':messages<esc>')
call L( 'N'    ,    ':cnext<esc>')
call L( 'P'    ,    ':cprevious<esc>')
"call L( 'S'    ,    ':BraceyStop<esc>')
" -- OPEN TERMINAL
    call L( 'T'    ,    ':buff term://<esc>i')
" -- OPEN WEB BROWSER
    call L( 'W'    ,    ':call Web("f")<esc>i')
" -- QUICK SWITCH BETWEEN ALTERNATE FILE
    call L( '<leader>' ,    '<C-^>')
    call L( ',' ,           '<C-^>')
" --
    call L( '<enter>'  ,    ':set paste!<esc>')
" -- LIST AND OPEN BUFFER QUICK
    call L( ';'        ,    ':ls<CR>:b<Space>')
"call L( '.'       ,    ':bnext<esc>')-----------------------
" -- OPEN FILE EXPLORER
    call L( '/'        ,    ':Explore<CR>')
" -- GO PREVIOUS BUFFER
    call L( '['        ,    ':bprevious<CR>:noh<esc><C-L>')
" -- GO NEXT BUFFER
    call L( ']'        ,    ':bnext<CR>:noh<esc><C-L>')
" -- DELETE MARK
    call L( 'dm'       ,    ':delmark')
" -- DELETE WHITESPACE
    call L( 'df'       ,    ':%s/\s\+\ze$//gc<esc>')

call L( '<C-w>line', ':call Tog(&cc, 0, "set cc=80", "set cc=0")<esc>')


map <Space> <leader>
map , <leader>
vn <leader>x c<esc>l:execute "normal! i" . eval('<C-r>"')<esc>
vn im :s/\%V[ \t]*//<esc>| "REMOVE TABS ON VISUAL SELECTION
vn <Enter> zf

"nn <esc> <C-w>
" -- MOVE BETWEEN PANELS
    nn <C-h> <C-w>h
    nn <C-j> <C-w>j
    nn <C-k> <C-w>k
    nn <C-l> <C-w>l

" -- ESCAPE CLEAR BARTHINGEY --
    nn <esc> :noh<esc><C-L>

no <leader>zaf gg/<C-r>0<esc>jVnkzf
nn <C-p> <C-i>
nn HEALTH :checkhealth<esc>
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

im jk <esc>

inoremap <C-e> <esc>A
inoremap <C-a> <esc>I
inoremap <C-b> <left>
inoremap <C-f> <right>
"Exit Terminal and Change Buffer
tnoremap <leader><leader> <C-\><C-n>:Buffers<esc>
tnoremap <leader>. <C-\><C-n>:bnext<esc>
tnoremap <leader><esc> <C-\><C-n>
tnoremap <leader>G <C-\><C-n>iohttp://localhost:4842<enter>

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
set statusline=\ %F\ \|
set statusline+=\%l\(%L\)\|%v\ 
set statusline+=%m\ 
set statusline+=%=\ [%n]\ 
set statusline+=%=\ %L\ l,\ 
set statusline+=%{wordcount().words}\ w\ 

autocmd BufNewFile,BufRead *.sh                         set syntax=zsh
autocmd BufNewFile,BufRead ~/.config/polybar/config     setfiletype dosini
autocmd BufNewFile,BufRead ~/.config/i3/*               setfiletype i3
autocmd BufNewFile,BufRead *.html                       setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.css                        setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
    
vn <leader>M :!dc<esc>
vn <leader>m :!bc<esc>

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

