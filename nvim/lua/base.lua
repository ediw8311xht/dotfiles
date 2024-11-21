
local HOME              = os.getenv("HOME")
local lsp_status        = require('lsp-status')
local lspconfig         = require('lspconfig')
local luasnip           = require('luasnip')
local cmp               = require('cmp')
local org               = require('orgmode')
local elixir            = require('elixir')
local which_key         = require('which-key')
local elixirls          = require('elixir.elixirls')
local lspsaga           = require('lspsaga')
local gitsigns          = require('gitsigns')
local marks             = require('marks')
local lspstatus         = require('lsp-status')
local cmp_capabilities  = require('cmp_nvim_lsp').default_capabilities()

marks.setup({
  default_mappings = true,
  builtin_marks = {".", "<", ">", "^"},
  cyclic = true,
  refresh_interval = 400,
  sign_priority = {lower=10, uppwer=15, built=8, bookmark=20 },
  -- excluded_filetypes = {},
  excluded_buftypes = {
    "terminal",
    "nui",
  },
  mappings = {
    set_next = "m,",
    next = "m]",
    prev = "m[",
    preview = "m:",
    delete_line = "dml",
    delete_buf = "dmf",
    annotate = "mk",
    toggle = "m'",
  }
})
lspstatus.config({
  indicator_ok = 'Ok',
})
lsp_status.register_progress()
which_key.setup({
--    notify = false,
  win = {
    no_overlap = false,
    border = "none", -- none, single, double, shadow
    padding = {0, 0},
    wo = {
         winblend = 5, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      }
    },
    layout = {
      height = { min = 4, max = 50 }, -- min and max height of the columns
      width = { min = 4, max = 70 }, -- min and max width of the columns
      spacing = 1, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    icons = {
      breadcrumb = "> ", -- symbol used in the command line area that shows your active key combo
      separator = "|", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "…",
      -- set to false to disable all mapping icons,
      -- both those explicitely added in a mapping
      -- and those from rules
      mappings = false,
      rules = {},
      colors = true,
      -- used by key format
      keys = {
          BS = '󰁮 ',
          Space = '<leader>',
          Tab = '<Tab>',
          Up = '<up>',
          Down = '<down>',
          Left = '<left>',
          Right = '<right>',
          C = '^',
          M = '󰘵 ',
          D = '󰘳 ',
          S = '<S>',
          CR = '<CR>',
          Esc = '󱊷 ',
          ScrollWheelDown = '󱕐 ',
          ScrollWheelUp = '󱕑 ',
          NL = '󰌑 ',
          F1 = '󱊫 ',
          F2 = '󱊬 ',
          F3 = '󱊭 ',
          F4 = '󱊮 ',
          F5 = '󱊯 ',
          F6 = '󱊰 ',
          F7 = '󱊱 ',
          F8 = '󱊲 ',
          F9 = '󱊳 ',
          F10 = '󱊴 ',
          F11 = '󱊵 ',
          F12 = '󱊶 ',
      },
    },
})
luasnip.setup({})
lspsaga.setup({})
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
    { name = 'luasnip' },
    { name = 'vimtex' },
    -- { name = "latex_symbols" },
    -- { name = "dictionary", keyword_length = 2, },
  }, {
    { name = 'buffer'},
    { name = 'path'},
    --{ name = 'cmdline'},
    { name = 'dotenv'},
  })
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
org.setup({
  org_agenda_files = {'~/Documents/Dropbox/org/*', '~/Documents/my-orgs/**/*'},
  org_default_notes_file = '~/Documents/Dropbox/org/refile.org',
})
-- Elixir --
elixir.setup({
  nextls = {
    enable = true,
    filetypes = { "elixir" },
    init_options = {
      mix_env = "dev",
      mix_target = "host",
      experimental = {
        completions = { enable = true }
      }
    },
  },
  elixirls = {
    enable = false,
    filetypes = { "elixir" },
    -- cmd = "/usr/bin/elixir-ls",
    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = true,
      enableTestLenses = true,
      suggestSpecs = true,
    },
    -- on_attach = function(client, bufnr)
    --     vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
    --     vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
    --     vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    -- end
  },
  dependencies = {
  "nvim-lua/plenary.nvim",
  },
})
-- LSP --
lspconfig.tailwindcss.setup({
  filetype = {},
  filetypes = { "html-eex", "heex"},
  capabilities = cmp_capabilities,
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})
lspconfig.cssls.setup({
  capabilities = cmp_capabilities,
})
lspconfig.html.setup({
  capabilities = cmp_capabilities,
})
lspconfig.vimls.setup({
  capabilities = cmp_capabilities,
})
lspconfig.lua_ls.setup({
  capabilities = cmp_capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
})
lspconfig.bashls.setup({
  on_attach = lsp_status.on_attach,
  capabilities = cmp_capabilities,
  filetypes = { "bash" },
  settings = {
    bashIde = {
      shellcheckArguments = '--rcfile='..HOME..'/.shellcheckrc'
    }
  }
})
lspconfig.pyright.setup({
  on_attach = lsp_status.on_attach,
  capabilities = cmp_capabilities,
})
lspconfig.ccls.setup({
  filetypes = {"c", "cpp"},
})
-- lspconfig.elixirls.setup{
--   credo = { enable = false },
--   cmd = { "/usr/lib/elixir-ls/language_server.sh" },
--   -- on_attach = custom_attach, -- this may be required for extended functionalities of the LSP
--   on_attach = lsp_status.on_attach,
--   capabilities = cmp_capabilities,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   elixirLS = {
--     dialyzerEnabled   =  false,
--     fetchDeps     =  false,
--     enableTestLenses  =  false,
--     suggestSpecs    =  false,
--   };
-- }

