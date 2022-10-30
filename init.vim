
filetype on

let g:mapleader = ","
let mapleader = ","
let maplocalleader = ","

let &t_SI = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


"let g:powerline_pycmd="py3"
set nocompatible
set modelines=0
set number
set relativenumber
set ruler
set encoding=utf-8
set nowrap
set textwidth=0
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus
set timeoutlen=50
set ttimeoutlen=5
set laststatus=2
set autoindent

set backup
set undofile
set undolevels=1000
set undoreload=10000
set dir=~/.mynvim/swapfiles
set backupdir=~/.mynvim/backupfiles
set undodir=~/.mynvim/undo_dir



"let g:airline_powerline_fonts = 1
" Enable Autocompletion
set wildmode=longest,list,full

" Disables Autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 1
" show number of errors
"set statusline+=\ %{LinterStatus()}


call plug#begin()
Plug 'bignimbus/pop-punk.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'https://github.com/powerline/powerline.git'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
call plug#end()

syntax on
colorscheme mypoppunk

hi Normal guibg=NONE ctermbg=NONE

" format error strings
" hi CursorLineNr guifg=#00FF00
set cursorline
" hi CursorLine 		cterm=Reverse term=Reverse ctermbg=17 ctermfg=30
hi CursorLine 		term=Bold cterm=Bold ctermbg=18
set cursorcolumn
hi cursorcolumn 	gui=Bold cterm=Bold ctermbg=0
" hi CursorColumn 	ctermfg=31 ctermbg=0
" hi cursorcolumn 	cterm=Reverse			ctermbg=9

nnoremap <space> a<space><esc> 
    
nnoremap <silent> <esc> :noh<cr><esc>

au BufReadPost $HOME/.i3/config set syntax=i3config.vim


" map <silent> <Leader>s ah

"set statusline=
