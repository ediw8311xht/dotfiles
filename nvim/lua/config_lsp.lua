
local HOME              = os.getenv("HOME")
local lsp_status        = require('lsp-status')
local lspconfig         = vim.lsp.config
local cmp_capabilities  = require('cmp_nvim_lsp').default_capabilities()
local actions_preview   = require('actions-preview')
local lang_servers      = { 'cssls', 'html', 'jsonls', 'ts_ls', 'vimls', 'eslint', 'pyright', 'tailwindcss', 'luals', 'bashls', 'clangd', 'hls' }

vim.lsp.enable('marksman')
actions_preview.setup({})

-- vim.lsp.config('*', {
--   capabilities = {
--     textDocument = {
--       semanticTokens = {
--         multilineTokenSupport = true,
--       }
--     }
--   }
-- })
lspconfig('cssls',   { capabilities = cmp_capabilities })
lspconfig('html',    { capabilities = cmp_capabilities })
lspconfig('jsonls',  { capabilities = cmp_capabilities })
lspconfig('ts_ls',   { capabilities = cmp_capabilities })
lspconfig('vimls',   { capabilities = cmp_capabilities })
lspconfig('eslint',  { } )

lspconfig('pyright', {
  on_attach = lsp_status.on_attach,
  capabilities = cmp_capabilities,
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "off",
      }
    }
  }
})

lspconfig('tailwindcss', {
  filetype = {},
  filetypes = { "html-eex", "heex"},
  capabilities = cmp_capabilities,
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex"
    }
  }
})

lspconfig('luals', {
  capabilities = cmp_capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lspconfig('bashls', {
  on_attach = lsp_status.on_attach,
  capabilities = cmp_capabilities,
  filetypes = { "bash" },
  settings = {
    bashIde = {
      shellcheckArguments = '--rcfile='..HOME..'/.shellcheckrc'
    }
  }
})

lspconfig('clangd', {
  capabilities = cmp_capabilities,
  cmd = { "clangd", "--log=verbose" },
  filetypes = {'c', 'cpp'},
  init_options = {
    fallbackFlags = {
      '--std=gnu++20',
      -- '-DMAGICKCORE_HDRI_ENABLE=1',
    }
  }
})

lspconfig('hls', {
  capabilities = cmp_capabilities,
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  filestypes = { "haskell", "lhaskell" },
  single_file_support = true,
})

for _,v in ipairs(lang_servers) do
  vim.lsp.enable(v)
end
-- lspconfig.jedi_language_server.setup( { capabilities = cmp_capabilities , })
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
