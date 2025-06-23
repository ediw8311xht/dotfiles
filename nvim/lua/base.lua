
-- local org               = require('orgmode')
require('which_key_config')
require('cmp_config')
require('lsp_configs')
require('my_elixir')
require('gitsigns_config')
require('notify_config')
require('mappings')
require('textobjects')
require('marks_config')
local auto_session  = require('auto-session')

require('telescope').setup({})
auto_session.setup({
  auto_save = false,
})


-- org.setup({
--   org_agenda_files = {'~/Documents/Dropbox/org/*', '~/Documents/my-orgs/**/*'},
--   org_default_notes_file = '~/Documents/Dropbox/org/refile.org',
-- })
