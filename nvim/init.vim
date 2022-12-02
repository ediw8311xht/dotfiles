
"<-------------______________________________________----------------------->
"               |                                  |
"               | Vim Config -> Maximilian Ballard |                         
"<-------------_|__________________________________|_----------------------->

"<--------- LET/SET -------------------------------------------------------->
filetype plugin on
syntax on
let g:mapleader = ","
let mapleader = ","
let maplocalleader = ","
set termguicolors
set splitright
set ignorecase
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
set foldcolumn=auto:4
set showmode
set virtualedit=all

" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
"set smarttab

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"<--------- MY VARS -------------------------------------------------------->
let g:myBg = ["NONE", "#000000", "#333333", "#111111", "#220000", "#002200", "#000022", "#FFFFFF"]
let g:myFg = [".",    ".",       ".",       ".",       ".",       ".",       ".",       "#000000"]
let g:python3_host_prog="/usr/bin/python"

"let g:polyglot_disabled = ['markdown']
"<--------- PLUGINS -------------------------------------------------------->
call plug#begin()
"-----------COMMENTED-OUT
"Plug 'vim-autoformat/vim-autoformat'
"Plug 'junegunn/vim-easy-align'
"Plug 'sukima/xmledit'
"Plug 'bmeneg/coc-perl', {'do': 'yarn install && yarn build'}
"Plug 'rakr/vim-one'
"Plug 'sheerun/vim-polyglot'
"Plug 'VebbNix/lf-vim'
"Plug 'AndrewRadev/tagalong.vim'
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install --frozen-lockfile --production',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
"-----------NEOCLIDE-COMPLETION
"Plug 'windwp/nvim-ts-autotag'
"Plug 'windwp/nvim-autopairs'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"-----------COLORSCHEMES
Plug 'bignimbus/pop-punk.vim'
Plug 'agude/vim-eldar'
Plug 'romgrk/github-light.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'marko-cerovac/material.nvim'
"-----------FORMATTING
Plug 'godlygeek/tabular'
"-----------SYNTAX
Plug 'VebbNix/lf-vim'
Plug 'dense-analysis/ale'
Plug 'PotatoesMaster/i3-vim-syntax'
"-----------ETC
Plug 'https://github.com/vim-scripts/restore_view.vim'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'voldikss/vim-floaterm'
Plug 'ptzz/lf.vim'
Plug 'martineausimon/nvim-lilypond-suite'
Plug 'MunifTanjim/nui.nvim'
Plug 'wbthomason/packer.nvim'
Plug 'neovim/nvim-lspconfig'
"-----------COQ
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
"Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc
call plug#end()
"<--------_G-VAR_<leader>f_from-:-lf
lua require('base')
let g:lf_map_keys           = 0
let g:ale_fixers            = {  'css': ['stylelint'],                       }
let g:ale_linters           = { 'html': ['htmlhint' ], 'css': ['stylelint'], }
let g:html_mode             = 1
let g:tagalong_verbose      = 1
let g:ale_linters_explicit  = 1
let g:ale_fix_on_save       = 1
let g:is_bash               = 1
let g:lf_width=100
let g:lf_height=40
"<--------- COLOR SCHEME STUFF --------------------------------------------->
colorscheme   pop-punk

hi  Visual          cterm=NONE ctermbg=NONE ctermfg=16   gui=NONE       guibg=#333333 guifg=#00FF00
hi  StatusLine      cterm=NONE ctermbg=NONE ctermfg=160  gui=NONE       guibg=#222222 guifg=#009900
hi  Normal          cterm=NONE ctermbg=17   ctermfg=NONE gui=NONE       guibg=NONE    guifg=#FFFFFF
hi  LineNr          cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=NONE    guifg=#008800
hi  NonText         cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE       guibg=NONE    guifg=NONE
hi  MatchParen      cterm=NONE ctermbg=NONE ctermfg=NONE gui=bold       guibg=NONE    guifg=NONE 
hi  cursorline      cterm=bold ctermfg=NONE ctermbg=18   gui=NONE       guibg=#220000 guifg=NONE
hi  cursorcolumn    cterm=bold ctermfg=NONE ctermbg=NONE gui=bold       guibg=NONE    guifg=NONE   
hi  FoldColumn      cterm=NONE ctermbg=NONE ctermfg=NONE gui=bold       guibg=NONE    guifg=#00FF00 
hi  Folded          cterm=NONE ctermbg=NONE ctermfg=NONE gui=italic     guibg=NONE    guifg=#888888 
"hi       CocSearch       cterm=NONE          ctermbg=NONE ctermfg=NONE  gui=NONE         guibg=NONE     guifg=NONE
"hi       CocMenuSel      cterm=NONE          ctermbg=NONE ctermfg=NONE  gui=NONE         guibg=NONE     guifg=NONE

set guicursor=n:block90,i:ver20
set cul
set nocuc
"<--------- FUNCTIONS ------------------------------------------------------>
let s:status_hidden = 0 | function! ToggleHiddenAll()
  " https://unix.stackexchange.com/questions/140898/vim-hide-status-line-in-the-bottom/140899#140899
  " from user - cuonglm - https://unix.stackexchange.com/users/38906/cuonglm
    if s:status_hidden  == 0 "set noshowmode
        set noruler | set laststatus=0 | let s:status_hidden = 1
    else "set showmode
        set ruler   | set laststatus=2 | let s:status_hidden = 0
    endif
endfunction

