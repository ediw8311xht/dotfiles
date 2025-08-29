
local cmp               = require('cmp')
cmp.setup({
  -- performance = {
  --   fetching_timeout = 500,
  --   throttle = 2000,
  --   async_budget = 20,
  --   max_view_entries = 50,
  -- },
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
    -- { name = 'treesitter' },
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
