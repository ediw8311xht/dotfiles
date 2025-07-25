require('marks').setup({
  default_mappings = true,
  signs = true,
  bookmark_0 = { annotate = false, virt_text = '', },
  bookmark_1 = { annotate = false, virt_text = '', },
  bookmark_2 = { annotate = false, virt_text = '', },
  bookmark_3 = { annotate = false, virt_text = '', },
  -- builtin_marks = {".", "<", ">", "^"},
  builtin_marks = {},
  cyclic = true,
  refresh_interval = 400,
  sign_priority = {lower=10, uppwer=15, built=8, bookmark=20 },
  -- excluded_filetypes = {},
  excluded_buftypes = {
    -- "terminal",
    -- "nui",
  },
  mappings = {
    set_next = "M,", prev        = "<C-,>", next       = "<C-.>",
    preview  = "M:", delete_line = "dml",   delete_buf = "dm;",
    annotate = "MK", toggle      = "M'",
    next_bookmark = 'MM',
    prev_bookmark = 'Mm',
    set_bookmark0 = 'M0',
    set_bookmark1 = 'M1',
    set_bookmark2 = 'M2',
    set_bookmark3 = 'M3',
    set_bookmark4 = 'M4',
    set_bookmark5 = 'M5',
    set_bookmark6 = 'M6',
    set_bookmark7 = 'M7',
    set_bookmark8 = 'M8',
    set_bookmark9 = 'M9',
  }
})
