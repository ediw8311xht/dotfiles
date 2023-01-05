                     

"<==========================================================================>
"<==----------------======================================----------------==>
"<==-----  ||||-----======================================-----  ||||-----==>
"<==-----  ||||-----==__________________________________==-----  ||||-----==>
"<==-  ||||||||||||-==                                  ==-  ||||||||||||-==>
"<==-  ||||||||||||-== Vim Config -> Maximilian Ballard ==-  ||||||||||||-==>
"<==-----  ||||-----==__________________________________==-----  ||||-----==>
"<==-----  ||||-----==                                  ==-----  ||||-----==>
"<==-----  ||||-----======================================-----  ||||-----==>
"<==-----  ||||-----======================================-----  ||||-----==>
"<==----------------======================================----------------==>
"<==========================================================================>
"<==========================================================================>
                     
"<--------- LET/SET -------------------------------------------------------->
filetype off
set runtimepath+=/usr/local/share/lilypond/current/vim/
set runtimepath+=$LILYPOND_HOME
filetype plugin on
filetype plugin indent on
syntax on
set colorcolumn=80
set magic
set termguicolors
set splitright
set t_Co=256
set nocompatible
set modelines=0
set signcolumn=yes:1
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
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2

let g:coc_start_at_startup = v:false
let g:mapleader = ","
let mapleader = ","
let maplocalleader = ","

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"<--------- MY VARS -------------------------------------------------------->
let g:myBg = ["NONE", "#000000", "#333333", "#111111", "#220000", "#002200", "#000022", "#FFFFFF"]
let g:myFg = [".",    ".",       ".",       ".",       ".",       ".",       ".",       "#000000"]
let g:python3_host_prog="/usr/bin/python"
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
Plug 'martineausimon/nvim-lilypond-suite'

"req for lilypond, cool ui stuff
Plug 'MunifTanjim/nui.nvim'

"just for fun record stats about programming
Plug 'wakatime/vim-wakatime'

call plug#end()
"<--------_G-VAR_<leader>f_from-:-lf
lua require('base')
let g:lf_map_keys           = 0
let g:html_mode             = 1
let g:is_bash               = 1
"-----------------CLOSETAG
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


"<--------- COLOR SCHEME STUFF --------------------------------------------->
colorscheme   pop-punk

hi  MatchParen          cterm=NONE ctermbg=NONE ctermfg=NONE gui=reverse
hi  cursorline          cterm=bold ctermfg=NONE ctermbg=18   gui=bold       guibg=#000044 guifg=NONE
hi  cursorcolumn        gui=bold,italic,reverse
hi  FoldColumn          cterm=NONE ctermbg=NONE ctermfg=NONE gui=bold        guibg=NONE    guifg=#00FF00 
hi  Folded              cterm=NONE ctermbg=NONE ctermfg=NONE gui=italic      guibg=NONE    guifg=#888888 
hi  StatusLine          cterm=NONE ctermbg=NONE ctermfg=160  gui=NONE       guibg=#222222 guifg=#009900
"hi  Normal              cterm=NONE ctermbg=17   ctermfg=NONE gui=NONE       guibg=NONE    guifg=#FFFFFF
"hi htmlTag            gui=reverse   guifg=#90b0d1 guibg=#000033
"hi htmlSpecialTagName gui=reverse
"hi html gui=reverse
"hi htmlTagName        gui=NONE   guifg=#90b0d1 guibg=#000033
"hi htmlEndTag         gui=NONE   guifg=#000000 guibg=#FFFFFF
"hi  Visual              cterm=NONE ctermbg=NONE ctermfg=16   gui=NONE       guibg=#333333 guifg=#00FF00
"hi  LineNr              cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=NONE    guifg=#008800
"hi  NonText             cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=NONE    guifg=NONE
"hi  CocSearch           cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=#FF0000 guifg=#000000
"hi  CocMenuSel          cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=#FF0000 guifg=#000000
"hi  CocErrorHighlight   cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=#FF0000 guifg=#000000
"hi  CocErrorSign        cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=#FF0000 guifg=#000000
"hi  CocWarningSign      cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=#FF0000 guifg=#000000
"hi  CocInfoSign         cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=#FF0000 guifg=#000000
"hi  CocHintSign         cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=#FF0000 guifg=#000000
"
""<--------- COCSTUFF ------------------------------------------------------->
"hi default link CocErrorVirtualText         CocErrorSign
"hi default link CocWarningVirtualText       CocErrorSign
"hi default link CocInfoVirtualText          CocErrorSign
"hi default link CocHintVirtualText          CocErrorSign
"hi default link CocErrorHighlight           CocErrorSign
"hi default link CocWarningHighlight         CocErrorSign
"hi default link CocInfoHighlight            CocErrorSign
"hi default link CocHintHighlight            CocErrorSign
"hi default link CocErrorFloat               CocErrorSign
"hi default link CocWarningFloat             CocErrorSign
"hi default link CocInfoFloat                CocErrorSign
"hi default link CocHintFloat                CocErrorSign
"hi default link CocCursorRange              CocErrorSign
"hi default link CocHoverRange               CocErrorSign
hi ColorColumn cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#333333 guifg=NONE

