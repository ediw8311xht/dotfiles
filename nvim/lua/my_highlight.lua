
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
    ["Folded"]          = { "gui=italic",    "guibg=NONE",    "guifg=#777777",   },
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
    [""]     = { "gui=bold",      "guibg=#111111", "guifg=NONE", },
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
    [""]           = { "guibg=NONE", "guifg=#22FF22", },
    ["Normal"]     = { "guibg=NONE", "guifg=#00FF00", },
    ["Float"]      = { "guibg=NONE", },
    ["Group"]      = { "guibg=NONE", },
    ["Separator"]  = { "guibg=NONE", },
    ["Desc"]       = { "guibg=NONE", },
    ["Border"]     = { "guibg=NONE", "guifg=#777777", },
    ["Value"]      = { "gui=italic", "guibg=NONE", "guifg=#777777", },
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
  -- ["@string."] = {
  --   ["cpp"] = { "gui=NONE", "guibg=NONE", "guifg=#00DD99" },
  -- },
}

    -- hi MoreMsg guifg=#5fffff guibg=NONE gui=NONE cterm=NONE
    -- hi NonText guifg=#d787d7 guibg=NONE gui=NONE cterm=NONE
    -- hi StatusLine guifg=#000087 guibg=#5fffff gui=NONE cterm=NONE
    -- hi Type                 gui=italic guisp=#444444    "guibg=#444400   guifg=#000000
    -- hi ModeMsg              gui=NONE    guibg=#00ff00   guifg=#000087
    -- hi MoreMsg              gui=NONE    guibg=NONE      guifg=#5fffff
    -- hi NonText              gui=NONE    guibg=NONE      guifg=#00FF00
    -- -----Sign Column-----"
    -- -----Which Key-----"
    -- ------------------------Tree-Sitter------------------------#
        -- hi @punctuation.delimiter.cpp guibg=NONE guifg=#999999
        -- hi @punctuation.bracket.cpp gui=bold guibg=black guifg=#FF9900
        -- hi @type.vim
        -- hi @module                                      guifg=#00FF00
        -- hi @keyword                                     guifg=#777777
        -- hi @keyword.function                            guifg=#009900
        -- hi @function                                    guifg=#00AAAA
    -- ------------------------LSP-CPP----------------------------------"
        -- hi @lsp.type.variable.cpp=NONE
    -- -----Markdown--------"
        -- hi Title gui=bold guifg=green
        -- hi @markup.heading.7.markdown gui=bold              guibg=#999900 guifg=#000000
        --
        -- hi @markup.heading.markdown   gui=bold              guibg=#444444 guifg=#000000
        --
        -- hi @markup.raw.markdown_inline gui=bold guibg=#111111   guifg=#00FF00
        -- hi @conceal.markdown_inline    gui=NONE guibg=NONE      guifg=#009900
        -- hi @markup.link.label.markdown_inline gui=NONE guifg=#009999
        -- hi @markup.link.markdown_inline         gui=NONE
        -- hi @markup.link.url.markdown_inline     gui=NONE
        -- hi @_label.markdown_inline              gui=NONE
        -- hi @_url gui=NONE
        -- hi @_url.markdown_inline gui=NONE
        -- hi @nospell.markdown_inline gui=NONE
    -- hi @keyword.repeat guifg=#FF0000

-- if os.getenv("DISPLAY") then
--     -- hi Comment      gui=NONE guibg=#444444 guifg=#000000
--     hi Comment          gui=italic guifg=#005FEF guibg=NONE
-- else
--     hi Comment          gui=italic guifg=#005FEF guibg=NONE
-- endif

