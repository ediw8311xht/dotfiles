
filetype on

let g:mapleader = ","
let mapleader = ","
let maplocalleader = ","

let &t_SI = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

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

" Disables Autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable Autocompletion
set wildmode=longest,list,full

augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

call plug#begin()

Plug 'bignimbus/pop-punk.vim'

call plug#end()

syntax on
colorscheme pop-punk


set cursorline
hi CursorLine 		term=Italic cterm=Bold ctermbg=18
set cursorcolumn
hi cursorcolumn 	gui=Bold cterm=Bold ctermbg=0

nnoremap <space> a<space><esc>
nnoremap <silent> <esc> :noh<cr><esc>

au BufReadPost $HOME/.i3/config set syntax=i3config.vim



set statusline=\ \%10f
set statusline+=\ %m
set statusline+=%=
set statusline+=%(\ %3l,%3c\ %)
set statusline+=%(%y%)\ \ 