set guicursor=n:block90,i:ver20
set cul
set nocuc
"<--------- FUNCTIONS ------------------------------------------------------>
" https://unix.stackexchange.com/questions/140898/vim-hide-status-line-in-the-bottom/140899#140899 " from user - cuonglm - https://unix.stackexchange.com/users/38906/cuonglm
let s:status_hidden = 0 | function! ToggleHiddenAll()
    if s:status_hidden  == 0 | set noruler | set laststatus=0 | let s:status_hidden = 1 ""set noshowmode
    else                     | set ruler   | set laststatus=2 | let s:status_hidden = 0 ""set showmode
    endif
endfunction

function! ToggleScheme()
    ""MAKE THIS BETTER MAX
    if     g:colors_name == 'pop-punk'  | colo eldar    | hi Normal guifg=#FFFFFF
    elseif g:colors_name == 'eldar'     | colo elflord  | hi Normal guifg=#FFFFFF
    elseif g:colors_name == 'elflord'   | colo delek    | hi Normal guifg=#000000
    elseif g:colors_name == 'delek'     | colo morning  | hi Normal guifg=#000000
    else                | colo eldar    | colo pop-punk | hi Normal guifg=#FFFFFF guibg=NONE
                          hi  cursorline gui=NONE guibg=#220000 guifg=NONE
    end
    echo g:colors_name
    hi FoldColumn guibg=NONE guifg=#00FF00 gui=bold
    hi Folded     guibg=NONE guifg=#888888 gui=italic
    "hi cursorcolumn cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guibg=NONE guifg=NONE
    syntax on
endfunction

function! CycleBackgroundColor()
    let i = 0 | let current_background = synIDattr(hlID("Normal"), "bg")  
    echo synIDattr(hlID("Normal"), "bg")
    for _ in g:myBg
        if current_background == _
            let j = (i + 1) % len(g:myBg)
            execute "highlight Normal guibg=" . g:myBg[j] . " guifg=" . g:myFg[j]
        return | endif | let i += 1
    endfor
    if current_background == '' | execute "highlight Normal guibg=" . g:myBg[1] . " guifg=" . g:myFg[1]
    else                        | execute "highlight Normal guibg=" . g:myBg[0] . " guifg=" . g:myFg[1]
    endif 
endfunction

function! ToggleCOC()
    if g:coc_service_initialized == "0"
        :CocStart
    elseif g:coc_enabled == "0"
        :CocEnable
    else
        :CocDisable
    end
endfunction

function! ToggleVirtualEdit()
    if &virtualedit == "all" | set virtualedit=none
                               echo "virtualedit=none"
    else                     | set virtualedit=all
                               echo "virtualedit=all"
    end
endfunction

function! ToggleColorColumn()
    if &cc == "0" | set cc=80 
    else          | set cc=0
    end
endfunction

"<--------- MAPPINGS ------------------------------------------------------->
"nnoremap <leader>stupidv :%s/\t/    /g<esc>
"list keybindings with :help index
"list user keybindings with :map
"nnoremap <leader>. :NERDTreeToggle<esc>
nnoremap <leader>1 :hi cursorline guibg=NONE guifg=NONE gui=bold cterm=NONE ctermbg=NONE ctermfg=NONE<esc>
nnoremap <leader>2 :PlugUpdate<CR>
nnoremap <leader>3 :PlugInstall<CR>
nnoremap <leader>a :call ToggleCOC()<esc>
nnoremap <leader>b :buffer<space>
nnoremap <leader>c :set nocursorline!<esc>
nnoremap <leader>e :set cursorcolumn!<esc>
nnoremap <leader>f :set wrap!<esc>
nnoremap <silent><leader>h :call ToggleHiddenAll()<CR>
nnoremap <leader>j :call ToggleScheme()<CR>
nnoremap <leader>vv :call ToggleVirtualEdit()<esc>
nnoremap <leader>n :cnext<esc>
nnoremap <leader>s :%so "${HOME}/.config/nvim/init.vim"<esc>
nnoremap <leader>w :w<esc>
nnoremap <leader>x :!%:p<esc>
nnoremap <leader>y :hi Normal guibg=Transparent<esc>
nnoremap <leader>z z
nnoremap <leader>A :call CycleBackgroundColor()<CR><esc>
nnoremap <leader>B :buffers<esc>
nnoremap <leader>D :Bracey<esc>
nnoremap <leader>H :vert helpgrep 
nnoremap <leader>N :cprevious<esc>
nnoremap <leader>M :messages<esc>
nnoremap <leader><C-w>line :call ToggleColorColumn()<esc>
"map <C-b> nnoremap <leader>bb :buffers<cr>:b<space> 
"nnoremap <leader><leader> :<backspace>
nnoremap <leader><leader> <C-^>

