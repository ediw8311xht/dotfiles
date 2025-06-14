local which_key = require('which-key')
which_key.setup({
  notify = true,
  show_keys = true,
  plugins = {
    marks = true,
    registers = true,
  },
  triggers = {
    {"<auto>", mode = "nixostc"},
    {"m"     , mode = "nixostc"},
    {"M"     , mode = "nixostc"}
  },
  sort = { "group", "local", "alphanum" },
  expand = 3,
  win = {
    no_overlap = false,
    border = "single", -- none, single, double, shadow
    padding = {2, 2},
    wo = {
      winblend = 25, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    height = { min = 4, max = 70 }, -- min and max height of the columns
    width = { min = 4, max = 50 }, -- min and max width of the columns
    spacing = 1, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  icons = {
    breadcrumb = "> ", -- symbol used in the command line area that shows your active key combo
    separator = "|", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
    mappings = false, -- set to false to disable all mapping icons, both those explicitely added in a mapping and those from rules
    rules = {},
    colors = true,
    keys = {
        BS    = '<BS>',    Space           = '<leader>',  Tab           = '<Tab>',
        Up    = '<up>',    Down            = '<down>',    Left          = '<left>',
        Right = '<right>', C               = '^',         M             = '󰘵 ',
        D     = '󰘳 ',      S               = '<S>',       CR            = '<CR>',
        Esc   = '<ESC>',   ScrollWheelDown = '󱕐 ',        ScrollWheelUp = '󱕑 ',
        NL    = '󰌑 ',      F1              = '󱊫 ',        F2            = '󱊬 ',
        F3    = '󱊭 ',      F4              = '󱊮 ',        F5            = '󱊯 ',
        F6    = '󱊰 ',      F7              = '󱊱 ',        F8            = '󱊲 ',
        F9    = '󱊳 ',      F10             = '󱊴 ',        F11           = '󱊵 ',
        F12   = '󱊶 ',
    },
  },
})

which_key.add({
  { "<leader>B", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
})
