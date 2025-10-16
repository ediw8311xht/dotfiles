
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


-- global return
local sl_session = "[%{v:lua.require('auto-session.lib').current_session_name()}]"
local sl_lsp_status = "[%#HLspStatus#%{LspStatus()} %*]"
local sl_filepath   = "[%F]"

-- vim.g.status_line_lists = {
--   [ 'default' ] = { "%t %r" , sl_session, "%m%=" ,    sl_lsp_status, sl_filepath },
--   [ 'small'   ] = { "%t %r" , "%m", sl_lsp_status },
--   [ 'large'   ] = { "%t %r" , sl_session , "%m%=" ,    sl_lsp_status, sl_filepath, "[%l,%c,%p%%]" },
-- }
vim.g.my_statuslines = {
  { 'default' , "%t %r" .. sl_session .. "%m%=" .. sl_lsp_status .. sl_filepath },
  { 'small'   , "%t %r" .. "%m"   .. sl_lsp_status },
  { 'large'   , "%t %r" .. sl_session .. "%m%=" .. sl_lsp_status .. sl_filepath .. "[%l,%c,%p%%]" },
}
-- { 'default' , "%t %r %m%=" .. lsp_status, filepath, ""             },
-- { 'small'   , '%t %r %m'   .. "[%#HLspStatus#%{LspStatus()} %*]"                 },
-- { 'large'   , "%t %r %m%=" .. lsp_status, filepath, "[%l,%c,%p%%]" },
-- { 'large'  , '%t %r %m' .. '[%#HLspStatus#%{LspStatus()} %*][%l %c%V% %P]'  },
-- '[%{LspStatus()}]\\ [%f] [%h%w%m%r%=%-14.(%l,%c%V%)\\ %P]',

----------------------------------------------------------
---------------------- FZF SETTINGS ----------------------
----------------------------------------------------------

vim.g.fzf_vim = {
  [ 'buffers_options' ] = {
    '--style'        ,  'full'      ,
    '--border-label' ,  "Buffers"   ,
    -- '--nth'          ,  '-1'        ,
    -- '--with-nth'     ,  '{-1}'      ,
  },
  [ 'colors_options' ] = {
    '--style'        ,  'full'      ,
    '--border-label' ,  "Colors"   ,
  },
  [ 'preview_window' ] = {
    'right,50%,<70(up,40%)', 'ctrl-/'
  }

}

vim.g.fzf_colors = {
  [ 'hl'     ] = { 'bg', 'Search' },
  [ 'hl+'    ] = { 'bg', 'Search' },
  -- [ 'border' ] = { 'bg', 'Ignore' },
}
-- `Colors`   |  `fzf#vim#colors([spec dict], [fullscreen bool])`
-- vim.g.fzf_vim.colors_options = {'--style', 'full', '--border-label', ' Open Buffers ', '--preview'}
vim.g.fzf_layout = {
  [ 'window' ] = { width = 0.9, height = 0.9, border = "sharp" } --, border = 'no' }
}

