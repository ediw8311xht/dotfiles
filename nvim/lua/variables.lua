
-- vim.api.nvim_set_hl
-- vim.highlight.create

require("my_highlight")
vim.g.MyDefaultScheme = { 'pop-punk', 'lua CorrectColors()' }
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


vim.g.my_statuslines = {
  { 'default' , "%t %r %m%=" .. "[%#HLspStatus#%{LspStatus()} %*][%F]"             },
  { 'small'   , '%t %r %m'   .. "[%#HLspStatus#%{LspStatus()} %*]"                 },
  { 'large'   , "%t %r %m%=" .. "[%#HLspStatus#%{LspStatus()} %*][%F][%l,%c,%p%%]" },
  -- { 'large'  , '%t %r %m' .. '[%#HLspStatus#%{LspStatus()} %*][%l %c%V% %P]'  },
  -- '[%{LspStatus()}]\\ [%f] [%h%w%m%r%=%-14.(%l,%c%V%)\\ %P]',
}

----------------------------------------------------------
---------------------- FZF SETTINGS ----------------------
----------------------------------------------------------
vim.g.fzf_vim = {
  [ 'buffers_options' ] = {
    '--style'        ,  'full'      ,
    '--no-border'
    -- '--border-label' ,  "Buffers"   ,
    -- '--nth'          ,  '-1'        ,
    -- '--with-nth'     ,  '{-1}'      ,
  }

}

vim.g.fzf_colors = {
  [ 'hl'     ] = { 'bg', 'Search' },
  [ 'hl+'    ] = { 'bg', 'Search' },
  -- [ 'border' ] = { 'bg', 'Ignore' },
}

vim.g.fzf_layout = {
  [ 'window' ] = { width = 0.9, height = 0.9 } --, border = 'no' }
}

