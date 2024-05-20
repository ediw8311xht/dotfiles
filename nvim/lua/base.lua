
local  lspconfig         =  require('lspconfig')
local  cmp_capabilities  =  require('cmp_nvim_lsp').default_capabilities()
local  luasnip           =  require('luasnip')
local  cmp               =  require('cmp')

require'lspconfig'.elixirls.setup{
  credo = { enable = false },
  cmd = { "/usr/lib/elixir-ls/language_server.sh" },
  -- on_attach = custom_attach, -- this may be required for extended functionalities of the LSP
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = true,
      suggestSpecs = true,
  };
}
require'lspconfig'.bashls.setup{}
require'lspconfig'.pyright.setup{}
require'marks'.setup {
    -- whether to map keybinds or not. default true
    default_mappings = true,
    -- which builtin marks to show. default {}
    builtin_marks = { ".", "<", ">", "^" },
    -- whether movements cycle back to the beginning/end of buffer. default true
    cyclic = true,
    -- whether the shada file is updated after modifying uppercase marks. default false
    force_write_shada = false,
    -- how often (in ms) to redraw signs/recompute mark positions.
    -- higher values will have better performance but may cause visual lag,
    -- while lower values may cause performance penalties. default 150.
    refresh_interval = 450,
    -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
    -- marks, and bookmarks.
    -- can be either a table with all/none of the keys, or a single number, in which case
    -- the priority applies to all marks.
    -- default 10.
    sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
    -- disables mark tracking for specific filetypes. default {}
    excluded_filetypes = {},
    -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
    -- sign/virttext. Bookmarks can be used to group together positions and quickly move
    -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
    -- default virt_text is "".
    bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
    },
    mappings = {}
}
vim.opt.updatetime = 400
-- nvim-cmp

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
-- require'nvim-treesitter.configs'.setup {
--   -- A list of parser names, or "all" (the five listed parsers should always be installed)
--   ensure_installed = { "json", "elixir", "c", "lua", "vim", "vimdoc", "query" },
--
--   -- Install parsers synchronously (only applied to `ensure_installed`)
--   sync_install = false,
--
--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   auto_install = true,
--
--   -- List of parsers to ignore installing (or "all")
--   ignore_install = { "javascript" },
--
--   ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
--   -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
--
--   highlight = {
--     enable = true,
--
--     -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
--     -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
--     -- the name of the parser)
--     -- list of language that will be disabled
--     disable = { "c", "rust", "vim", "vimdoc", "lua" },
--     -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
--     disable = function(lang, buf)
--         local max_filesize = 100 * 1024 -- 100 KB
--         local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--         if ok and stats and stats.size > max_filesize then
--             return true
--         end
--     end,
--
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
-- }
-- require('nvls').setup({
--     lilypond = {
--         mappings = {
--             player = "<F3>",
--             compile = "<F5>",
--             open_pdf = "<F6>",
--             switch_buffers = "<A-Space>",
--             insert_version = "<F4>",
--             hyphenation = "<F12>",
--             hyphenation_change_lang = "<F11>",
--             insert_hyphen = "<leader>ih",
--             add_hyphen = "<leader>ah",
--             del_next_hyphen = "<leader>dfh",
--             del_prev_hyphen = "<leader>dFh",
--             del_selected_hyphen = "<leader>dh"
--         },
--         options = {
--             pitches_language = "default",
--             output = "midi",
--             main_file = "main.ly",
--             main_folder = "$HOME/Documents/LILYPOND_MUSIC_COMP/",
--             hyphenation_language = "en_DEFAULT",
--             include_dir = {
--                 "$HOME/Documents/LILYPOND_MUSIC_COMP/"
--             },
--         },
--     },
--     latex = {
--         mappings = {
--             compile = "<F5>",
--             open_pdf = "<F6>",
--         },
--           options = {
--               clean_logs = false
--         },
--     },
--     player = {
--         mappings = {
--             quit = "q",
--             play_pause = "p",
--             loop = "<A-l>",
--             backward = "h",
--             small_backward = "<S-h>",
--             forward = "l",
--             small_forward = "<S-l>",
--             decrease_speed = "j",
--             increase_speed = "k",
--             halve_speed = "<S-j>",
--             double_speed = "<S-k>"
--         },
--         options = {
--             row = "2%",
--             col = "99%",
--             width = "37",
--             height = "1",
--             border_style = "single",
--             winhighlight = "Normal:Normal,FloatBorder:Normal",
--         },
--     },
-- })
--
-- vim.api.nvim_create_autocmd('BufEnter', {
--     command = "syntax sync fromstart",
--     pattern = { '*.ly', '*.ily', '*.tex' }
-- })
--


-- vim.g.coq_settings = { --
--     auto_start = "shut-up", --
--     clients = {--
--         lsp = {--
--             enabled = true,--
--             resolve_timeout = '0.1',--
--         },--
--         treesitter = {--
--             enabled = true,--
--             weight_adjustment = 1,--
--             slow_threshold = '0.1',--
--         },--
--     },--
--     display = {--
--         icons = {--
--             mode = 'none',--
--         },--
--     },--
-- }--
-- --
-- local lsp = require "lspconfig"--
-- local coq = require "coq" --
-- --
-- lsp.cssls.setup{--
--     coq.lsp_ensure_capabilities{--
--         filetypes = {},--
--         cmd = { "vscode-css-language-server", "--stdio" },--
--         filetypes = { "css", "scss", "less" },--
--         settings = {--
--           css = {--
--             validate = true--
--           },--
--           less = {--
--             validate = true--
--           },--
--           scss = {--
--             validate = true--
--           }--
--         },--
--         single_file_support = true,--
--     }--
-- }--
-- --
-- lsp.html.setup{--
--     coq.lsp_ensure_capabilities{--
--         init_options = {--
--             configurationSection = { "html", "css", "javascript" },--
--             embeddedLanguages    = { css = true, javascript = true },--
--             provideFormatter = true--
--         },--
--         cmd = { "vscode-html-language-server", "--stdio" },--
--         filetypes = { 'html' },--
--         singe_file_support = true,--
--     }--
-- }--
-- --
-- lsp.pyright.setup{--
--     coq.lsp_ensure_capabilities{--
--         cmd = { "pyright-langserver", "--stdio" },--
--         filetypes = { "python" },--
--         settings = {--
--             python = {--
--                 analysis = {--
--                     autoSearchPaths = true,--
--                     diagnosticMode = "workspace",--
--                     useLibraryCodeForTypes = true--
--                 }--
--             }--
--         },--
--         single_file_support = true,--
--     }--
-- }--
-- --
-- lsp.tsserver.setup{--
--     coq.lsp_ensure_capabilities{--
--         filetypes = { 'js'},--
--     }--
-- }--
-- --
-- lsp.luau_lsp.setup{--
--     coq.lsp_ensure_capabilities{--
--         filetypes = { 'lua', 'luau', 'lsp' }--
--     }--
-- }--
-- --
-- lsp.bashls.setup{--
--     coq.lsp_ensure_capabilities{--
--     }--
-- }--
-- --
-- --
