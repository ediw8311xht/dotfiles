
"
"             ----------------------
"             | Vim Config         |
"             | Maximilian Ballard |
"             ----------------------
"

" --------- LET/SET -------------------------------------------------------->
filetype on
let g:mapleader = ","
let mapleader = ","
let maplocalleader = ","


set termguicolors
"let &t_SI = "\<ESC>[3 q" 
"let &t_EI = "\<ESC>[4 q" 

set splitright
set t_Co=256
set nocompatible
set modelines=0
set nu
set rnu
set ruler
"neoclide 
"set encoding=utf-8
set hidden
set updatetime=200
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
set foldcolumn=auto:4
set showmode
syntax on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" --------- MY VARS -------------------------------------------------------->

let g:myBg = ["none", "#000000",  "#333333", "#111111", "#220000", "#002200", "#000022", "#FFFFFF"]
let g:myFg = [".", 	".", 	    ".",       ".",       ".",       ".",       ".",       "#000000"]


"<--------- PLUGINS -------------------------------------------------------->
call plug#begin()
Plug 'agude/vim-eldar'
Plug 'romgrk/github-light.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'marko-cerovac/material.nvim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'VebbNix/lf-vim'
Plug 'prettier/vim-prettier'
Plug 'godlygeek/tabular'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'dense-analysis/ale'
Plug 'AndrewRadev/tagalong.vim'
Plug 'sukima/xmledit'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/vim-scripts/restore_view.vim',
Plug 'rakr/vim-one'
call plug#end()

"<--------- LUA ------------------------------------------------------------>

lua << EOF
require('nvim-ts-autotag').setup()
require("nvim-autopairs").setup {}
EOF

let g:html_mode = 1
let g:tagalong_verbose = 1
let g:ale_fixers = {
 \'css': ['stylelint'],
 \ }
let g:ale_linters = {
 \ 'html': ['htmlhint'],
 \ 'css': ['stylelint'],
 \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1


"<--------- COLOR SCHEME STUFF --------------------------------------------->
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight Visual cterm=NONE ctermbg=none ctermfg=16 gui=NONE guibg=#333333 guifg=#00FF00
                      \ | highlight StatusLine cterm=NONE ctermbg=none ctermfg=160 gui=NONE guibg=#222222 guifg=#009900
                      \ | highlight Normal cterm=NONE ctermbg=17 gui=NONE guibg=none
                      \ | highlight NonText cterm=NONE ctermbg=17 gui=NONE guibg=none
	                  \ | highlight LineNr			   guibg=none guifg=#0088F3
augroup END

" -!!!!!!!- MAKE SURE COLORSCHEME IS ABOVE CTERM BG
colorscheme eldar

set guicursor=n:block90,i:ver20

hi CocSearch ctermfg=none guifg=none
hi CocMenuSel ctermbg=none guibg=none
hi MatchParen cterm=none ctermbg=none ctermfg=none
hi MatchParen gui=bold guifg=none guibg=none
set cursorline
hi cursorline 		gui=bold guifg=none guibg=darkblue cterm=bold ctermfg=none ctermbg=18
set nocursorcolumn
hi cursorcolumn 	cterm=italic,bold ctermfg=none ctermbg=none gui=underline guifg=none guibg=none

hi FoldColumn    			   guibg=none guifg=#00FF00 gui=bold
hi Folded 	                   guibg=none guifg=#888888 gui=bold,italic

"<--------- FUNCTIONS ------------------------------------------------------>

let s:status_hidden = 0 | function! ToggleHiddenAll()
	" https://unix.stackexchange.com/questions/140898/vim-hide-status-line-in-the-bottom/140899#140899
	" from user - cuonglm - https://unix.stackexchange.com/users/38906/cuonglm
    if s:status_hidden  == 0
        "set noshowmode
        set noruler
        set laststatus=0
        let s:status_hidden = 1
    else
        "set showmode
        set ruler
        set laststatus=2
        let s:status_hidden = 0
    endif
endfunction


function! 							ToggleScheme()
	if     g:colors_name == 'eldar'           | colorscheme elflord
	elseif g:colors_name == 'elflord'         | colorscheme delek
	elseif g:colors_name == 'delek' 		  | colorscheme morning
	elseif g:colors_name == 'morning'         | let g:material_style = "oceanic" | colorscheme material
	elseif g:colors_name == 'material'        | colorscheme atom
	elseif g:colors_name == 'atom'            | colorscheme one
	else                                      | colorscheme eldar
		set cursorline
		hi cursorline gui=bold guifg=none guibg=darkblue cterm=bold ctermfg=none ctermbg=none
		set nocursorcolumn
	end
	highlight Normal guifg=#FFFFFF
	echo g:colors_name
	hi FoldColumn    			   guibg=none guifg=#00FF00 gui=bold
	hi Folded 	                   guibg=none guifg=#888888 gui=bold,italic
	syntax on
endfunction


function! 							CycleBackgroundColor()
	let i = 0
	for _ in g:myBg
		if synIDattr(hlID("Normal"), "bg") == _
			let j = (i + 1) % len(g:myBg)
			execute "highlight Normal guibg=" . g:myBg[j] . " guifg=" . g:myFg[j]
			echo g:myBg[j] . " - " g:myFg[j]
			return
		endif | let i += 1 | endfor
	execute "highlight Normal guibg=" . g:myBg[0]
endfunction


function! 							ToggleWrap()
	if &wrap == ""
		":set colorcolumn=80
		:set wrap
	else
		":set colorcolumn=
		:set nowrap
	end
	:redraw
endfunction


function! 							ToggleCOC()
	if g:coc_enabled == "0"
		:CocEnable
	else
		:CocDisable
	end
endfunction



"<--------- MAPPINGS ------------------------------------------------------->

"REGULAR"
nnoremap x "xx
nnoremap <silent> <esc>      :noh                 <cr><esc>
nnoremap <leader><leader>    :<backspace>
nnoremap <leader>.           :			          NERDTreeToggle<esc>

nnoremap <leader>a           :call 		          ToggleCOC()<esc>
nnoremap <leader>b           :call				  CycleBackgroundColor()<CR><esc>
nnoremap <silent><leader>h   :call                ToggleHiddenAll()<CR>
nnoremap <leader>f           :call                ToggleWrap()<esc>
nnoremap <leader>j           :call                ToggleScheme()<CR>

nnoremap <leader>c           :set 			   	  nocursorline!<esc>
nnoremap <leader>e           :set                 cursorcolumn!<esc>
nnoremap <leader>l           :lua                 require('material.functions').toggle_style()<CR>
nnoremap <leader>n           :                    cnext<esc>
nnoremap <leader>q           :                    wq<esc>
nnoremap <leader>s           :                    %so "${HOME}/.config/nvim/init.vim"<esc>
nnoremap <leader>w           :                    w<esc>
"nnoremap <leader>y           :                    hi Normal guibg=Transparent<esc>
nnoremap <leader>1           :                    hi cursorline guibg=none guifg=none gui=bold cterm=none ctermbg=none ctermfg=none<esc>
nnoremap <leader>x           :                    !%:p<esc>

nnoremap <leader><S-h> :vert helpgrep 
nnoremap <leader><S-b> :Bracey<esc>
nnoremap <leader><S-n> :cprevious<esc>


"FOLD + TAB STUFF"
nnoremap <leader>z z
"     THIS TOGGLES FOLD 'https://vim.fandom.com/wiki/Folding#Mappings_to_toggle_folds'
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

nnoremap <leader>tt :tabnew<esc>
nnoremap <leader>tn :tabnext<esc>
nnoremap <leader>tp :tabprevious<esc>
nnoremap <leader>tb :tabprevious<esc>
nnoremap <leader>tm :tabmove
"nnoremap <leader>to :tabonly<esc>
"nnoremap <leader>tc :tabclose<esc>
"nnoremap <leader><leader> :call ExecuteFunc()<esc>


"<--------- STATUS LINE ---------------------------------------------------->
set statusline=\ %f\ \|
set statusline+=\%l\(%L\)\|%V\ 
set statusline+=%m\ 
set statusline+=%=\ %L\ l,\ 
set statusline+=%{wordcount().words}\ w\ 


"<--------- EXTRA ---------------------------------------------------------->

autocmd BufNewFile,BufRead ~/.config/polybar/config setfiletype dosini


