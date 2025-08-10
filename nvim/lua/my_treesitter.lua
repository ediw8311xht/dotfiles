
-- DisabledLangs = { "txt", "help", "vimdoc", "vim", "doc", "man", "plantuml", "latex" }
-- DisabledLangs = {}
local treesitter = require('nvim-treesitter')
--
  --   -- MINE --
  -- -- disable = function(lang, buf)
  -- --     if Contains(DisabledLangs, lang) then
  -- --       return true
  -- --     end
  -- --     local max_filesize = 500 * 1024
  -- --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  -- --     if ok and stats and stats.size > max_filesize then
  -- --         return true
  -- --     end
  -- --     return false
  -- -- end,
treesitter.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "latex", } ,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  textobjects = {
    lsp_interop = {
      enable = true
    },
    move = {
      enable = true
    },
    select = {
      enable = true
    },
    swap = {
      enable = true
    },
  },
  incremental_selection = {
    enable = true
  },
  -- highlight = {
  --   enable = true,
  --   additional_vim_regex_highlighting = false,
  -- },
}
local my_installed_langs = {
   'bash',
   'common_lisp',
   'doc',
   'lua',
   'man',
   'plantuml',
   'python',
   'vim',
   'vimdoc',
   'zathurarc',
 }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },

  callback = function()
    pcall(vim.treesitter.start)
  end,
})

