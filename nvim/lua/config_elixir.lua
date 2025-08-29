
local elixir   = require('elixir')
local elixirls = require('elixir.elixirls')

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

