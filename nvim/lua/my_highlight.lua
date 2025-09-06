
vim.g.my_highlight = {
  [""] = {
    ["Comment"]  = { "ctermbg=blue",  "ctermfg=black", "gui=italic",    "guibg=NONE",      "guifg=#005FEF", },
    ["ModeMsg"]  = { "cterm=NONE",    "gui=NONE",      "guibg=#009900", "guifg=#000000", },
    ["SpellBad"] = { "gui=undercurl", "guibg=NONE",    "guifg=#AAAAAA", "guisp=#FF0000", },
    ["clear"]    = { "@lsp.mod",},
    ["ColorColumn"]     = { "gui=NONE",      "guibg=#222222", "guifg=NONE",      },
    ["EndOfBuffer"]     = { "gui=NONE",      "guibg=NONE",    "guifg=#333333",   },
    ["ExtraWhiteSpace"] = { "gui=NONE",      "guibg=#0099FF", "guifg=NONE",      },
    ["FoldColumn"]      = { "gui=italic",    "guibg=NONE",    "guifg=#00FF00",   },
    ["Folded"]          = { "gui=italic",    "guibg=#777777", "guifg=#000000",   },
    ["HLspStatus"]      = { "gui=NONE",      "guibg=NONE",    "guifg=#00FF00",   },
    ["HStatusFullFile"] = { "gui=NONE",      "guibg=NONE",    "guifg=#999999",   },
    ["IncSearch"]       = { "gui=NONE",      "guibg=#FF0000", "guifg=#000000",   },
    ["LineNr"]          = { "gui=NONE",      "guibg=#000000", "guifg=#CCCCCC",   },
    ["LineNrAbove"]     = { "gui=NONE",      "guibg=#000000", "guifg=#00AAFF",   },
    ["MatchParen"]      = { "gui=NONE",      "guibg=#AAAAAA", "guifg=#000000",   },
    ["Normal"]          = { "gui=NONE",      "guibg=NONE",    "guifg=#D0D0D0",   },
    ["Search"]          = { "gui=NONE",      "guibg=#FF00FF", "guifg=#000000",   },
    ["SignColumn"]      = { "gui=NONE",      "guibg=NONE",    "guifg=NONE",      },
    ["TabLine"]         = { "gui=NONE",      "guibg=NONE",    "guifg=#999999",   },
    ["TabLineSel"]      = { "gui=NONE",      "guibg=NONE",    "guifg=#00FF00",   },
    ["TermCursor"]      = { "gui=NONE",      "guibg=NONE",    "guifg=#00AA00",   },
    ["WinSeparator"]    = { "gui=NONE",      "guibg=NONE",    "guifg=#009900",   },
    ["lCursor"]         = { "gui=NONE",      "guibg=NONE",    "guifg=NONE",      },
    ["Function"]        = { "gui=NONE" },
    ["Keyword"]         = { "gui=NONE" },
    -- Tree Sitter --
    ["TSCurrentScope"]  = { "gui=NONE", "guibg=#090909" },
  },

  ["StatusLine"] = {
    [""]         = { "gui=NONE",      "guibg=NONE",    "guifg=#229922", },
    ["NC"]       = { "gui=NONE",      "guibg=NONE",    "guifg=#999999", },
  },
  ["MarkSign"] = {
    ["NumHL"]      = { "gui=NONE",      "guibg=NONE",    "guifg=NONE", },
    ["VirtTextHL"] = { "gui=NONE",      "guibg=NONE",    "guifg=#00FF00", },
  },

  ["Floatterm"] = {
    [""]       = { "guibg=#000000", },
    ["Border"] = { "guibg=#000000", "guifg=#000000", },
  },

  ["CursorLine"] = {
    [""]     = { "gui=BOLD", "guibg=#101010", "guifg=NONE", },
    ["Nr"]   = { "gui=NONE",      "guibg=NONE",    "guifg=#FFFF00", },
    ["Sign"] = { "gui=NONE",      "guibg=#000022", "guifg=#000000", },
  },

  ["Diagnostic"] = {
    ["Error"]    = { "guifg=#000000", "guibg=#990000", },
    ["Hint"]     = { "guifg=#000000", "guibg=#888888", },
    ["Info"]     = { "guifg=#000000", "guibg=#AAAAAA", },
    ["Warn"]     = { "guifg=#000000", "guibg=#AA8500", },
  },

  ["GitSigns"] = {
    ["Add"] = { "guifg=#00DD00", },
  },

  ["WhichKey"] = {
    [""]           = { "guibg=#010101", "guifg=#22FF22",            },
    ["Normal"]     = { "guibg=#010101", "guifg=#00FF00",            },
    ["Float"]      = { "guibg=#010101",                             },
    -- ["Group"]      = { "guibg=NONE",                                },
    -- ["Separator"]  = { "guibg=NONE",                                },
    -- ["Desc"]       = { "guibg=NONE",                                },
    -- ["Border"]     = { "guibg=NONE", "guifg=#777777",               },
    -- ["Value"]      = { "gui=italic", "guibg=NONE", "guifg=#777777", },
  },

  ["@markup."] = {
    ["heading."] = {
      ["1.markdown"] = { "gui=bold", "guibg=#000000", "guifg=#00FFFF", "guisp=#000000", },
      ["2.markdown"] = { "gui=bold", "guibg=#000000", "guifg=#00DDDD", },
      ["3.markdown"] = { "gui=bold", "guibg=#000000", "guifg=#00AAAA", },
      ["4.markdown"] = { "gui=bold", "guibg=#000000", "guifg=#009999", },
      ["5.markdown"] = { "gui=bold", "guibg=#000000", "guifg=#009900", },
      ["6.markdown"] = { "gui=bold", "guibg=#000000", "guifg=#004400", },
    },
  },
  ["RainbowDelimiter"] = {
    [ '1' ] = { "gui=BOLD", "guibg=#000000", "guifg=#FF0000", },
    [ '2' ] = { "gui=NONE", "guibg=#000000", "guifg=#FF79C6", },
    [ '3' ] = { "gui=NONE", "guibg=#000000", "guifg=#F1FA8C", },
    [ '4' ] = { "gui=NONE", "guibg=#000000", "guifg=#50FA7B", },
    [ '5' ] = { "gui=NONE", "guibg=#000000", "guifg=#FFB86C", },
    [ '6' ] = { "gui=NONE", "guibg=#000000", "guifg=#6272A4", },
    [ '7' ] = { "gui=NONE", "guibg=#000000", "guifg=#BD93F9", },
  }
}
