local lsp_status = require('lsp-status')
lsp_status.register_progress()

local   cmp_capabilities    =   require('cmp_nvim_lsp').default_capabilities()
local   lspconfig           =   require('lspconfig')
local   luasnip             =   require('luasnip')
local   cmp                 =   require('cmp')
local   org                 =   require('orgmode')

require('gitsigns').setup()
-- init.lua

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

lspconfig.tailwindcss.setup({
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})

lspconfig.elixirls.setup{
    credo = { enable = false },
    cmd = { "/usr/lib/elixir-ls/language_server.sh" },
    -- on_attach = custom_attach, -- this may be required for extended functionalities of the LSP
    on_attach = lsp_status.on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    elixirLS = {
        dialyzerEnabled   =  false,
        fetchDeps         =  false,
        enableTestLenses  =  false,
        suggestSpecs      =  false,
    };
}
lspconfig.bashls.setup{
    on_attach = lsp_status.on_attach,
    capabilities = capabilities,
}

lspconfig.pyright.setup{
    on_attach = lsp_status.on_attach,
    capabilities = capabilities,
}
vim.opt.updatetime = 200


