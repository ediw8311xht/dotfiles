
filetype on

let g:mapleader = ","
let mapleader = ","
let maplocalleader = ","

set termguicolors
"let &t_SI = "\<ESC>[3 q" 
"let &t_EI = "\<ESC>[4 q" 

set t_Co=256
set nocompatible
set modelines=0
set nu
set rnu
set ruler

"neoclide 
set encoding=utf-8
set hidden
set updatetime=200
"

set nowrap
set textwidth=0
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus
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

set wildmode=longest,list,full

syntax on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


call plug#begin()
Plug 'prettier/vim-prettier'
Plug 'godlygeek/tabular'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'marko-cerovac/material.nvim'
Plug 'agude/vim-eldar'
Plug 'romgrk/github-light.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'dense-analysis/ale'
Plug 'AndrewRadev/tagalong.vim'
Plug 'sukima/xmledit'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'VebbNix/lf-vim'
call plug#end()

lua << EOF
require('nvim-ts-autotag').setup()
require("nvim-autopairs").setup {}
EOF

let g:html_mode = 1
let g:tagalong_verbose = 1

let g:ale_fixers = {
 \ 'html': ['prettier'],
 \'css': ['stylelint'],
 \ }
let g:ale_linters = {
 \ 'html': ['htmlhint'],
 \ 'css': ['stylelint'],
 \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

"MAKE SURE COLORSCHEME IS ABOVE CTERM BG
colorscheme eldar

set guicursor=n:block90,i:ver20

hi MatchParen cterm=none ctermbg=none ctermfg=none
hi MatchParen gui=bold guifg=none guibg=grey

function! ToggleScheme()
	if g:colors_name == 'eldar'
		colorscheme elflord
		"highlight Normal guibg=darkgrey ctermbg=darkgrey ctermfg=0
		hi cursorline gui=bold guifg=none guibg=#444444
		hi cursorcolumn 	cterm=bold ctermfg=none ctermbg=none
		highlight LineNr guibg=#444444 guifg=white
	elseif g:colors_name == 'elflord'
		colorscheme morning
		highlight Normal guibg=lightgray ctermbg=darkgrey ctermfg=0
		hi cursorline gui=bold guifg=none guibg=#BBBBBB
		highlight LineNr guibg=#444444 guifg=white
	elseif g:colors_name == 'morning'
		colorscheme material
		let g:material_style = "oceanic"
		hi cursorline gui=bold guifg=none guibg=black cterm=bold ctermfg=none ctermbg=18
		highlight LineNr guifg=white
	else 
		colorscheme eldar
		set cursorline
		hi cursorline gui=bold guifg=none guibg=darkblue cterm=bold ctermfg=none ctermbg=18
		set nocursorcolumn
		highlight LineNr guibg=#000000 guifg=darkgrey
	end
	syntax on
endfunction

set cursorline
hi cursorline 		gui=bold guifg=none guibg=darkblue cterm=bold ctermfg=none ctermbg=18
set nocursorcolumn
hi cursorcolumn 	cterm=italic,bold ctermfg=none ctermbg=none gui=underline guifg=none guibg=none
set splitright
highlight LineNr guibg=#111111 guifg=darkgrey
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

function! ToggleCColumn()
	if &cursorline == ""
		set cursorline!
	elseif &cursorline == ""
		set cursorline!
	else
		set cursorline!
	end
endfunction

"function! OpenAll()
"
"	for s in 
"endfunction

function! ExecuteFunc()
	echo &highlight Normal
endfunction

"function! CocToggle()
"	if 

nnoremap x "xx

nnoremap <silent> <esc> :noh<cr><esc>
nnoremap <leader> :<backspace>

nnoremap <leader>. :NERDTreeToggle<esc>
nnoremap <leader>b :Bracey<esc>
nnoremap <leader>c :set nocursorline!<esc>
nnoremap <leader>e :set cursorcolumn!<esc>
nnoremap <leader>f :call ToggleWrap()<esc>
nnoremap <leader>h :vert helpgrep 
nnoremap <leader>j :call ToggleScheme()<CR>
nnoremap <leader>l :lua require('material.functions').toggle_style()<CR>
nnoremap <leader>n :cnext<esc>
nnoremap <leader>q :wq<esc>
nnoremap <leader>s :%so "${HOME}/.config/nvim/init.vim"<esc>
nnoremap <leader>w :w<esc>
nnoremap <leader>x :!%:p<esc>
nnoremap <leader>z :!%<esc>


nnoremap <leader>N :cprevious<esc>
nnoremap <leader>a :toggle:


" --------- TAB STUFF --------------#
nnoremap <leader>tt :tabnew<esc>
nnoremap <leader>tn :tabnext<esc>
nnoremap <leader>tp :tabprevious<esc>
nnoremap <leader>tb :tabprevious<esc>
nnoremap <leader>tm :tabmove


"nnoremap <leader>to :tabonly<esc>
"nnoremap <leader>tc :tabclose<esc>

"nnoremap <leader><leader> :call ExecuteFunc()<esc>

set statusline=\ %f\ \|
set statusline+=\%l\(%L\)\|%V\ 
set statusline+=%m\ 
set statusline+=%=\ %L\ l,\ 
set statusline+=%{wordcount().words}\ w\ 

autocmd BufNewFile,BufRead ~/.config/polybar/config setfiletype dosini
"autocmd BufNewFile,BufRead ~/.config/lf/lfrc setfiletype dosini


"------------ DON'T DELETE FOR REFERENCE------"
" possible to toggle cursorcolumn, 
" set cursorcolumn! or set nocursorcolumn
"-------------------SETBACKGROUND-AND-FOREGROUND--------------"
" highlight Normal ctermfg=grey ctermbg=darkblue
"augroup myCmds
"au!
"autocmd VimEnter * silent !echo -ne "\e[2 q"
"augroup END


"let g:ale_lint_on_save = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_set_highlights = 1
" show number of errors
"set statusline+=\ %{LinterStatus()}

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ray-x/starry.nvim'
"Plug 'bignimbus/pop-punk.vim'
"Plug 'dense-analysis/ale'
"Plug 'preservim/vim-markdown'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'https://github.com/powerline/powerline.git'

"let b:coc_diagnostic_disable=1
