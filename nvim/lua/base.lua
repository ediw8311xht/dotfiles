
-- local org               = require('orgmode')
local marks         = require('marks')
local auto_session  = require('auto-session')

require('telescope').setup({})
auto_session.setup({
  auto_save = false,
})


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
-- require('commentless').setup({})
-- autocmd TreeSitter require('commentless').setup({})
-- vim.opt.foldminlines = 0 -- Allow folding/hiding single lines
-- vim.opt.fillchars = "fold: " -- Remove the trailing dots
-- org.setup({
--   org_agenda_files = {'~/Documents/Dropbox/org/*', '~/Documents/my-orgs/**/*'},
--   org_default_notes_file = '~/Documents/Dropbox/org/refile.org',
-- })
