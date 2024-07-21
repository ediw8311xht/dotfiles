
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local  cmp_capabilities  =  require('cmp_nvim_lsp').default_capabilities()
local  lspconfig         =  require('lspconfig')
local  luasnip           =  require('luasnip')
local  cmp               =  require('cmp')
local  org               =  require('orgmode')
local  elixir            =  require("elixir")
local  elixirls          =  require("elixir.elixirls")
local  lspsaga           =  require('lspsaga')
local  gitsigns          =  require('gitsigns')
local  marks             =  require('marks')



-- local  hologram          =  require('hologram')
-- local  lsp_lines         =  require("lsp_lines")


-- Disable virtual_text since it's redundant due to lsp_lines.
-- vim.diagnostic.config({
--   virtual_text = false,
-- })
-- lsp_lines.setup({})

-- require('hologram').setup{
--     auto_display = true -- WIP automatic markdown image display, may be prone to breaking
-- }

luasnip.setup({})
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion     =  cmp.config.window.bordered(),
        documentation  =  cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer'},
        { name = 'path'},
        { name = 'cmdline'},
        { name = 'dotenv'},
    })
})

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
        delete_line = "md",
        delete_buf = "mD",
        annotate = "ma",
        toggle = "mt",
    }
})

lspsaga.setup({})
gitsigns.setup({
    signs = {
        add          = { text = '+' },
        change       = { text = '=' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
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
    -- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    -- current_line_blame_formatter_opts = {
    --     relative_time = false,
    -- },
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
      --       vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      --       vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      --       vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
      -- end
    },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
})

-- LSP --
lspconfig.tailwindcss.setup({
    filetype = {},
    filetypes = { "html-eex", "heex", "css" },
    init_options = {
        userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
        },
    },
})

lspconfig.vimls.setup({})

lspconfig.lua_ls.setup({})

lspconfig.bashls.setup({
    on_attach = lsp_status.on_attach,
    capabilities = cmp_capabilities,
    filetypes = { "bash" },
})

lspconfig.pyright.setup({
    on_attach = lsp_status.on_attach,
    capabilities = cmp_capabilities,
})

-- lspconfig.elixirls.setup{
--     credo = { enable = false },
--     cmd = { "/usr/lib/elixir-ls/language_server.sh" },
--     -- on_attach = custom_attach, -- this may be required for extended functionalities of the LSP
--     on_attach = lsp_status.on_attach,
--     capabilities = cmp_capabilities,
--     flags = {
--         debounce_text_changes = 150,
--     },
--     elixirLS = {
--         dialyzerEnabled   =  false,
--         fetchDeps         =  false,
--         enableTestLenses  =  false,
--         suggestSpecs      =  false,
--     };
-- }