nnoremap <leader>tt :tabnew<esc>
nnoremap <leader>tn :tabmove +1<esc> 
nnoremap <leader>tp :tabmove -1<esc> 
nnoremap <leader>tb :tabmove -1<esc>  
nnoremap <leader>tm :tabmove
nnoremap <leader>tf :tabfirst<esc>
nnoremap <leader>tl :tablast<esc>
nnoremap <leader>tN :tabmove +1<esc>
nnoremap <leader>tB :tabmove -1<esc>
nnoremap <leader>tcc :tabclose<esc>

nnoremap <leader>vm  :put =eval('<C-r>0')
nnoremap <leader>vq  :put =eval('<C-r>0')<esc>
nnoremap <leader>vz  i<C-r>"
nnoremap <leader>vf  ?<C-r>"<enter>
nnoremap <leader>var :let maxvar ='<C-r>1<C-r>0'<esc>
nnoremap HEALTH :checkhealth<esc>

"nnoremap <leader>ap :let @+="<C-r>1<C-r>0"
"1+2                   
"vnoremap <leader>vq q:o<C-c>put =execute(' <C-R>0')
"vnoremap <leader>dc :put =execute('dc <C-r>0')<esc>

nnoremap <leader>op  q:<C-p><esc>Iput =execute('<esc>A')<esc>A<C-c>
nnoremap <leader>oc  q:iput =execute('')<esc>A<C-c>
nnoremap <leader>out q:iput =execute('<C-r>0')<esc>A<C-c>
nnoremap <leader>ox  :put   =execute('<C-r>0')<esc>

noremap <leader>zaf gg/<C-r>0<esc>jVnkzf
noremap <leader>zv

map <leader>l :Lf<CR>

"nnoremap <leader>mq :put =execute('echo <c-r>0')<esc>
vnoremap <leader>$ $h
vnoremap <Space> zf
"vnoremap <leader>c c<esc>l:execute "normal! i" . execute("!<C-r>"")<esc>
vnoremap <leader>x c<esc>l:execute "normal! i" . eval('<C-r>"')<esc>


"REMOVE TABS ON VISUAL SELECTION
vnoremap im :s/\%V[ \t]*//<esc>

nnoremap <silent> <esc> :noh <cr><esc>
nnoremap / /\v\c
nnoremap <lt> :tabprevious<esc>
nnoremap > :tabnext<esc>
nnoremap x "xx
nnoremap \ `
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Take last command line command to use to output to neovim
" BELOW 4 lines do that riff on that
"<--------- STATUS LINE ---------------------------------------------------->
set statusline=\ %F\ \|
set statusline+=\%l\(%L\)\|%v\ 
set statusline+=%m\ 
set statusline+=%=\ %L\ l,\ 
set statusline+=%{wordcount().words}\ w\ 
"<--------- EXTRA ---------------------------------------------------------->
"augroup bashiez
"    au!
"    autocmd BufNewFile,BufRead *.sh set syntax=zsh
"augroup END

autocmd BufNewFile,BufRead *.sh                     set syntax=zsh
autocmd BufNewFile,BufRead ~/.config/polybar/config setfiletype dosini
autocmd BufNewFile,BufRead ~/.config/i3/*           setfiletype i3
autocmd BufNewFile,BufRead *athamerc                setfiletype vim
"<--------- INFO ----------------------------------------------------------->
"   %<"                             _-_is expanded to the name of the current buffer.
"   :help key-notation              _-_for list of keys and their names.
"   :only                           _-_make split only one. 
"   :let                            _-_list all options and their values. 
"   :put =Execute("map")            _-_output of command into nvim.  
"<-------------------------------------------------------------------------->



