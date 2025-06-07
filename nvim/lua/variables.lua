vim.g.MyDefaultScheme = { 'pop-punk', 'call CorrectColors()' }
vim.g.MySchemes = {
    vim.g.MyDefaultScheme ,
    { 'vividchalk'     ,   "."  },
    { 'cyberpunk-neon' ,   "."  },
    { 'eldar'          ,   "."  },
    { 'elflord'        ,   "."  },
    { 'delek'          ,   "."  },
    { 'morning'        ,   "."  },
    { 'blue'           ,   "."  },
    { 'peachpuff'      ,   "."  },
    { 'industry'       ,   "."  },
    { 'murphy'         ,   "."  },
}

vim.g.MyColorTable = {
  { "#010101", "."       },
  { "#333333", "."       },
  { "#111111", "."       },
  { "#220000", "."       },
  { "#002200", "."       },
  { "#000022", "."       },
  { "#002244", "#aaawaa" },
  { "NONE",    "."       },
}

vim.g.python3_host_prog="/usr/bin/python"

vim.g.fzf_vim = {
  ["buffers_options"] = {
    '--ansi'         ,
    '--style'        ,  'full'      ,
    '--border-label' ,  "Buffers"   ,
    '--nth'          ,  '-1'        ,
    '--with-nth'     ,  '{-1}'      ,
  }

}

vim.g.fzf_colors = {
  [ "hl"  ]  = { 'bg', 'Search' },
  [ "hl+" ]  = { 'bg', 'Search' }
}
 -- { 'fg':      ['fg', 'Normal'],
 --   'bg':      ['bg', 'Normal'],
 --   'hl':      ['fg', 'Search'],
 --   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
 --   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
 --   'hl+':     ['fg', 'Visual'],
 --   'info':    ['fg', 'PreProc'],
 --   'border':  ['fg', 'StatusLineNC'],
 --   'prompt':  ['fg', 'Conditional'],
 --   'pointer': ['fg', 'Exception'],
 --   'marker':  ['fg', 'Keyword'],
 --   'spinner': ['fg', 'Label'],
 --   'header':  ['fg', 'Comment'] }
