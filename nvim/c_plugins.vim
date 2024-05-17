
"<--------- PLUGINS -------------------------------------------------------->
call plug#begin()
" Language Servers. Use release branch (recommend) #
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Treesitter                        #
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Treesitter, extra stuff           #
    "Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Show-all-matching-tags-vim        #
    Plug 'andymass/vim-matchup'

" Aligning text                     #
    "Plug 'godlygeek/tabular'

" Autoclose HTML tags               #
" Plug 'alvan/vim-closetag'         #

" Autorename HTML tags #            #
    Plug 'AndrewRadev/tagalong.vim'

" Extra Syntax                      #
    Plug 'VebbNix/lf-vim'
    Plug 'PotatoesMaster/i3-vim-syntax'

" Auto-save-restore-view :) --best plugin #
    Plug 'https://github.com/vim-scripts/restore_view.vim'

" Real-time HTML/CSS/JS Editor      #
    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" Showmarks/ Better marks           #
    Plug 'chentoast/marks.nvim'

" Requirements for lilypond (not using anymore), cool ui stuff #
    Plug 'MunifTanjim/nui.nvim'

" Fzf Finder                        #
    Plug 'junegunn/fzf.vim'

" Markdown Preview                  #
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Semantic Highlighting for Python  #
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" For lf.vim                        #
    Plug 'voldikss/vim-floaterm'
    Plug 'ptzz/lf.vim'

" Elixir                            #
    Plug 'elixir-editors/vim-elixir'

" colorscheme tokyonight            #
    Plug 'folke/tokyonight.nvim'

call plug#end()







