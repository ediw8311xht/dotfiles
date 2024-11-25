
let g:my_plugins = {
\    "luasnip":                     [ 'L3MON4D3',           'LuaSnip'                       ],
\    "cmp":                         [ 'hrsh7th',            'cmp-nvim-lsp'                  ],
\    "cmp buffer":                  [ 'hrsh7th',            'cmp-buffer'                    ],
\    "cmp cmdline":                 [ 'hrsh7th',            'cmp-cmdline'                   ],
\    "cmp env":                     [ 'SergioRibera',       'cmp-dotenv'                    ],
\    "cmp luasnip":                 [ 'saadparwaiz1',       'cmp_luasnip'                   ],
\    "cmp path":                    [ 'hrsh7th',            'cmp-path'                      ],
\    'cmp plain english':           [ 'uga-rosa',           'cmp-dictionary'                ],
\    "devicons":                    [ 'nvim-tree',          'nvim-web-devicons'             ],
\    "elixir":                      [ 'elixir-tools',       'elixir-tools.nvim'             ],
\    "elixirfiledetect":            [ 'elixir-editors',     'vim-elixir'                    ],
\    "floatterm":                   [ 'voldikss',           'vim-floaterm'                  ],
\    "fzf":                         [ 'junegunn',           'fzf.vim'                       ],
\    "git":                         [ 'lewis6991',          'gitsigns.nvim'                 ],
\    "lf":                          [ 'ptzz',               'lf.vim'                        ],
\    "lisp paredit":                [ 'vim-scripts',        'paredit.vim'                   ],
\    "lisp vlime":                  [ 'vlime',              'vlime',                        {'rtp': 'vim/'} ],
\    "live preview html":           [ 'turbio',             'bracey.vim',                   {'do': 'npm install --prefix server'} ],
\    "lspconfig":                   [ 'neovim',             'nvim-lspconfig'                ],
\    "lsp lines":                   [ 'maan2003',           'lsp_lines.nvim'                ],
\    "lsp saga":                    [ 'nvimdev',            'lspsaga.nvim'                  ],
\    "lsp statusline":              [ 'nvim-lua',           'lsp-status.nvim'               ],
\    "markdown preview":            [ 'iamcco',             'markdown-preview.nvim',        { 'do': 'cd app && yarn install' } ],
\    "marks":                       [ 'chentoast',          'marks.nvim'                    ],
\    "neoterm":                     [ 'kassio',             'neoterm'                       ],
\    "nui":                         [ 'MunifTanjim',        'nui.nvim'                      ],
\    "nvim cmp":                    [ 'hrsh7th',            'nvim-cmp'                      ],
\    "orgmode":                     [ 'nvim-orgmode',       'orgmode'                       ],
\    "plenary":                     [ 'nvim-lua',           'plenary.nvim'                  ],
\    "restore view":                [ 'vim-scripts',        'restore_view.vim'              ],
\    "show key hints":              [ 'folke',              'which-key.nvim'                ],
\    "tokyonight":                  [ 'folke',              'tokyonight.nvim'               ],
\    "treesitter":                  [ 'nvim-treesitter',    'nvim-treesitter',              {'do': ':TSUpdate'} ],
\    "treesitter-extra":            [ 'nvim-treesitter',    'nvim-treesitter-textobjects'   ],
\    "i3 syntax":                   [ 'PotatoesMaster',     'i3-vim-syntax'                 ],
\    "lf syntax":                   [ 'VebbNix',            'lf-vim'                        ],
\    "vimwiki":                     [ 'vimwiki',            'vimwiki'                       ],
\    'luarocks for nvim':           [ 'theHamsta',          'nvim_rocks',                   {'do': 'pipx install hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua'}],
\    'vim latex':                   [ 'lervag',             'vimtex'                        ],
\    'vim latex snips for vimtex':  [ 'micangl',            'cmp-vimtex'                    ],
\    'Sidebar file explorer':       [ 'preservim',          'nerdtree'                      ],
\    'PlantUML Syntax':             [ 'aklt',               'plantuml-syntax'               ],
\ }
"https://github.com/aklt/plantuml-syntax.git
"\    'latex lsp':                   [ 'latex-lsp',          'texlab'                      ],
"\    'vim latex snippest':          [ 'evesdropper',        'luasnip-latex-snippets.nvim' ],
"\    'latex cmp':                   [ 'kdheepak',           'cmp-latex-symbols'           ],

