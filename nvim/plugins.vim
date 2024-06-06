"<--------- PLUGINS -------------------------------------------------------->
call plug#begin()
" LSP-config                        #
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'nvimdev/lspsaga.nvim'
" key hints"
    Plug 'folke/which-key.nvim'
" git                               #
    Plug 'lewis6991/gitsigns.nvim'
" show-all-matching-tags-vim        #
    Plug 'andymass/vim-matchup'
" Autorename HTML tags              #
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'elixir-tools/elixir-tools.nvim'
" Auto-save-restore-view :) --best plugin #
    Plug 'vim-scripts/restore_view.vim'
" Real-time HTML/CSS/JS Editor      #
    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
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
" colorscheme                       #
    Plug 'folke/tokyonight.nvim'
" syntax                            #
    Plug 'VebbNix/lf-vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
" lisp                              #
    Plug 'vlime/vlime', {'rtp': 'vim/'}
    Plug 'vim-scripts/paredit.vim'
" show marks                        #
    Plug 'chentoast/marks.nvim'
" Org Mode                          #
    Plug 'nvim-orgmode/orgmode'
call plug#end()
" Aligning text                     #
    "Plug 'godlygeek/tabular'
" Autoclose HTML tags               #
" Plug 'alvan/vim-closetag'         #
" Treesitter                        #
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Treesitter, extra stuff           #
    "Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Showmarks/ Better marks           #
    "Plug 'chentoast/marks.nvim'
