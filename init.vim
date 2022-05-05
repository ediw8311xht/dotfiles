
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
"set laststatus=2
set autoindent

set backup
set undofile
set undolevels=1000
set undoreload=10000
set dir=~/.mynvim/swapfiles
set backupdir=~/.mynvim/backupfiles
set undodir=~/.mynvim/undo_dir
set timeout 
set timeoutlen=1000
set ttimeoutlen=0
	
"let g:airline_powerline_fonts = 1
" Enable Autocompletion
set wildmode=longest,list,full

syntax on
" Disables Autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


"let g:ale_lint_on_save = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_set_highlights = 1
" show number of errors
"set statusline+=\ %{LinterStatus()}


call plug#begin()
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'marko-cerovac/material.nvim'
Plug 'agude/vim-eldar'
Plug 'romgrk/github-light.vim'
"Plug 'ray-x/starry.nvim'
"Plug 'bignimbus/pop-punk.vim'
"Plug 'dense-analysis/ale'
"Plug 'preservim/vim-markdown'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'https://github.com/powerline/powerline.git'
"Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
call plug#end()


function! MyW()
	:set wrap!
	:redraw!
endfunction

"function! MyC()
"	if &l:colorscheme == eldar
"		colorscheme github-light
"	end
"endfunction

":call MyC()

colorscheme eldar

"nnoremap <leader>l :lua require('material.functions').toggle_style()<CR>
let b:coc_diagnostic_disable=1

"hi Normal guibg=NONE ctermbg=NONE

" format error strings
hi CursorLineNr guifg=#00FF00
set cursorline
" hi CursorLine 		cterm=Reverse term=Reverse ctermbg=17 ctermfg=30
hi CursorLine 		term=Bold cterm=Bold ctermbg=18
set cursorcolumn
hi cursorcolumn 	gui=Bold cterm=Bold ctermbg=0
" hi CursorColumn 	ctermfg=31 ctermbg=0
" hi cursorcolumn 	cterm=Reverse			ctermbg=9


set nowrap
set number
"set textwidth=0
"set wrapmargin=0
"set linebreak 
"set columns=80 

"function! TzWrap() 
"	if &l:wrap == 0
"		set textwidth=0
"		set wrapmargin=0
"		set linebreak 
"		set columns=80 
"		set colorcolumn=80
"		set wrap!
"		redraw!
"	else
"		set colorcolumn=0
"		set wrap!
"		redraw!
"	endif
"endfunction

"nnoremap <space> :NERDTree<enter>

function! MyW()
	:set wrap!
	:redraw!
endfunction

nnoremap <F3> :call MyW()<esc>

"xnoremap <esc> i:q

nnoremap <silent> <esc> :noh<cr><esc>

nnoremap <Leader>m iHello Me

"au BufReadPost $HOME/.i3/config set syntax=i3config.vim

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" map <silent> <Leader>s ah

set statusline=
set statusline+=%f\ 
set statusline+=%m
set statusline+=\ 
set statusline+=%=
set statusline+=\|\  
set statusline+=%L
set statusline+=\ l
set statusline+=\ \|\ 
set statusline+=%{wordcount().words}
set statusline+=\ w\ 
set statusline+=\|