"vim closetag":      [ 'alneotermvan',      'vim-closetag'                ],
"match up":          [ 'andymass',          'vim-matchup'                 ],
fu! MyInstallPlugin(plg) 
    let l:len = len(a:plg)

    if l:len == 2
        Plug a:plg[0] . '/' . a:plg[1]
    elseif l:len == 3
        Plug a:plg[0] . '/' . a:plg[1], a:plg[2]
    else
        echo "invalid plugin"
    endif
endfu

call plug#begin()
    for plugin in values(g:my_plugins)
        call MyInstallPlugin(plugin)
    endfor
    " Extra "
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'alvan/vim-closetag'
call plug#end()

" Semantic Highlighting for Python #
    "Plug "'numirias/semshi', { 'do': ':UpdateRemote' }
" Autorename HTML tags #
    " Causes issues with Autocomplete HTML #
    "Plug 'AndrewRadev/tagalong.vim'
" HTML LSP #
    "Plug 'kristoff-it/superhtml'
" Aligning text #
    "Plug 'godlygeek/tabular'



"call plug#begin()
"" Treesitter #
"    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"
"" Treesitter, extra stuff #
"    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"
"" LSP-config #
"    Plug 'neovim/nvim-lspconfig'
"    Plug 'neovim/nvim-lspconfig'
"    Plug 'hrsh7th/cmp-nvim-lsp'
"    Plug 'hrsh7th/cmp-buffer'
"    Plug 'hrsh7th/cmp-path'
"    Plug 'hrsh7th/cmp-cmdline'
"    Plug 'hrsh7th/nvim-cmp'
"    Plug 'SergioRibera/cmp-dotenv'
"
"    Plug 'L3MON4D3/LuaSnip'
"    Plug 'saadparwaiz1/cmp_luasnip'
"
"    Plug 'nvim-lua/lsp-status.nvim'
"    Plug 'nvim-tree/nvim-web-devicons'
"    Plug 'nvimdev/lspsaga.nvim'
"    Plug 'maan2003/lsp_lines.nvim'
"
"" key hints"
"    Plug 'folke/which-key.nvim'
"
"" git #
"    Plug 'lewis6991/gitsigns.nvim'
"
"" show-all-matching-tags-vim #
"    Plug 'andymass/vim-matchup'
"
"" Autoclose HTML tags #
"    Plug 'alvan/vim-closetag'
"    Plug 'nvim-lua/plenary.nvim'
"
"" Auto-save-restore-view :) --best plugin #
"    Plug 'vim-scripts/restore_view.vim'
"
"" Real-time HTML/CSS/JS Editor #
"    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
"
"" Fzf Finder #
"    Plug 'junegunn/fzf.vim'
"
"" Markdown Preview #
"    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"    Plug 'kassio/neoterm'
"
"" For using lf in nvim #
"    Plug 'voldikss/vim-floaterm'
"    Plug 'ptzz/lf.vim'
"
"" Elixir #
"    Plug 'elixir-tools/elixir-tools.nvim'
"
"" Syntax Highlighting, Detection Elixir #
"    Plug 'elixir-editors/vim-elixir'
"
"" Lisp #
"    Plug 'vlime/vlime', {'rtp': 'vim/'}
"    Plug 'vim-scripts/paredit.vim'
"
"" Show marks #
"    Plug 'chentoast/marks.nvim'
"
"" Org Mode #
"    Plug 'nvim-orgmode/orgmode'
"
"" Requirements for lilypond (not using anymore), cool ui stuff #
"    Plug 'MunifTanjim/nui.nvim'
"
"" colorscheme #
"    Plug 'folke/tokyonight.nvim'
"
"" Syntax #
"    Plug 'VebbNix/lf-vim'
"    Plug 'PotatoesMaster/i3-vim-syntax'
""-----------------------------------------------------------"
"" Semantic Highlighting for Python #
"    "Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"" Autorename HTML tags #
"    " Causes issues with Autocomplete HTML #
"    "Plug 'AndrewRadev/tagalong.vim'
"" HTML LSP #
"    "Plug 'kristoff-it/superhtml'
"" Aligning text #
"    "Plug 'godlygeek/tabular'
"call plug#end()


