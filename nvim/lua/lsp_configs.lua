
local HOME              = os.getenv("HOME")
local lsp_status        = require('lsp-status')
local lspconfig         = require('lspconfig')
local cmp_capabilities  = require('cmp_nvim_lsp').default_capabilities()

-- LSP --
lspconfig.cssls.setup(                { capabilities = cmp_capabilities , })
lspconfig.html.setup(                 { capabilities = cmp_capabilities , })
lspconfig.jedi_language_server.setup( { capabilities = cmp_capabilities , })
lspconfig.jsonls.setup(               { capabilities = cmp_capabilities , })
lspconfig.ts_ls.setup(                { capabilities = cmp_capabilities , })
lspconfig.vimls.setup(                { capabilities = cmp_capabilities , })
lspconfig.eslint.setup({})

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
lspconfig.lua_ls.setup({
  capabilities = cmp_capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
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
lspconfig.clangd.setup({
  japabilities = cmp_capabilities,
  init_options = {
    fallbackFlags = {'--std=c++20'}
  },
})

-- lspconfig.marksman.setup({
-- })
-- lspconfig.pyright.setup{
--   on_attach = lsp_status.on_attach,
--   capabilities = cmp_capabilities,
--   settings = {
--       python = {
--         analysis = {
--           typeCheckingMode = "standard",
--       }
--     }
--   }
-- }
-- lspconfig.ccls.setup({
--   filetypes = {"c", "cpp", "h", "cc", "hpp"},
-- })
