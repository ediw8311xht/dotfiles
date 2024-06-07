
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
let jam        = 'hi FoldColumn gui=bold guibg=NONE guifg=#00ff00'
let GreatJammy = ':call CorrectColors()'
let g:myScheme = [ 'pop-punk', 'eldar', 'elflord', 'delek', 'morning', 'blue', 'peachpuff', 'industry', 'murphy'] + [ 'cyberpunk-neon' ]
let g:mySpec   = [        ".",     jam,       ".",     ".",       ".",    ".",         '.',        '.', '.'] + [ GreatJammy ]
let g:myBg     = [ "#000000", "#333333", "#111111", "#220000", "#002200", "#000022", "#002244" ] + [ "NONE" ]
let g:myFg     = [         ".",         ".",         ".",         ".",         ".",         ".", "#aaawaa" ] + [ "." ]
let g:python3_host_prog="/usr/bin/python"

match ExtraWhiteSpace /[^\s]\s\+\zs$/

source ${HOME}/.config/nvim/functions.vim
source ${HOME}/.config/nvim/plugins.vim
lua require('mytreesitter')
lua require('base')

filetype on
filetype plugin on
filetype plugin indent on
syntax on
set autoread
set autoindent
set backup
set clipboard=unnamedplus
set encoding=utf-8
set formatoptions=tcqrn1
set hidden
set magic
set modelines=0
set nocompatible
set nowrap
set nu
set rnu
set ruler
set signcolumn=yes:2
set splitright
set t_Co=256
set termguicolors
set textwidth=0
set undofile
set undolevels=10000
set undoreload=10000
set updatetime=400
"set dir=~/.mynvim/swapfiles
"set backupdir=~/.mynvim/backupfiles
" [Retain undo history if file is edited outside of Vim](https://stackoverflow.com/a/75553217)
" Thank you Steven Lu
let nvim_backup_swap = $HOME . '/.mynvim/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=nvim_backup_swap
let &directory=nvim_backup_swap
set undodir=~/.mynvim/undo_dir
set backup
"set notimeout
set timeoutlen=500
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
set guicursor=n:block90,i:ver20
set cul
set nocuc
set cedit=\<C-c>

set statusline=\ [%n]\ 
set statusline+=\ %F\ 
set statusline+=%m\ 
set statusline+=%=\(\ %l\/%L\ \)\ (%v\)\ 
set statusline+=%{wordcount().words}\ w\ 
set statusline+=%{LspStatus()}

let g:coc_start_at_startup = v:true
let g:coc_enable_at_startup = v:false
let g:mapleader = " "
let mapleader = " "
let maplocalleader = ","
let g:lf_map_keys   = 0
let g:html_mode     = 1
let g:is_bash       = 1
colorscheme pop-punk
:call CorrectColors()

source ${HOME}/.config/nvim/leader_bindings.vim
source ${HOME}/.config/nvim/etc_bindings.vim
source ${HOME}/.config/nvim/autocmd.vim

"let g:bracey_refresh_on_save    = 1
"let g:bracey_eval_on_save       = 1
"let g:bracey_auto_start_browser = 0
"let g:bracey_server_port        = 4842