function! ToggleScheme()
    if     g:colors_name == 'pop-punk'  | colo eldar    | hi Normal guifg=#FFFFFF
    elseif g:colors_name == 'eldar'     | colo elflord  | hi Normal guifg=#FFFFFF
    elseif g:colors_name == 'elflord'   | colo delek    | hi Normal guifg=#000000
    elseif g:colors_name == 'delek'     | colo morning  | hi Normal guifg=#000000
    elseif g:colors_name == 'morning'   | colo atom     | hi Normal guifg=#FFFFFF
    elseif g:colors_name == 'atom'      | colo one      | hi Normal guifg=#FFFFFF
    else                | colo eldar    | colo pop-punk | hi Normal guifg=#FFFFFF guibg=NONE
                          hi  cursorline gui=NONE guibg=#220000 guifg=NONE
    end
    echo g:colors_name
    hi FoldColumn guibg=NONE guifg=#00FF00 gui=bold
    hi Folded     guibg=NONE guifg=#888888 gui=italic
    hi cursorcolumn cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guibg=NONE guifg=NONE
    syntax on
endfunction

function! CycleBackgroundColor()
    let i = 0
    let current_background = synIDattr(hlID("Normal"), "bg")  
    echo synIDattr(hlID("Normal"), "bg")
    for _ in g:myBg
        if current_background == _
            let j = (i + 1) % len(g:myBg)
            execute "highlight Normal guibg=" . g:myBg[j] . " guifg=" . g:myFg[j]
            return
        endif | let i += 1
    endfor
    if current_background == ''
        execute "highlight Normal guibg=" . g:myBg[1] . " guifg=" . g:myFg[1]
    else
        execute "highlight Normal guibg=" . g:myBg[0] . " guifg=" . g:myFg[1]
    endif
endfunction

function! ToggleWrap()
    if &wrap == ""
        ":set colorcolumn=80
        :set wrap
    else
        ":set colorcolumn=
        :set nowrap
    end
    :redraw
endfunction

function! ToggleCOC()
    if g:coc_enabled == "0"
        :CocEnable
    else
        :CocDisable
    end
endfunction

function! GetUrls()
    :v/\(href\|src\)\(=["][^"]*["\_]\)/d
    :%s/.*\(href\|src\)\(=["][^"]*["\_]\)/\1\2\r/g
    :v/\(href\|src\)\(=["][^"]*["\_]\)/d
    :%s/\(src\)\?[^"]*["]\([^"]*\)/\1 \2/g
    normal! gv
    :sort
    :%s/^[ ]\+\(.*\)/\1/
endfunction

function! GetUrls2()
    :%s/\("[^"]*"\)/\r\1\r/g
    :v/["]\(\(ftp\|http\|https\):[/][/]\|www[.]\)[^"]*"/d
endfunction

function! ToggleVirtualEdit()
    if virtualedit == none
        :set virtualedit=all
    else
        :set virtualedit=none
    end
endfunction

let g:is_bash = 1
"<--------- MAPPINGS ------------------------------------------------------->
nnoremap <leader>. :NERDTreeToggle<esc>
nnoremap <leader>1 :hi cursorline guibg=NONE guifg=NONE gui=bold cterm=NONE ctermbg=NONE ctermfg=NONE<esc>
nnoremap <leader>2 :PlugUpdate<CR>
nnoremap <leader>3 :PlugInstall<CR>
nnoremap <leader>a :call ToggleCOC()<esc>
nnoremap <leader>b :buffer<space>
nnoremap <leader>c :set nocursorline!<esc>
nnoremap <leader>d :buffers<esc>
nnoremap <leader>e :set cursorcolumn!<esc>
nnoremap <leader>f :call ToggleWrap()<esc>
nnoremap <silent><leader>h :call ToggleHiddenAll()<CR>
nnoremap <leader>j :call ToggleScheme()<CR>
nnoremap <leader>n :cnext<esc>
nnoremap <leader>s :%so "${HOME}/.config/nvim/init.vim"<esc>
nnoremap <leader>v :%s/\t/    /g<esc>
nnoremap <leader>w :w<esc>
nnoremap <leader>x :!%:p<esc>
nnoremap <leader>y :hi Normal guibg=Transparent<esc>
nnoremap <leader>z z
"nnoremap <leader>m         :             :call ToggleVirtualEdit()<esc>
"nnoremap <leader>cc        :             call ToggleScheme()<CR>
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
nnoremap <leader><leader> :<backspace>
nnoremap <leader>A :call CycleBackgroundColor()<CR><esc>
nnoremap <leader>B :Bracey<esc>
nnoremap <leader>H :vert helpgrep 
nnoremap <leader>N :cprevious<esc>

vnoremap <Space> zf
vnoremap ga <Plug>(EasyAlign)
vnoremap im :s/\%V[ \t]*//<esc>
nnoremap <silent> <esc> :noh <cr><esc>
nnoremap / /\v
nnoremap <lt> :tabprevious<esc>
nnoremap > :tabnext<esc>
nnoremap x "xx
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
noremap <leader>zaf gg/<c-r>0<esc>jVnkzf
noremap <leader>zv
map <leader>l :Lf<CR>
"<--------- STATUS LINE ---------------------------------------------------->
set statusline=\ %F\ \|
set statusline+=\%l\(%L\)\|%v\ 
set statusline+=%m\ 
set statusline+=%=\ %L\ l,\ 
set statusline+=%{wordcount().words}\ w\ 
"<--------- EXTRA ---------------------------------------------------------->
augroup bashiez
    au!
    autocmd BufNewFile,BufRead *.sh set syntax=zsh
augroup END

autocmd BufNewFile,BufRead ~/.config/polybar/config setfiletype dosini
autocmd BufNewFile,BufRead ~/.config/i3/*           setfiletype i3
"<--------- INFO ----------------------------------------------------------->
"                   %<"      _-_is expanded to the name of the current buffer
"    :help key-notation      _-_for list of keys and their names
"<-------------------------------------------------------------------------->

