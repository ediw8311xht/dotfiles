
local luasnip           = require('luasnip')
local cmp               = require('cmp')
-- local org               = require('orgmode')
local which_key         = require('which-key')
local gitsigns          = require('gitsigns')
local marks             = require('marks')
local actions_preview   = require('actions-preview');
local auto_session      = require('auto-session');
auto_session.setup({})
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

marks.setup({
  default_mappings = true,
  -- builtin_marks = {".", "<", ">", "^"},
  builtin_marks = {},
  cyclic = true,
  refresh_interval = 400,
  sign_priority = {lower=10, uppwer=15, built=8, bookmark=20 },
  -- excluded_filetypes = {},
  excluded_buftypes = {
    "terminal",
    "nui",
  },
  mappings = {
    set_next = "m,", next        = "m]",  prev       = "m[",
    preview  = "m:", delete_line = "dml", delete_buf = "dmf",
    annotate = "mk", toggle      = "m'",
  }
})
which_key.setup({
  notify = true,
  win = {
    no_overlap = false,
    border = "single", -- none, single, double, shadow
    padding = {2, 2},
    wo = {
      winblend = 25, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    height = { min = 4, max = 70 }, -- min and max height of the columns
    width = { min = 4, max = 50 }, -- min and max width of the columns
    spacing = 1, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  icons = {
    breadcrumb = "> ", -- symbol used in the command line area that shows your active key combo
    separator = "|", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
    mappings = false, -- set to false to disable all mapping icons, both those explicitely added in a mapping and those from rules
    rules = {},
    colors = true,
    keys = {
        BS    = '<BS>',    Space           = '<leader>',  Tab           = '<Tab>',
        Up    = '<up>',    Down            = '<down>',    Left          = '<left>',
        Right = '<right>', C               = '^',         M             = '󰘵 ',
        D     = '󰘳 ',      S               = '<S>',       CR            = '<CR>',
        Esc   = '<ESC>',   ScrollWheelDown = '󱕐 ',        ScrollWheelUp = '󱕑 ',
        NL    = '󰌑 ',      F1              = '󱊫 ',        F2            = '󱊬 ',
        F3    = '󱊭 ',      F4              = '󱊮 ',        F5            = '󱊯 ',
        F6    = '󱊰 ',      F7              = '󱊱 ',        F8            = '󱊲 ',
        F9    = '󱊳 ',      F10             = '󱊴 ',        F11           = '󱊵 ',
        F12   = '󱊶 ',
    },
  },
})
actions_preview.setup({})
luasnip.setup({})
cmp.setup({
  -- performance = {
  --   throttle = 0.3,
  --   async_budget = 20,
  -- },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion   =  cmp.config.window.bordered(),
    documentation  =  cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.confirm( { select = true} ),
    ['<C-S-y>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'vimtex' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'ctags' },
    { name = 'cmp-nvim-tags' },
    -- { name = "latex_symbols" },
    -- { name = "dictionary", keyword_length = 2, },
  }, {
    { name = 'buffer'},
    { name = 'path'},
    --{ name = 'cmdline'},
    { name = 'dotenv'},
  })
})
cmp.setup.filetype( { 'lisp' }, {
  sources = {
    { name = 'vlime' }
  }
})
gitsigns.setup({
  signs = {
    add      = { text = '+' },
    change     = { text = '=' },
    delete     = { text = '_' },
    topdelete  = { text = '‾' },
    changedelete = { text = '~' },
    untracked  = { text = '┆' },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl    = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl   = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = true,
    virt_text_priority = 100,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  }
})
-- org.setup({
--   org_agenda_files = {'~/Documents/Dropbox/org/*', '~/Documents/my-orgs/**/*'},
--   org_default_notes_file = '~/Documents/Dropbox/org/refile.org',
-- })
