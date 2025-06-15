
-- local org               = require('orgmode')
local marks             = require('marks')
local actions_preview   = require('actions-preview')
local auto_session      = require('auto-session')
local telescope         = require('telescope')

actions_preview.setup({})
auto_session.setup({})
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"


marks.setup({
  default_mappings = true,
  -- builtin_marks = {".", "<", ">", "^"},
  builtin_marks = {},
  cyclic = true,
  refresh_interval = 400,
  sign_priority = {lower=10, uppwer=15, built=8, bookmark=20 },
  -- excluded_filetypes = {},
  excluded_buftypes = {
    "terminal",
    "nui",
  },
  mappings = {
    set_next = "M,", prev        = "<C-,>", next       = "<C-.>",
    preview  = "M:", delete_line = "dml",   delete_buf = "dm;",
    annotate = "Mk", toggle      = "M'",
  }
})

-- org.setup({
--   org_agenda_files = {'~/Documents/Dropbox/org/*', '~/Documents/my-orgs/**/*'},
--   org_default_notes_file = '~/Documents/Dropbox/org/refile.org',
-- })
