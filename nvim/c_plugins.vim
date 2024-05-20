
"<--------- PLUGINS -------------------------------------------------------->
call plug#begin()
" Treesitter                        #
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Treesitter, extra stuff           #
    "Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" LSP-config                        #
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'

" Show-all-matching-tags-vim        #
    Plug 'andymass/vim-matchup'

" Aligning text                     #
    "Plug 'godlygeek/tabular'

" Autoclose HTML tags               #
" Plug 'alvan/vim-closetag'         #

" Autorename HTML tags #            #
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'elixir-tools/elixir-tools.nvim'

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

" For using lf in nvim              #
    Plug 'voldikss/vim-floaterm'
    Plug 'ptzz/lf.vim'

" Syntax Highlighting, Detection Elixir #
    Plug 'elixir-editors/vim-elixir'

" Colorscheme                       #
    Plug 'folke/tokyonight.nvim'

" Extra Syntax                      #
    Plug 'VebbNix/lf-vim'
    Plug 'PotatoesMaster/i3-vim-syntax'

call plug#end()







