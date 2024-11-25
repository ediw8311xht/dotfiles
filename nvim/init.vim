
"<==============================================================================>
"<==------------------======================================------------------==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==-----    ||||-----==__________________________________==-----    ||||-----==>
"<==-    ||||||||||||-==                                  ==-    ||||||||||||-==>
"<==-    ||||||||||||-== Nvim Config - Maximilian Ballard ==-    ||||||||||||-==>
"<==-----    ||||-----==__________________________________==-----    ||||-----==>
"<==-----    ||||-----==                                  ==-----    ||||-----==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==------------------======================================------------------==>
"<==============================================================================>
"<==============================================================================>

let g:MyDefaultScheme = [ 'pop-punk', 'call CorrectColors()' ]

let g:MySchemes=[ 
    \g:MyDefaultScheme  ,
    \[ 'cyberpunk-neon' ,   'call CorrectColors()'  ],
    \[ 'eldar'          ,   "."                     ],
    \[ 'elflord'        ,   "."                     ],
    \[ 'delek'          ,   "."                     ],
    \[ 'morning'        ,   "."                     ],
    \[ 'blue'           ,   "."                     ],
    \[ 'peachpuff'      ,   "."                     ],
    \[ 'industry'       ,   "."                     ],
    \[ 'murphy'         ,   "."                     ],
\]

let g:myBg          = [ "#010101",  "#333333",  "#111111", "#220000",  "#002200",  "#000022",  "#002244" ] + [ "NONE" ]
let g:myFg          = [ ".",        ".",         ".",       ".",        ".",        ".",        "#aaawaa" ] + [ "." ]

let g:python3_host_prog="/usr/bin/python"

filetype on
filetype plugin on
filetype plugin indent on
syntax enable
set autoread
set autoindent
set backup
set clipboard=unnamedplus
set encoding=utf-8
set formatoptions=tcqrn1
set hidden
set magic
set modelines=5
set nocompatible
set nowrap
set number
set relativenumber
set ruler
set signcolumn=auto:2-9
set splitright
set t_Co=256
"set termguicolors
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
set statuscolumn=
"set laststatus=3
"set stc=%s%r%=\ %l\ \|\ 
"Make sure vimwiki doesn't run on markdown not in ~/vimwiki dir.
let g:vimwiki_global_ext = 0

set statusline=%t\ 
set statusline+=%r
set statusline+=%m
"set statusline+=%=
"set statusline+=[%v]\ (%L\ lines)\ 
"set statusline+=(%{wordcount().words}\ words\)
set statusline+=%=
"set statusline+=%#HLspStatus#%{LspStatus()}
set statusline+=%*
set statusline+=[%{LspStatus()}]\ 
set statusline+=[%F]

let g:neoterm_automap_keys=',Tt'
let g:floaterm_opener='edit'
let g:lf_width=0.9
let g:lf_height=0.9
"let g:floaterm_borderchars='        '

let g:coc_start_at_startup = v:true
let g:coc_enable_at_startup = v:false
let g:mapleader = " "
"let mapleader = " "
let g:maplocalleader = ","
let g:lf_map_keys    = 0
let g:html_mode      = 1
let g:is_bash        = 1
let g:vlime_leader   = "~"
"-------Latex----------"
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
    \ 'out_dir' : '/tmp',
    \}
    "\ 'aux_dir' : '',
    "\ 'callback' : 1,
    "\ 'continuous' : 1,
    "\ 'executable' : 'latexmk',
    "\ 'hooks' : [],
    "\ 'options' : [
    "\   '-verbose',
    "\   '-file-line-error',
    "\   '-synctex=1',
    "\   '-interaction=nonstopmode',
    "\ ],
    "\}

"set conceallevel=1
"let g:tex_conceal='abdmg'
"----------------------"

lua require('functions')
lua require('autocmd')
source ${HOME}/.config/nvim/plugins.vim
source ${HOME}/.config/nvim/functions.vim
lua require('mytreesitter')
lua require('base')

colorscheme pop-punk

lua require('mappings')
lua require('textobjects')

:call CorrectColors()

"let g:bracey_refresh_on_save    = 1
"let g:bracey_eval_on_save       = 1
"let g:bracey_auto_start_browser = 0
"let g:bracey_server_port        = 4842
