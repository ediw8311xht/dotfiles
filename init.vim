
filetype on

let g:mapleader = ","
let mapleader = ","
let maplocalleader = ","

let &t_SI = "\<Esc>[4 q" 
let &t_EI = "\<Esc>[2 q"

set t_Co=256
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
"set laststatus=3
set autoindent

set backup
set undofile
set undolevels=1000
set undoreload=10000
set dir=~/.mynvim/swapfiles
set backupdir=~/.mynvim/backupfiles
set undodir=~/.mynvim/undo_dir
set timeout 
set timeoutlen=700
set ttimeoutlen=0

"colorscheme mustang
"let g:airline_powerline_fonts = 1
" Enable Autocompletion
set wildmode=longest,list,full

syntax on
" Disables Autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"augroup myCmds
"au!
"autocmd VimEnter * silent !echo -ne "\e[2 q"
"augroup END


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
call plug#end()


"set background=light
"set cursorline 
"MAKE SURE COLORSCHEME IS ABOVE CTERM BG
colorscheme eldar

function! ToggleScheme()
	if g:colors_name == 'eldar'
		colorscheme github-light
	else 
		colorscheme eldar
	end
endfunction


function! ToggleWrap()
	if &colorcolumn == ""
		:set colorcolumn=80
		:set wrap
	else
		:set colorcolumn=
		:set nowrap
	end
	:redraw
endfunction

function! ExecuteFunc()
	if &colorcolumn == ""
		:set colorcolumn=80
		:set wrap
	else
		:set colorcolumn=
		:set nowrap
	end
	:redraw
endfunction

nnoremap <silent> <esc> :noh<cr><esc>

"------------------------------------------LEFT_HAND
nnoremap <leader>f :call ToggleWrap()<esc>

nnoremap <leader>w :w<esc>

nnoremap <leader>s :%so "${HOME}/.config/nvim/init.vim"<esc>

nnoremap <leader>x :!%<esc>

nnoremap <leader>d qd<esc>

nnoremap <leader><leader> @d<esc>

nnoremap <leader>c :set nocursorline!<esc>

nnoremap <leader>e :set nocursorcolumn!<esc>

"-----------------------------------------RIGHT_HAND

nnoremap <leader>j :call ToggleScheme()<CR>

nnoremap <leader>l :lua require('material.functions').toggle_style()<CR>

nnoremap <leader>. :NERDTreeToggle<esc>

nnoremap <leader>. :NERDTreeToggle<esc>
"nnoremap <leader><leader> <esc>

highlight clear LineNr 
set cursorline
hi cursorline 		cterm=undercurl
"hi cursorline 		cterm=undercurl
set nocursorcolumn
hi cursorcolumn 	cterm=bold ctermfg=none ctermbg=none
"hi columnline


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let b:coc_diagnostic_disable=1

set statusline=\ 
set statusline+=%f\ 
set statusline+=[%4l]
set statusline+=[%4v]
set statusline+=%m\ 

set statusline+=%=
set statusline+=\  
set statusline+=%L
set statusline+=\ l,
set statusline+=\ 
set statusline+=%{wordcount().words}
set statusline+=\ w\ 

"------------ DON'T DELETE FOR REFERENCE------"
" possible to toggle cursorcolumn, 
" set cursorcolumn! or set nocursorcolumn
