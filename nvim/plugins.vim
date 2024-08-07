
let g:my_plugins = {
\ "cmp2":              [ 'hrsh7th',           'cmp-buffer'                  ],
\ "cmp cmdline":       [ 'hrsh7th',           'cmp-cmdline'                 ],
\ "cmp env":           [ 'SergioRibera',      'cmp-dotenv'                  ],
\ "cmp":               [ 'hrsh7th',           'cmp-nvim-lsp'                ],
\ "cmp luasnip":       [ 'saadparwaiz1',      'cmp_luasnip'                 ],
\ "cmp path":          [ 'hrsh7th',           'cmp-path'                    ],
\ "devicons":          [ 'nvim-tree',         'nvim-web-devicons'           ],
\ "elixir":            [ 'elixir-tools',      'elixir-tools.nvim'           ],
\ "elixirfiledetect":  [ 'elixir-editors',    'vim-elixir'                  ],
\ "floatterm":         [ 'voldikss',          'vim-floaterm'                ],
\ "fzf":               [ 'junegunn',          'fzf.vim'                     ],
\ "git":               [ 'lewis6991',         'gitsigns.nvim'               ],
\ "i3 syntax":         [ 'PotatoesMaster',    'i3-vim-syntax'               ],
\ "lf":                [ 'ptzz',              'lf.vim'                      ],
\ "lf syntax":         [ 'VebbNix',           'lf-vim'                      ],
\ "lisp paredit":      [ 'vim-scripts',       'paredit.vim'                 ],
\ "lisp vlime":        [ 'vlime',             'vlime',                      {'rtp': 'vim/'} ],
\ "live preview html": [ 'turbio',            'bracey.vim',                 {'do': 'npm install --prefix server'} ],
\ "lspconfig":         [ 'neovim',            'nvim-lspconfig'              ],
\ "lsp lines":         [ 'maan2003',          'lsp_lines.nvim'              ],
\ "lsp saga":          [ 'nvimdev',           'lspsaga.nvim'                ],
\ "lsp statusline":    [ 'nvim-lua',          'lsp-status.nvim'             ],
\ "luasnip":           [ 'L3MON4D3',          'LuaSnip'                     ],
\ "markdown preview":  [ 'iamcco',            'markdown-preview.nvim',      { 'do': 'cd app && yarn install' } ],
\ "marks":             [ 'chentoast',         'marks.nvim'                  ],
\ "match up":          [ 'andymass',          'vim-matchup'                 ],
\ "neoterm":           [ 'kassio',            'neoterm'                     ],
\ "nui":               [ 'MunifTanjim',       'nui.nvim'                    ],
\ "nvim cmp":          [ 'hrsh7th',           'nvim-cmp'                    ],
\ "orgmode":           [ 'nvim-orgmode',      'orgmode'                     ],
\ "plenary":           [ 'nfloattermvim-lua', 'plenary.nvim'                ],
\ "restore view":      [ 'vlfim-scripts',     'restore_view.vim'            ],
\ "show key hints":    [ 'folke',             'which-key.nvim'              ],
\ "tokyonight":        [ 'folke',             'tokyonight.nvim'             ],
\ "treesitter-extra":  [ 'nvim-treesitter',   'nvim-treesitter-textobjects' ],
\ "treesitter":        [ 'nvim-treesitter',   'nvim-treesitter',            {'do': ':TSUpdate'} ],
\ "vim closetag":      [ 'alneotermvan',      'vim-closetag'                ],
\}

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


