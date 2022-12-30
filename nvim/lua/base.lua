
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

require('nvls').setup({
    lilypond = {
        mappings = {
            player = "<F3>",
            compile = "<F5>",
            open_pdf = "<F6>",
            switch_buffers = "<A-Space>",
            insert_version = "<F4>",
            hyphenation = "<F12>",
            hyphenation_change_lang = "<F11>",
            insert_hyphen = "<leader>ih",
            add_hyphen = "<leader>ah",
            del_next_hyphen = "<leader>dfh",
            del_prev_hyphen = "<leader>dFh",
            del_selected_hyphen = "<leader>dh"
        },
        options = {
            pitches_language = "default",
            output = "midi",
            main_file = "main.ly",
            main_folder = "%:p:h",
            hyphenation_language = "en_DEFAULT",
            include_dir = {
                "$HOME/Documents/LILYPOND_MUSIC_COMP"
            },
        },
    },
    latex = {
        mappings = {
            compile = "<F5>",
            open_pdf = "<F6>",
            lilypond_syntax = "<F3>"
        },
          options = {
              clean_logs = false
        },
    },
    player = {
        mappings = {
            quit = "q",
            play_pause = "p",
            loop = "<A-l>",
            backward = "h",
            small_backward = "<S-h>",
            forward = "l",
            small_forward = "<S-l>",
            decrease_speed = "j",
            increase_speed = "k",
            halve_speed = "<S-j>",
            double_speed = "<S-k>"
        },
        options = {
            row = "2%",
            col = "99%",
            width = "37",
            height = "1",
            border_style = "single",
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    },
})

vim.api.nvim_create_autocmd('BufEnter', { 
    command = "syntax sync fromstart",
    pattern = { '*.ly', '*.ily', '*.tex' }
})

vim.opt.updatetime = 400 


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
