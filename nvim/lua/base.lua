
-- local org               = require('orgmode')
require('config_cmp')
require('config_lsp')
require('config_elixir')
require('config_gitsigns')
require('config_notify')
-- My own module for using treesitter to navigate stuff
require("my_treesitter_module").create_commands()
require('textobjects')
require('config_marks')
require('config_which_key')
-- My Mappings
require('mappings')
local auto_session  = require('auto-session')

require('telescope').setup({})
auto_session.setup({
  auto_delete_empty_sessions = true,
  auto_restore = false,
  auto_save = false,
  suppressed_dirs = { "${HOME}/", "${HOME}/bin/" },
})



require('rainbow-delimiters.setup').setup {
    strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
        vim = 'rainbow-delimiters.strategy.local',
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiter1',
        'RainbowDelimiter2',
        'RainbowDelimiter3',
        'RainbowDelimiter4',
        'RainbowDelimiter5',
        'RainbowDelimiter6',
        'RainbowDelimiter7',
    },
}

-- require('noice').setup({

--   presets = {
--     -- you can enable a preset by setting it to true, or a table that will override the preset config
--     -- you can also add custom presets that you can enable/disable with enabled=true
--     bottom_search = false, -- use a classic bottom cmdline for search
--     command_palette = false, -- position the cmdline and popupmenu together
--     long_message_to_split = false, -- long messages will be sent to a split
--     inc_rename = false, -- enables an input dialog for inc-rename.nvim
--   },
--   messages = {
--     view = "popup",
--     filter = { max_width = 80, },
--   },
-- })


-- org.setup({
--   org_agenda_files = {'~/Documents/Dropbox/org/*', '~/Documents/my-orgs/**/*'},
--   org_default_notes_file = '~/Documents/Dropbox/org/refile.org',
-- })
