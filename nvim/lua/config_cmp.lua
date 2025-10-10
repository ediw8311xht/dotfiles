
local cmp = require('cmp')
local cmp_dict = require("cmp_dictionary")
cmp.setup({
  performance = {
    fetching_timeout = 500,
    debounce = 60,
    throttle = 1000,
    async_budget = 40,
    max_view_entries = 20,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion   =  cmp.config.window.bordered(),
    documentation  =  cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.confirm( { select = true} ),
    ['<C-S-y>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    -- { name = 'treesitter' },
    -- { name = 'nvim_lsp_signature_help' },
    -- { name = 'ctags' },
    -- { name = 'cmp-nvim-tags' },
  }, {
    { name = 'buffer' },
    { name = 'path',
      option = {
        indexing_interval = 80,
        indexing_batch_size = 110,
      },
    },
    { name = 'dotenv' },
    --{ name = 'cmdline'},
  })
})

-- cmp.setup.filetype( { 'lisp' }, {
--   sources = {
--     { name = 'vlime' },
--   }
-- })
cmp.setup.filetype( { 'tex' }, {
  sources = {
    { name = 'vimtex' },
    { name = "latex_symbols" },
    -- { name = "dictionary" },
  }
})

cmp.setup.filetype( { 'markdown', 'text' }, {
  sources = {
    { name = "dictionary" },
  }
})

cmp_dict.setup({
  paths = { "$XDG_DATA_HOME/dict/en_words" },
  exact_length = 2,
  first_case_insensitive = true,
  document = {
	  enable = true,
	  command = {
      "definition_search.sh", "${label}",
    },
	}
})
