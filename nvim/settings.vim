

let g:python3_host_prog="/usr/bin/python"

filetype on
filetype plugin on
"filetype plugin indent on
syntax enable
let g:markdown_recommended_style=0
set shada=!,'300,<50,:30,s10,h
set termguicolors
set autoread
set nocindent
set backup
set clipboard=unnamedplus
set encoding=utf-8
set formatoptions=tcqrn1
set hidden
set magic
set modelines=5
set nocompatible
set nowrap
"-------------------line numbers 
set number
set relativenumber
set ruler
set signcolumn=auto:1-5
set splitright
set t_Co=256
"set termguicolors
set textwidth=0
set undofile
set undolevels=10000
set undoreload=10000
set updatetime=400
"let NERDTreeIgnore = ['\.o$']
"set dir=~/.mynvim/swapfiles
"set backupdir=~/.mynvim/backupfiles
" [Retain undo history if file is edited outside of Vim](https://stackoverflow.com/a/75553217)
"set tags=$HOME/.config/.ctags
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
"let g:vimwiki_global_ext = 0
"set statusline=%t\ 
"set statusline+=%r
"set statusline+=%m
""set statusline+=%=
""set statusline+=[%v]\ (%L\ lines)\ 
""set statusline+=(%{wordcount().words}\ words\)
"set statusline+=%=
"set statusline+=[%#HLspStatus#%{LspStatus()}
"set statusline+=%*]
""set statusline+=[%{LspStatus()}]\ 
"set statusline+=[%f]
"set statusline+=[%h%w%m%r%=%-14.(%l,%c%V%)\ %p%%]
let g:neoterm_automap_keys=',Tt'
let g:floaterm_opener='edit'
let g:lf_width=0.9
let g:lf_height=0.9
"let g:floaterm_borderchars='        '
autocmd FileType bash setlocal keywordprg=:Man
"let g:coc_start_at_startup = v:false
"let g:coc_enable_at_startup = v:false
let g:mapleader = " "
"let mapleader = " "
let g:maplocalleader = ","
let g:lf_map_keys    = 0
let g:html_mode      = 1
let g:is_bash        = 1
"-------Latex----------"
let g:tex_flavor='latex'
let g:vimtex_compiler_latexmk = { 'out_dir' : '/tmp', }
let g:vimtex_quickfix_mode=0
let g:vimtex_view_method='zathura'
let g:vimtex_view_continuous=1
set foldmethod=manual
set foldcolumn=2
set sessionoptions=blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,folds
set viewoptions=cursor,folds

"set foldexpr=''
"set foldexpr='v:lua.vim.treesitter.foldexpr()'
"set foldexpr='v:lua.vim.treesitter.foldexpr()'

"set foldlevel=99
"set foldlevelstart=99
"set foldtext=''
"set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions
",localoptions
"set foldlevel=99
"set foldlevelstart=1
"set foldnestmax=2
"let g:fzf_vim = {
"            \ }

"let g:fzf_vim.buffers_options = ['--style', 'full', '--border-label', ' Open Buffers ']
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

"let g:bracey_refresh_on_save    = 1
"let g:bracey_eval_on_save       = 1
"let g:bracey_auto_start_browser = 0
"let g:bracey_server_port        = 4842

