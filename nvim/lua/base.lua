
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
local  which_key         =  require('which-key')
-- init.lua

lspsaga.setup({})
gitsigns.setup({})
which_key.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    -- operators = true,
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    motions = {
        count = true,
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = ":", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 1, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    layout = {
        height = { min = 4, max = 10 }, -- min and max height of the columns
        width = { min = 4, max = 40 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
    -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    triggers_nowait = {
        -- marks
        ",",
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
    },
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for keymaps that start with a native binding
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
        buftypes = {},
        filetypes = {},
    },
})

org.setup({
    org_agenda_files = {'~/Documents/Dropbox/org/*', '~/Documents/my-orgs/**/*'},
    org_default_notes_file = '~/Documents/Dropbox/org/refile.org',
})

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
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
        { name = 'buffer'}
    })
})


-- Elixir --
elixir.setup({
    nextls = { enable = false },
    credo = { enable = false },
    elixirls = {
        enable = true,
        filetypes = { "elixir" },
        cmd = "/usr/bin/elixir-ls",

        -- default settings, use the `settings` function to override settings
        settings = elixirls.settings {
            dialyzerEnabled = false,
            fetchDeps = false,
            enableTestLenses = true,
            suggestSpecs = false,
        },
        on_attach = function(client, bufnr)
--            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
--            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
--            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end
    }
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

lspconfig.bashls.setup{
    on_attach = lsp_status.on_attach,
    capabilities = capabilities,
}

lspconfig.pyright.setup{
    on_attach = lsp_status.on_attach,
    capabilities = capabilities,
}

vim.opt.updatetime = 200


-- lspconfig.elixirls.setup{
--     credo = { enable = false },
--     cmd = { "/usr/lib/elixir-ls/language_server.sh" },
--     -- on_attach = custom_attach, -- this may be required for extended functionalities of the LSP
--     on_attach = lsp_status.on_attach,
--     capabilities = capabilities,
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
